using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Preferences;
using Android.Runtime;
using Android.Support.V4.Content;
using Android.Support.V7.App;
using Android.Views;
using Android.Widget;

namespace App
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppSplash", MainLauncher = true, NoHistory = true)]
    class SplashActivity : Activity
    {
        protected override void OnCreate(Bundle SavedInstanceState)
        {
            base.OnCreate(SavedInstanceState);
        }

        protected override void OnResume()
        {
            base.OnResume();
            if (!GlobalVariables.AppLoaded)
            {
                GlobalVariables.AppLoaded = true;
                GlobalVariables.Load();
            }

            Intent Intent = new Intent(this, typeof(MainActivity));
            StartActivity(Intent);
        }
    }
}