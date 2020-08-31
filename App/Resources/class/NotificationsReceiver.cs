using Android.App;
using Android.Content;

namespace App
{
    //Рассылает уведомления
    [BroadcastReceiver(Name = "com.hyperpaint.app.TimeNotification", Enabled = true, Exported = false)]
    [IntentFilter(new[] { "com.hyperpaint.intent.action.notification" })]
    public class TimeNotification : BroadcastReceiver
    {
        private const string TAG = "TimeNotification";
        public override void OnReceive(Context context, Intent intent)
        {
            Android.Util.Log.Debug(TAG, "Notification");
            string Name = intent.GetStringExtra("Name");
            string Description = intent.GetStringExtra("Description");
            Utility.ShowNotification(Name, Description);
        }
    }
}