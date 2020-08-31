using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android;
using Android.App;
using Android.Content;
using Android.Opengl;
using Android.OS;
using Android.Preferences;
using Android.Runtime;
using Android.Support.V7.App;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;

namespace App
{
    [Activity(Label = "@string/writes")]
    class WriteActivity : AppCompatActivity
    {
        private LinearLayout MainLayout;
        private RelativeLayout SecondaryLayout;
        private EditText EditSearch;
        private RecyclerView List;
        private WriteBlockAdapter ListAdapter = new WriteBlockAdapter();
        private ImageButton New;

        protected override void OnCreate(Bundle SavedInstanceState)
        {
            base.OnCreate(SavedInstanceState);

            SetContentView(Resource.Layout.activity_list);
            Initialize();
        }

        protected override void OnStop()
        {
            base.OnStop();

            GlobalVariables.WWorker.Save();
        }

        protected override void OnResume()
        {
            base.OnResume();

            Paint();
            ListAdapter.Reload();
        }

        private void Paint()
        {
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Dark:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        List.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                
            }
        }

        private void Initialize()
        {
            MainLayout = FindViewById<LinearLayout>(Resource.Id.MainLayout);
            SecondaryLayout = FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout);

            EditSearch = FindViewById<EditText>(Resource.Id.EditSearch);
            EditSearch.Text = string.Empty;
            EditSearch.TextChanged += (s, e) =>
            {
                ListAdapter.Data.Search(e.Text.ToString());
                ListAdapter.NotifyDataSetChanged();
            };

            List = FindViewById<RecyclerView>(Resource.Id.List);
            LinearLayoutManager LayoutManager = new LinearLayoutManager(Application.Context, LinearLayoutManager.Vertical, false);
            List.SetLayoutManager(LayoutManager);
            List.SetAdapter(ListAdapter);
            ListAdapter.OpenClick += (s, e) => GlobalVariables.WWorker.Open(e, this);
            ListAdapter.ChangeClick += (s, e) => { GlobalVariables.WWorker.LastPosition = e; Utility.DisplayWriteForm(this); };
            ListAdapter.DeleteClick += (s, e) => GlobalVariables.WWorker.Delete(e); 
            ListAdapter.ItemClick += (s, e) => { };

            New = FindViewById<ImageButton>(Resource.Id.New);
            New.Click += (s, e) => { GlobalVariables.WWorker.LastPosition = -1; Utility.DisplayWriteForm(this); };
        }
    }
}