using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Preferences;
using Android.Runtime;
using Android.Support.V4.App;
using Android.Support.V7.App;
using Android.Views;
using Android.Widget;
namespace App
{
    [Activity(Label = "@string/settings")]
    public class SettingsActivity : AppCompatActivity
    {
        private RelativeLayout MainLayout;
        private LinearLayout SecondaryLayout;
        private RelativeLayout SecondaryLayout2, SecondaryLayout3;
        private RadioGroup RadioGroupTheme;
        //private RadioButton rbWhite, rbDark;
        private Switch tbNotification;
        private Switch tbNotifyAdvance;
        private EditText etNotifyMinutes;
        private Button bNotificationTest;
        private Button bDeleteTasks;
        private Button bDeleteWrites;
        private Button bDeleteAll;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_settings);
            Initialize();
        }

        protected override void OnStop()
        {
            base.OnStop();
            GlobalVariables.Save();
        }

        protected override void OnResume()
        {
            base.OnResume();

            Paint();
        }

        private void Paint()
        {
            MainLayout = FindViewById<RelativeLayout>(Resource.Id.MainLayout);
            SecondaryLayout = FindViewById<LinearLayout>(Resource.Id.SecondaryLayout);
            SecondaryLayout2 = FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout2);
            SecondaryLayout3 = FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout3);
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Dark:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout2.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout3.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                default:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyLightColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyLightColor);
                        SecondaryLayout2.SetBackgroundColor(GlobalVariables.MyLightColor);
                        SecondaryLayout3.SetBackgroundColor(GlobalVariables.MyLightColor);
                        break;
                    }
                
            }
        }

        private void Initialize()
        {
            RadioGroupTheme = FindViewById<RadioGroup>(Resource.Id.Theme);
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Light: { RadioGroupTheme.Check(Resource.Id.Light); break; }
                case UseTheme.Dark: { RadioGroupTheme.Check(Resource.Id.Dark); break; }
            }
            RadioGroupTheme.CheckedChange += (s, e) =>
            {
                switch (RadioGroupTheme.CheckedRadioButtonId)
                {
                    case Resource.Id.Light: { GlobalVariables.Preferences.UseTheme = UseTheme.Light; break; }
                    case Resource.Id.Dark: { GlobalVariables.Preferences.UseTheme = UseTheme.Dark; break; }
                }
                Paint();
            };

            /*
            rbLight = FindViewById<RadioButton>(Resource.Id.Light);
            rbDark = FindViewById<RadioButton>(Resource.Id.Dark);
            */

            tbNotification = FindViewById<Switch>(Resource.Id.Notification);
            tbNotification.Checked = GlobalVariables.Preferences.Notifications;
            tbNotification.Click += (s, e) =>
            {
                GlobalVariables.Preferences.Notifications = tbNotification.Checked;
                GlobalVariables.TWorker.Notifications();
                GlobalVariables.WWorker.Notifications();
            };

            tbNotifyAdvance = FindViewById<Switch>(Resource.Id.NotifyInAdvance);
            tbNotifyAdvance.Checked = GlobalVariables.Preferences.NotifyInAdvance;
            tbNotifyAdvance.Click += (s, e) =>
            {
                GlobalVariables.Preferences.NotifyInAdvance = tbNotifyAdvance.Checked;
                etNotifyMinutes.Enabled = tbNotifyAdvance.Checked;
            };

            etNotifyMinutes = FindViewById<EditText>(Resource.Id.TimeInMinutes);
            etNotifyMinutes.Enabled = GlobalVariables.Preferences.NotifyInAdvance;
            etNotifyMinutes.Text = GlobalVariables.Preferences.NotifyInAdvanceMinutes.ToString();
            etNotifyMinutes.TextChanged += (s, e) =>
            {
                try
                { GlobalVariables.Preferences.NotifyInAdvanceMinutes = Convert.ToInt32(etNotifyMinutes.Text); }
                catch
                { etNotifyMinutes.Text = "0";  GlobalVariables.Preferences.NotifyInAdvanceMinutes = 0; }
            };

            bNotificationTest = FindViewById<Button>(Resource.Id.NotificationTest);
            bNotificationTest.Click += (s, e) =>
            {
                TaskBlock TB = new TaskBlock();
                const long Time = 15000;
                Intent AlarmIntent = new Intent("com.hyperpaint.intent.action.notification");
                AlarmIntent.PutExtra("Name", TB.Name);
                AlarmIntent.PutExtra("Description", TB.Description);
                Utility.MakeNotification(AlarmIntent, int.MaxValue, Time, false);
                Toast.MakeText(this, Resource.String.nowcloseapp, ToastLength.Short).Show();
                Toast.MakeText(this, Resource.String.nowcloseappnext, ToastLength.Short).Show();
            };

            bDeleteTasks = FindViewById<Button>(Resource.Id.DeleteTasks);
            bDeleteTasks.Click += (s, e) => GlobalVariables.TWorker.DeleteAll(this);

            bDeleteWrites = FindViewById<Button>(Resource.Id.DeleteWrites);
            bDeleteWrites.Click += (s, e) => GlobalVariables.WWorker.DeleteAll(this);

            bDeleteAll = FindViewById<Button>(Resource.Id.ClearAll);
            bDeleteAll.Click += (s, e) => GlobalVariables.Clear(this);
        }
    }
}
 