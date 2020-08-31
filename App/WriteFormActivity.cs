using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Support.V7.App;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;

namespace App
{
    [Activity(Label = "@string/write")]
    class WriteFormActivity : AppCompatActivity
    {
        private LinearLayout MainLayout;
        private RelativeLayout SecondaryLayout;
        private LinearLayout SecondaryLayout2;
        private EditText etName;
        private EditText etDescription;

        private CheckBox cbFixed;

        private Block.Icon SelectedIconId = Block.Icon.noicon;
        private RecyclerView rvIconList;
        private IconAdapter Adapter = new IconAdapter();

        private Button bSave;
        private Button bClose;

        protected override void OnCreate(Bundle SavedInstanceState)
        {
            base.OnCreate(SavedInstanceState);
            SetContentView(Resource.Layout.activity_write_form);
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
        }
        private void Paint()
        {
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Dark:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout2.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                
            }
        }

        private void Initialize()
        {
            MainLayout = FindViewById<LinearLayout>(Resource.Id.MainLayout);
            SecondaryLayout = FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout);
            SecondaryLayout2 = FindViewById<LinearLayout>(Resource.Id.SecondaryLayout2);

            etName = FindViewById<EditText>(Resource.Id.Name);
            etDescription = FindViewById<EditText>(Resource.Id.Description);

            cbFixed = FindViewById<CheckBox>(Resource.Id.Fixed);

            rvIconList = FindViewById<RecyclerView>(Resource.Id.IconList);
            LinearLayoutManager LayoutManager = new LinearLayoutManager(Application.Context, LinearLayoutManager.Horizontal, false);
            rvIconList.SetLayoutManager(LayoutManager);
            rvIconList.SetAdapter(Adapter);
            Adapter.ItemClick += IconClick;

            bSave = FindViewById<Button>(Resource.Id.Save);
            bSave.Click += Save;
            bClose = FindViewById<Button>(Resource.Id.Close);
            bClose.Click += Close;

            //загрузка из указателя
            if (GlobalVariables.WWorker.LastPosition >= 0)
            {
                WriteBlock WB = GlobalVariables.WWorker.BlockList[GlobalVariables.WWorker.LastPosition];

                etName.Text = WB.Name;
                etDescription.Text = WB.Description;
                cbFixed.Checked = WB.Fixed;
            }
        }

        private void IconClick(object sender, int Position)
        {
            SelectedIconId = (Block.Icon)Position;
            Toast.MakeText(Application.Context, Resource.String.selected, ToastLength.Short).Show();
        }

        private void Save(object sender, EventArgs eventArgs)
        {
            if (GlobalVariables.WWorker.LastPosition != -1)
            {
                int Position = GlobalVariables.WWorker.LastPosition;
                string Name = etName.Text;
                DateTime Created = GlobalVariables.WWorker.BlockList[Position].Created;
                string Description = etDescription.Text;
                GlobalVariables.WWorker.Change(Position, new WriteBlock(Name, SelectedIconId, Created, Description, cbFixed.Checked));
            }
            else
            {
                string Name = etName.Text;
                DateTime Created = DateTime.Now;
                string Description = etDescription.Text;
                GlobalVariables.WWorker.Add(new WriteBlock(Name, SelectedIconId, Created, Description, cbFixed.Checked));
            }
            Finish();
        }

        private void Close(object sender, EventArgs eventArgs)
        {
            Finish();
        }
    }
}