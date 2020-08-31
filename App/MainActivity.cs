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
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme")]
    class MainActivity : AppCompatActivity
    {
        private RelativeLayout MainLayout;
        private GridLayout SecondaryLayout;
        private ImageButton Tasklist;
        private ImageButton Writelist;
        private ImageButton Settings;
        private ImageButton About;

        protected override void OnCreate(Bundle SavedInstanceState)
        {
            base.OnCreate(SavedInstanceState);
            SetContentView(Resource.Layout.activity_main);
            Initialize();
        }

        protected override void OnResume()
        {
            base.OnResume();

            Paint();
        }

        private void Paint()
        {
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Dark:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                default:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyLightColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyLightColor);
                        break;
                    }
                
            }
        }

        private void Initialize()
        {
            MainLayout = FindViewById<RelativeLayout>(Resource.Id.MainLayout);
            SecondaryLayout = FindViewById<GridLayout>(Resource.Id.SecondaryLayout);
            
            Tasklist = FindViewById<ImageButton>(Resource.Id.TaskList);
            Tasklist.Click += (s, e) => Utility.DisplayTaskList(this);

            Writelist = FindViewById<ImageButton>(Resource.Id.WriteList);
            Writelist.Click += (s, e) => Utility.DisplayWriteList(this);

            Settings = FindViewById<ImageButton>(Resource.Id.Settings);
            Settings.Click += (s, e) => { Utility.DisplaySettings(this); };

            About = FindViewById<ImageButton>(Resource.Id.About);
            About.Click += (s, e) => { Utility.DisplayAbout(this); };
        }
    }
}