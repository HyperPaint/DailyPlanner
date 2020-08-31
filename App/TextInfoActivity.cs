using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Support.V7.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace App
{
    [Activity(Label = "@string/textinfo")]
    public class TextInfoActivity : AppCompatActivity
    {
        LinearLayout MainLayout;
        RelativeLayout SecondaryLayout;
        TextView Top, Text, Bottom;
        Button Close;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.activity_textinfo);
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
                
            }
        }

        void Initialize()
        {
            MainLayout = FindViewById<LinearLayout>(Resource.Id.MainLayout);
            SecondaryLayout = FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout);

            Top = FindViewById<TextView>(Resource.Id.Top);
            Top.Text = Intent.GetStringExtra("Top");

            Text = FindViewById<TextView>(Resource.Id.Text);
            Text.Text = Intent.GetStringExtra("Text");

            Bottom = FindViewById<TextView>(Resource.Id.Bottom);
            Bottom.Text = Intent.GetStringExtra("Bottom");

            Close = FindViewById<Button>(Resource.Id.Close);
            Close.Click += (s, e) => Finish();
        }
    }
}