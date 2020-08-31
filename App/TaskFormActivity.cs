using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Android;
using Android.App;
using Android.Content;
using Android.Graphics;
using Android.Graphics.Drawables;
using Android.OS;
using Android.Runtime;
using Android.Service.Autofill;
using Android.Support.V7.App;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;

namespace App
{
    [Activity(Label = "@string/task")]
    class TaskFormActivity : AppCompatActivity
    {
        private LinearLayout MainLayout;
        private RelativeLayout SecondaryLayout;
        private LinearLayout SecondaryLayout2, SecondaryLayout3;
        private EditText etName, etDescription;

        private CheckBox cbUrgent, cbImportant;

        private EditText etDateSelect, etTimeSelect;
        private bool UseDate = false;
        private bool UseTime = false;
        private bool UseDateTime = false;
        public static DateTime SelectedDateTime { get; private set; }
        private Button bDateForget;

        private RadioGroup rgRadioGroupRepeat;
        private RadioButton rbNoRepeat, rbDays, rbWeek, rbMonth, rbYear;
        private EditText etDays;

        private Block.Icon SelectedIconId = Block.Icon.noicon;
        private RecyclerView rvIconList;
        private IconAdapter Adapter = new IconAdapter();

        private Button bSave, bClose;

        protected override void OnCreate(Bundle SavedInstanceState)
        {
            base.OnCreate(SavedInstanceState);

            SetContentView(Resource.Layout.activity_task_form);
            Initialize();
        }

        protected override void OnStop()
        {
            base.OnStop();

            GlobalVariables.TWorker.Save();
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
                        SecondaryLayout3.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        rgRadioGroupRepeat.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                
            }
        }

        private void Initialize()
        {
            MainLayout = FindViewById<LinearLayout>(Resource.Id.MainLayout);
            SecondaryLayout = FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout);
            SecondaryLayout2 = FindViewById<LinearLayout>(Resource.Id.SecondaryLayout2);
            SecondaryLayout3 = FindViewById<LinearLayout>(Resource.Id.SecondaryLayout3);

            etName = FindViewById<EditText>(Resource.Id.Name);
            etDescription = FindViewById<EditText>(Resource.Id.Description);

            cbUrgent = FindViewById<CheckBox>(Resource.Id.Urgent);
            cbImportant = FindViewById<CheckBox>(Resource.Id.Important);

            etDateSelect = FindViewById<EditText>(Resource.Id.DateSelect);
            etDateSelect.Focusable = false;
            etDateSelect.Click += DateSelect;
            etTimeSelect = FindViewById<EditText>(Resource.Id.TimeSelect);
            etTimeSelect.Focusable = false;
            etTimeSelect.Click += TimeSelect;
            bDateForget = FindViewById<Button>(Resource.Id.DateTimeForget);
            bDateForget.Click += DateForget;

            rgRadioGroupRepeat = FindViewById<RadioGroup>(Resource.Id.RadioGroup);
            rgRadioGroupRepeat.CheckedChange += RadioGroupCheckedChange;

