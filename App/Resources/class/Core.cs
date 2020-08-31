using System;
using Android;
using Android.App;
using Android.Content;
using Android.Graphics;
using Android.OS;
using Android.Support.V4.App;
using Android.Support.V7.App;
using Android.Widget;

namespace App
{
    static class Utility
    {
        public static bool PermissionCheck(Activity Activity, string permission)
        {
            if ((int)Build.VERSION.SdkInt >= 23)
            {
                if (Activity.CheckSelfPermission(permission) == Android.Content.PM.Permission.Granted)
                {
                    return true;
                }
                else
                {
                    Activity.RequestPermissions(new string[] { permission }, 0);
                    return false;
                }
            }
            else
            {
                return true;
            }
        }

        public static void DisplayTaskList(Activity Activity)
        {
            Intent Intent = new Intent(Activity, typeof(TaskActivity));
            Activity.StartActivity(Intent);
        }

        public static void DisplayWriteList(Activity Activity)
        {
            Intent Intent = new Intent(Activity, typeof(WriteActivity));
            Activity.StartActivity(Intent);
        }

        public static void DisplayTaskForm(Activity Activity)
        {
            Intent Intent = new Intent(Activity, typeof(TaskFormActivity));
            Activity.StartActivity(Intent);
        }

        public static void DisplayWriteForm(Activity Activity)
        {
            Intent Intent = new Intent(Activity, typeof(WriteFormActivity));
            Activity.StartActivity(Intent);
        }

        public static void DisplaySettings(Activity Activity)
        {
            Intent Intent = new Intent(Activity, typeof(SettingsActivity));
            Activity.StartActivity(Intent);
        }

        public static void DisplayTextInfo(Activity Activity, string Top, string Text, string Bottom)
        {
            Intent Intent = new Intent(Activity, typeof(TextInfoActivity));
            Intent.PutExtra("Top", Top);
            Intent.PutExtra("Text", Text);
            Intent.PutExtra("Bottom", Bottom);
            Activity.StartActivity(Intent);
        }

        public static void DisplayAbout(Activity Activity)
        {
            string Top = Application.Context.GetString(Resource.String.about);
            string Text = Application.Context.GetString(Resource.String.textabout);
            string Bottom = string.Empty;
            DisplayTextInfo(Activity, Top, Text, Bottom);
        }

        public static AlarmManager Alarm = (AlarmManager)Application.Context.GetSystemService(Context.AlarmService);

        public static void MakeNotification(Intent Data, int Id, long TimeMillis, bool NotifyInAdvance = true)
        {
            long Minutes = 0;
            if (NotifyInAdvance)
            if (GlobalVariables.Preferences.NotifyInAdvance) Minutes = Convert.ToInt64(TimeSpan.FromMinutes(Convert.ToDouble(GlobalVariables.Preferences.NotifyInAdvanceMinutes)).TotalMilliseconds);
            TimeMillis = TimeMillis - Minutes;
            PendingIntent pIntent = PendingIntent.GetBroadcast(Application.Context, Id, Data, PendingIntentFlags.CancelCurrent);
            if (TimeMillis > 0)
            {
                if ((int)Build.VERSION.SdkInt < 23)
                {
                    if ((int)Build.VERSION.SdkInt >= 19)
                    {
                        Alarm.SetExact(AlarmType.ElapsedRealtimeWakeup, SystemClock.ElapsedRealtime() + TimeMillis, pIntent);
                    }
                    else
                    {
                        Alarm.Set(AlarmType.ElapsedRealtimeWakeup, SystemClock.ElapsedRealtime() + TimeMillis, pIntent);
                    }
                }
                else
                {
                    Alarm.SetExactAndAllowWhileIdle(AlarmType.ElapsedRealtimeWakeup, SystemClock.ElapsedRealtime() + TimeMillis, pIntent);
                }
            }
        }