            rbNoRepeat = FindViewById<RadioButton>(Resource.Id.NoRepeat);
            rbDays = FindViewById<RadioButton>(Resource.Id.Days);
            etDays = FindViewById<EditText>(Resource.Id.DaysEdit);
            rbWeek = FindViewById<RadioButton>(Resource.Id.Week);
            rbMonth = FindViewById<RadioButton>(Resource.Id.Month);
            rbYear = FindViewById<RadioButton>(Resource.Id.Year);

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
            if (GlobalVariables.TWorker.LastPosition != -1)
            {
                Load();
            }
        }

        private void Load()
        {
            TaskBlock TB = GlobalVariables.TWorker.BlockList[GlobalVariables.TWorker.LastPosition];

            etName.Text = TB.Name;
            etDescription.Text = TB.Description;
            cbUrgent.Checked = TB.IsUrgent();
            cbImportant.Checked = TB.IsImportant();
            if (TB.UseDate)
            {
                UseDate = true;
                UseTime = true;
                UseDateTime = true;
                SelectedDateTime = TB.Date;
                etDateSelect.Text = SelectedDateTime.ToShortDateString();
                etTimeSelect.Text = SelectedDateTime.ToShortTimeString();
                rbNoRepeat.Enabled = true;
                rbDays.Enabled = true;
                rbWeek.Enabled = true;
                rbMonth.Enabled = true;
                rbYear.Enabled = true;
            }
            switch (TB.RepeatType)
            {
                case TaskBlock.Repeat.no_repeat: { rgRadioGroupRepeat.Check(Resource.Id.NoRepeat); break; }
                case TaskBlock.Repeat.every_x_day: { rgRadioGroupRepeat.Check(Resource.Id.Days); break; }
                case TaskBlock.Repeat.selected_day_week: { rgRadioGroupRepeat.Check(Resource.Id.Week); break; }
                case TaskBlock.Repeat.selected_day_month: { rgRadioGroupRepeat.Check(Resource.Id.Month); break; }
                case TaskBlock.Repeat.selected_day_year: { rgRadioGroupRepeat.Check(Resource.Id.Year); break; }
            }
            etDays.Text = TB.RepeatDay.ToString();
            SelectedIconId = TB.IconId;

        }

        private void RadioGroupCheckedChange(Object sender, RadioGroup.CheckedChangeEventArgs e)
        {
            switch (e.CheckedId)
            {
                case Resource.Id.NoRepeat: { etDays.Enabled = false; break; }
                case Resource.Id.Days: { etDays.Enabled = true; break; }
                case Resource.Id.Week: { etDays.Enabled = false; break; }
                case Resource.Id.Month: { etDays.Enabled = false; break; }
                case Resource.Id.Year: { etDays.Enabled = false; break; }
            }
        }

        private void DateSelect(object sender, EventArgs eventArgs)
        {
            DatePickerFragment Fragment = DatePickerFragment.NewInstance(DateChange);
            Fragment.Show(FragmentManager, DatePickerFragment.TAG);
        }

        private void DateChange(DateTime Date)
        {
            UseDate = true;
            UseDateTime = true;
            if (UseTime) SelectedDateTime = Date.AddHours(SelectedDateTime.Hour);
            else SelectedDateTime = Date;

            etDateSelect.Text = Date.ToShortDateString();

            rbNoRepeat.Enabled = true;
            rbDays.Enabled = true;
            rbWeek.Enabled = true;
            rbMonth.Enabled = true;
            rbYear.Enabled = true;
        }

        private void TimeSelect(object sender, EventArgs eventArgs)
        {
            TimePickerFragment Fragment = TimePickerFragment.NewInstance(TimeChange);
            Fragment.Show(FragmentManager, TimePickerFragment.TAG);
        }

        private void TimeChange(DateTime Time)
        {
            UseTime = true;
            UseDateTime = true;
            SelectedDateTime = Time;

            etTimeSelect.Text = Time.ToShortTimeString();

            rbNoRepeat.Enabled = true;
            rbDays.Enabled = true;
            rbWeek.Enabled = true;
            rbMonth.Enabled = true;
            rbYear.Enabled = true;
        }

        private void DateForget(object sender, EventArgs eventArgs)
        {
            UseDate = false;
            UseTime = false;
            UseDateTime = false;

            etDateSelect.Text = string.Empty;
            etTimeSelect.Text = string.Empty;

            rbNoRepeat.Enabled = false;
            rbDays.Enabled = false;
            rbWeek.Enabled = false;
            rbMonth.Enabled = false;
            rbYear.Enabled = false;
        }

        private void IconClick(object sender, int Position)
        {
            SelectedIconId = (Block.Icon)Position;
            Toast.MakeText(Application.Context, Resource.String.selected, ToastLength.Short).Show();
        }

        private void Save(object sender, EventArgs eventArgs)
        {
            TaskBlock.UrgentImportant UrgentImportant = TaskBlock.UrgentImportant.noturgent_notimportant;
            if (cbUrgent.Checked && cbImportant.Checked) UrgentImportant = TaskBlock.UrgentImportant.urgent_important;
            else if (cbUrgent.Checked && !cbImportant.Checked) UrgentImportant = TaskBlock.UrgentImportant.urgent_notimportant;
            else if (!cbUrgent.Checked && cbImportant.Checked) UrgentImportant = TaskBlock.UrgentImportant.noturgent_important;
            else if (!cbUrgent.Checked && !cbImportant.Checked) UrgentImportant = TaskBlock.UrgentImportant.noturgent_notimportant;

            TaskBlock.Repeat Repeat = TaskBlock.Repeat.no_repeat;
            switch (rgRadioGroupRepeat.CheckedRadioButtonId)
            {
                case Resource.Id.NoRepeat: { Repeat = TaskBlock.Repeat.no_repeat; break; }
                case Resource.Id.Days: { Repeat = TaskBlock.Repeat.every_x_day; break; }
                case Resource.Id.Week: { Repeat = TaskBlock.Repeat.selected_day_week; break; }
                case Resource.Id.Month: { Repeat = TaskBlock.Repeat.selected_day_month; break; }
                case Resource.Id.Year: { Repeat = TaskBlock.Repeat.selected_day_year; break; }
            }

            int DaysNumber = 0;
            if (rgRadioGroupRepeat.CheckedRadioButtonId == Resource.Id.Days)
            {
                try
                { DaysNumber = Convert.ToInt32(etDays.Text); }
                catch
                { etDays.Text = "0";  DaysNumber = 0; }
            }

            if (UseDateTime)
            {
                if (!UseDate)
                {
                    SelectedDateTime = DateTime.Now.Date.AddHours(SelectedDateTime.Hour).AddMinutes(SelectedDateTime.Minute);
                }
                if (!UseTime)
                {
                    SelectedDateTime = SelectedDateTime.AddHours(-SelectedDateTime.Hour).AddMinutes(-SelectedDateTime.Minute);
                    SelectedDateTime = SelectedDateTime.AddHours(DateTime.Now.Hour).AddMinutes(DateTime.Now.Minute);
                }
            }
            
            if (GlobalVariables.TWorker.LastPosition != -1)
            {
                int Position = GlobalVariables.TWorker.LastPosition;
                string Name = etName.Text;
                DateTime Created = GlobalVariables.TWorker.BlockList[Position].Created;
                string Description = etDescription.Text;
                GlobalVariables.TWorker.Change(Position, new TaskBlock(Name, SelectedIconId, Created, Description, UrgentImportant, Repeat, DaysNumber, UseDateTime, SelectedDateTime));
            }
            else
            {
                string Name = etName.Text;
                DateTime Created = DateTime.Now;
                string Description = etDescription.Text;
                GlobalVariables.TWorker.Add(new TaskBlock(Name, SelectedIconId, Created, Description, UrgentImportant, Repeat, DaysNumber, UseDateTime, SelectedDateTime));
            }
            Finish();
        }

        private void Close(object sender, EventArgs eventArgs)
        {
            Finish();
        }
    }

    class DatePickerFragment : DialogFragment, DatePickerDialog.IOnDateSetListener
    {
        //tag любая строка
        public static readonly string TAG = "X:" + typeof(DatePickerFragment).Name.ToUpper();

        //инициализация
        Action<DateTime> DateSelected = delegate { };

        public static DatePickerFragment NewInstance(Action<DateTime> OnDateSelected)
        {
            DatePickerFragment Fragment = new DatePickerFragment();
            Fragment.DateSelected = OnDateSelected;
            return Fragment;
        }

        public override Dialog OnCreateDialog(Bundle SavedInstanceState)
        {
            DateTime Currently = DateTime.Now;
            DatePickerDialog Dialog = new DatePickerDialog(Activity, this, Currently.Year, Currently.Month - 1, Currently.Day);
            return Dialog;
        }

        public void OnDateSet(DatePicker View, int Year, int Month, int Day)
        {
            //месяц от 0 до 11
            DateTime SelectedDate = new DateTime(Year, Month + 1, Day);
            DateSelected(SelectedDate);
        }
    }

    class TimePickerFragment : DialogFragment, TimePickerDialog.IOnTimeSetListener
    {
        //tag любая строка
        public static readonly string TAG = "X:" + typeof(DatePickerFragment).Name.ToUpper();

        //инициализация
        Action<DateTime> DateTimeSelected = delegate { };

        public static TimePickerFragment NewInstance(Action<DateTime> OnTimeSelected)
        {
            TimePickerFragment Fragment = new TimePickerFragment();
            Fragment.DateTimeSelected = OnTimeSelected;
            return Fragment;
        }

        public override Dialog OnCreateDialog(Bundle SavedInstanceState)
        {
            DateTime Currently = DateTime.Now;
            TimePickerDialog Dialog = new TimePickerDialog(Activity, this, Currently.Hour, Currently.Minute, true);
            return Dialog;
        }

        public void OnTimeSet(TimePicker view, int hourOfDay, int minute)
        {
            //месяц от 0 до 11
            DateTime SelectedDateTime = new DateTime(TaskFormActivity.SelectedDateTime.Year, TaskFormActivity.SelectedDateTime.Month, TaskFormActivity.SelectedDateTime.Day, hourOfDay, minute, 0);
            DateTimeSelected(SelectedDateTime);
        }
    }
}