        public static void ShowNotification(string Name, string Text)
        {
            Intent newIntent = new Intent(Application.Context, typeof(SplashActivity));

            Android.Support.V4.App.TaskStackBuilder StackBuilder = Android.Support.V4.App.TaskStackBuilder.Create(Application.Context);
            StackBuilder.AddParentStack(Java.Lang.Class.FromType(typeof(SplashActivity)));
            StackBuilder.AddNextIntent(newIntent);

            PendingIntent pIntent = StackBuilder.GetPendingIntent(0, (int)PendingIntentFlags.UpdateCurrent);

            NotificationCompat.Builder Builder = new NotificationCompat.Builder(Application.Context);
            Builder.SetAutoCancel(true);
            Builder.SetDefaults((int)NotificationDefaults.All);
            Builder.SetContentIntent(pIntent);
            Builder.SetContentTitle(Name);
            Builder.SetContentText(Text);
            Builder.SetSmallIcon(Resource.Mipmap.ic_launcher_round);

            NotificationManager Notification = (NotificationManager)Application.Context.GetSystemService(Context.NotificationService);
            Notification.Notify(0, Builder.Build());
        }
    }

    public enum UseTheme : int
    {
        Light,
        Dark
    }

    struct Preferences
    {
        public bool Notifications;
        public bool NotifyInAdvance;
        public int NotifyInAdvanceMinutes;
        public UseTheme UseTheme;
    }

    static class GlobalVariables
    {
        private static int Version = 1;
        private static int PreviousVersion;
        private const string TAG = "GlobalVariables";
        public static bool AppLoaded = false;

        public static TaskWorker TWorker = new TaskWorker();
        public static WriteWorker WWorker = new WriteWorker();
        public static Preferences Preferences;

        public static Color MyLightColor { get; private set; } = Color.Argb(255, 255, 255, 255);
        public static Color MyDarkColor { get; private set; } = Color.Argb(255, 200, 162, 200);

        public static void Save()
        {
            Android.Util.Log.Debug(TAG, "Save");
            ISharedPreferences SharedPreferences = Android.Preferences.PreferenceManager.GetDefaultSharedPreferences(Application.Context);
            ISharedPreferencesEditor Save = SharedPreferences.Edit();

            Save.PutInt("Version", Version);
            Save.PutBoolean("SettingsNotifications", Preferences.Notifications);
            Save.PutBoolean("SettingsNotifyInAdvance", Preferences.NotifyInAdvance);
            Save.PutInt("SettingsNotifyInAdvanceMinutes", Preferences.NotifyInAdvanceMinutes);
            Save.PutInt("SettingsUseTheme", (int)Preferences.UseTheme);
            Save.Apply();

            TWorker.Save();
            WWorker.Save();
        }

        public static void Load()
        {
            Android.Util.Log.Debug(TAG, "Load");
            ISharedPreferences SharedPreferences = Android.Preferences.PreferenceManager.GetDefaultSharedPreferences(Application.Context);

            PreviousVersion = SharedPreferences.GetInt("Version", 0);
            Preferences.Notifications = SharedPreferences.GetBoolean("SettingsNotifications", true);
            Preferences.NotifyInAdvance = SharedPreferences.GetBoolean("SettingsNotifyInAdvance", false);
            Preferences.NotifyInAdvanceMinutes = SharedPreferences.GetInt("SettingsNotifyInAdvanceMinutes", 0);
            Preferences.UseTheme = (UseTheme)SharedPreferences.GetInt("SettingsUseTheme", (int)UseTheme.Light);

            TWorker.Load();
            WWorker.Load();
        }

        public static void Clear(Activity Activity)
        {
            Android.Util.Log.Debug(TAG, "Clear");
            Dialog DeleteDialog = new Dialog(Activity);
            DeleteDialog.SetContentView(Resource.Layout.dialog_delete);

            Button Yes = DeleteDialog.FindViewById<Button>(Resource.Id.Yes);
            Yes.Click += (s, e) =>
            {
                ISharedPreferences SharedPreferences = Android.Preferences.PreferenceManager.GetDefaultSharedPreferences(Application.Context);
                ISharedPreferencesEditor Save = SharedPreferences.Edit();
                Save.Clear();
                Save.Apply();
                DeleteDialog.Dismiss();
                Activity.Finish();
            };

            Button No = DeleteDialog.FindViewById<Button>(Resource.Id.No);
            No.Click += (s, e) => DeleteDialog.Dismiss();

            DeleteDialog.SetCancelable(true);
            DeleteDialog.SetCanceledOnTouchOutside(true);
            DeleteDialog.Show();
        }
    }
}