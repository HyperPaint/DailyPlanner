using Android.App;
using Android.Content;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace App
{
    public abstract class BlockWorker<T> where T : Block
    {
        protected string TAG = "BlockWorker";
        public List<T> BlockList = new List<T>();
        public int LastPosition; //Для форм

        protected const string DATEFORMAT = "yyyy-MM-dd mm:HH:ss";

        protected virtual void Sort()
        {
            Block.Sort(ref BlockList);
        }

        protected bool Saved = true;

        protected ISharedPreferences SharedPreferences = Android.Preferences.PreferenceManager.GetDefaultSharedPreferences(Application.Context);

        public abstract void SaveProcess();

        public void Save()
        {
            if (!Saved)
            {
                Android.Util.Log.Debug(TAG, "Save");
                SaveProcess();
                Saved = true;
            }
        }

        public abstract void LoadProcess();

        public void Load()
        {
            Android.Util.Log.Debug(TAG, "Load");
            LoadProcess();
        }

        public abstract void NotificationsProcess();

        public void Notifications()
        {
            if (GlobalVariables.Preferences.Notifications)
            {
                Android.Util.Log.Debug(TAG, "Notifications");
                NotificationsProcess();
            }
        }

        public void Add(T Block)
        {
            Android.Util.Log.Debug(TAG, "Add");
            BlockList.Add(Block);
            Sort();
            Saved = false;
        }

        public void Add(T[] Block)
        {
            Android.Util.Log.Debug(TAG, "Add[]");
            BlockList.AddRange(Block);
            Sort();
            Saved = false;
        }

        /*public  void AddSubBlock(int Position, T Block)
        {
            Android.Util.Log.Debug(TAG, "AddSubtask");
            BlockList[Position].AddSubBlock(Block);
            //создать пустую задачу
            //назначить в подзадачу задаче position
            //открыть окно редактирования
            Saved = false;
        }*/

        public void Delete(int Position)
        {
            Android.Util.Log.Debug(TAG, "Delete");
            BlockList.RemoveAt(Position);
            Saved = false;
        }

        public void DeleteAll(Activity Activity)
        {
            Android.Util.Log.Debug(TAG, "DeleteAll");
            Dialog DeleteDialog = new Dialog(Activity);
            DeleteDialog.SetContentView(Resource.Layout.dialog_delete);

            Button Yes = DeleteDialog.FindViewById<Button>(Resource.Id.Yes);
            Yes.Click += (s, e) =>
            {
                BlockList.Clear();
                Toast.MakeText(Application.Context, Resource.String.clear, ToastLength.Short).Show();
                DeleteDialog.Dismiss();
                Saved = false;
            };

            Button No = DeleteDialog.FindViewById<Button>(Resource.Id.No);
            No.Click += (s, e) => DeleteDialog.Dismiss();

            DeleteDialog.SetCancelable(true);
            DeleteDialog.SetCanceledOnTouchOutside(true);
            DeleteDialog.Show();
        }
    }

    public class TaskWorker : BlockWorker<TaskBlock>
    {
        public TaskWorker()
        {
            TAG = "TaskWorker";
        }

        ~TaskWorker()
        {
            Save();
        }

        protected override void Sort()
        {
            TaskBlock.Sort(ref BlockList);
        }

        public override void SaveProcess()
        {
            int PreviousTaskCount = SharedPreferences.GetInt("TaskCount", 0);
            ISharedPreferencesEditor Save = SharedPreferences.Edit();
            Save.PutInt("TaskCount", BlockList.Count);
            for (int i = 0; i < BlockList.Count; i++)
            {
                Save.PutString("TaskName" + i.ToString(), BlockList[i].Name);
                Save.PutString("TaskDescription" + i.ToString(), BlockList[i].Description);
                Save.PutInt("TaskIconId" + i.ToString(), (int)BlockList[i].IconId);
                Save.PutString("TaskCreated" + i.ToString(), BlockList[i].Created.ToString(DATEFORMAT));

                Save.PutInt("TaskUrgImpType" + i.ToString(), (int)BlockList[i].UrgentImportantType);
                Save.PutInt("TaskRepeatType" + i.ToString(), (int)BlockList[i].RepeatType);
                Save.PutInt("TaskRepeatDay" + i.ToString(), BlockList[i].RepeatDay);
                Save.PutBoolean("TaskUseData" + i.ToString(), BlockList[i].UseDate);
                Save.PutString("TaskDate" + i.ToString(), BlockList[i].Date.ToString(DATEFORMAT));

            }
            while (BlockList.Count <= PreviousTaskCount)
            {
                Save.Remove("TaskName" + PreviousTaskCount.ToString());
                Save.Remove("TaskDescription" + PreviousTaskCount.ToString());
                Save.Remove("TaskIconId" + PreviousTaskCount.ToString());
                Save.Remove("TaskCreated" + PreviousTaskCount.ToString());

                Save.Remove("TaskUrgImpType" + PreviousTaskCount.ToString());
                Save.Remove("TaskRepeatType" + PreviousTaskCount.ToString());
                Save.Remove("TaskRepeatDay" + PreviousTaskCount.ToString());
                Save.Remove("TaskUseData" + PreviousTaskCount.ToString());
                Save.Remove("TaskDate" + PreviousTaskCount.ToString());

                PreviousTaskCount--;
            }
            Save.Apply();
            Notifications();
        }

        public override void LoadProcess()
        {
            int Count = SharedPreferences.GetInt("TaskCount", 0);
            for (int i = 0; i < Count; i++)
            {
                string Name = SharedPreferences.GetString("TaskName" + i.ToString(), string.Empty);
                string Description = SharedPreferences.GetString("TaskDescription" + i.ToString(), string.Empty);
                Block.Icon IconId = (Block.Icon)SharedPreferences.GetInt("TaskIconId" + i.ToString(), Resource.Drawable.nopicture);
                DateTime Created;
                try
                {
                    Created = DateTime.ParseExact(SharedPreferences.GetString("TaskCreated" + i.ToString(), DateTime.Now.ToString(DATEFORMAT)), DATEFORMAT, CultureInfo.InvariantCulture);
                }
                catch
                {
                    Created = DateTime.Now;
                }

                TaskBlock.UrgentImportant UrgentImportantType = (TaskBlock.UrgentImportant)SharedPreferences.GetInt("TaskUrgImpType" + i.ToString(), 0);
                TaskBlock.Repeat RepeatType = (TaskBlock.Repeat)SharedPreferences.GetInt("TaskRepeatType" + i.ToString(), 0);
                int RepeatDay = SharedPreferences.GetInt("TaskRepeatDay" + i.ToString(), 0);
                bool UseBool = SharedPreferences.GetBoolean("TaskUseData" + i.ToString(), false);
                DateTime Date;
                try
                {
                    Date = DateTime.ParseExact(SharedPreferences.GetString("TaskDate" + i.ToString(), DateTime.Now.ToString(DATEFORMAT)), DATEFORMAT, CultureInfo.InvariantCulture);
                }
                catch
                {
                    Date = DateTime.Now;
                }


                Add(new TaskBlock(Name, IconId, Created, Description, UrgentImportantType, RepeatType, RepeatDay, UseBool, Date));
            }
        }

        public override void NotificationsProcess()
        {
            //поиск задач для создания уведомления
            Queue<TaskBlock> Blocks = new Queue<TaskBlock>();
            for (int i = 0; i < BlockList.Count; i++)
            {
                if (BlockList[i].UseDate)
                {
                    if (BlockList[i].Date > DateTime.Now)
                    {
                        Blocks.Enqueue(BlockList[i]);
                    }
                }
                else
                {
                    break;
                }
            }
            if (Blocks.Count > 0)
            {
                //создание новых, переписывая старые, если есть
                Intent AlarmIntent;
                TaskBlock TB;
                long Time;
                int Counter = 0;
                while (Blocks.Count > 0)
                {
                    TB = Blocks.Dequeue();
                    Time = Convert.ToInt64((TB.Date - DateTime.Now).TotalMilliseconds);
                    AlarmIntent = new Intent("com.hyperpaint.intent.action.notification");
                    AlarmIntent.PutExtra("Name", TB.Name);
                    AlarmIntent.PutExtra("Description", TB.Description);
                    Utility.MakeNotification(AlarmIntent, Counter, Time);

                    Counter++;
                }
                //удаление остатков
                int PreviousCounter = SharedPreferences.GetInt("TaskNotificationsCount", 0);
                AlarmIntent = new Intent(Application.Context, typeof(TimeNotification));
                while (Counter <= PreviousCounter)
                {
                    PendingIntent pIntent = PendingIntent.GetBroadcast(Application.Context, PreviousCounter, AlarmIntent, PendingIntentFlags.CancelCurrent);
                    Utility.Alarm.Cancel(pIntent);
                    PreviousCounter--;
                }
                Android.Util.Log.Debug(TAG, "Count = " + Counter.ToString());
                ISharedPreferencesEditor Save = SharedPreferences.Edit();
                Save.PutInt("TaskNotificationsCount", Counter);
                Save.Apply();
            }
        }

        public bool Complete(int Position)
        {
            Android.Util.Log.Debug(TAG, "Complete");
            bool ForReturn = true;
            if (!BlockList[Position].Complete())
            {
                BlockList.RemoveAt(Position);
                ForReturn = false;
            }
            Sort();
            Saved = false;
            return ForReturn;
        }

        public void Change(int Position, TaskBlock Block)
        {
            Android.Util.Log.Debug(TAG, "Change");
            BlockList[Position].Change(Block);
            Sort();
            Saved = false;
        }

        /*public void AddSubtask(int Position)
        {
            Android.Util.Log.Debug(TAG, "AddSubtask");

            //создать пустую задачу
            //назначить в подзадачу задаче position
            //открыть окно редактирования

            //Сортирует сам блок
            Saved = false;
        }*/

        public void Open(int Position, Activity Activity)
        {
            Android.Util.Log.Debug(TAG, "Open");
            TaskBlock TB = BlockList[Position];
            string Top = TB.Name;

            string Text = TB.Description;

            string UrgentImportant = string.Empty;
            if (TB.IsUrgent() && TB.IsImportant()) UrgentImportant = Application.Context.GetString(Resource.String.urgent_important);
            else if (TB.IsUrgent() && !TB.IsImportant()) UrgentImportant = Application.Context.GetString(Resource.String.urgent_notimportant);
            else if (!TB.IsUrgent() && TB.IsImportant()) UrgentImportant = Application.Context.GetString(Resource.String.noturgent_important);
            else if (!TB.IsUrgent() && !TB.IsImportant()) UrgentImportant = Application.Context.GetString(Resource.String.noturgent_notimportant);

            string Date = string.Empty;
            if (TB.UseDate) Date = Application.Context.GetString(Resource.String.mustcompletein) + " " + TB.Date.ToLongDateString() + " " + TB.Date.ToShortTimeString();

            string TimeLeft = string.Empty;
            if (TB.UseDate)
            {
                int Days, Hours, Minutes;
                BlockList[Position].GetTimeLeft(out Days, out Hours, out Minutes);
                TimeLeft = Application.Context.GetString(Resource.String.timeleft) + " " + Days.ToString() + " " + Application.Context.GetString(Resource.String.days) + " " + Hours.ToString() + " " + Application.Context.GetString(Resource.String.hours) + " " + Minutes.ToString() + " " + Application.Context.GetString(Resource.String.minutes);
            }
            else TimeLeft = Application.Context.GetString(Resource.String.timeunlimited);

            string Created = Application.Context.GetString(Resource.String.created) + " " + TB.Created.ToLongDateString();

            string Bottom = UrgentImportant + '\n' + Date + '\n' + TimeLeft + '\n' + Created;
            Utility.DisplayTextInfo(Activity, Top, Text, Bottom);
        }
    }

    public class WriteWorker : BlockWorker<WriteBlock>
    {
        public WriteWorker()
        {
            TAG = "WriteWorker";
        }

        ~WriteWorker()
        {
            Save();
        }

        protected override void Sort()
        {
            WriteBlock.Sort(ref BlockList);
        }

        public override void SaveProcess()
        {
            int PreviousWriteCount = SharedPreferences.GetInt("WriteCount", 0);
            ISharedPreferencesEditor Save = SharedPreferences.Edit();
            Save.PutInt("WriteCount", BlockList.Count);
            for (int i = 0; i < BlockList.Count; i++)
            {
                Save.PutString("WriteName" + i.ToString(), BlockList[i].Name);
                Save.PutString("WriteDescription" + i.ToString(), BlockList[i].Description);
                Save.PutInt("WriteIconId" + i.ToString(), (int)BlockList[i].IconId);
                Save.PutString("WriteCreated" + i.ToString(), BlockList[i].Created.ToString(DATEFORMAT));
                Save.PutBoolean("WriteFixed" + i.ToString(), BlockList[i].Fixed);
            }
            while (BlockList.Count <= PreviousWriteCount)
            {
                Save.Remove("WriteName" + PreviousWriteCount.ToString());
                Save.Remove("WriteDescription" + PreviousWriteCount.ToString());
                Save.Remove("WriteIconId" + PreviousWriteCount.ToString());
                Save.Remove("WriteCreated" + PreviousWriteCount.ToString());
                Save.Remove("WriteFixed" + PreviousWriteCount.ToString());

                PreviousWriteCount--;
            }
            Save.Apply();
        }

        public override void LoadProcess()
        {
            int Count = SharedPreferences.GetInt("WriteCount", 0);
            for (int i = 0; i < Count; i++)
            {
                string Name = SharedPreferences.GetString("WriteName" + i.ToString(), string.Empty);
                string Description = SharedPreferences.GetString("WriteDescription" + i.ToString(), string.Empty);
                Block.Icon IconId = (Block.Icon)SharedPreferences.GetInt("WriteIconId" + i.ToString(), Resource.Drawable.nopicture);
                DateTime Created;
                try
                {
                    Created = DateTime.ParseExact(SharedPreferences.GetString("WriteCreated" + i.ToString(), DateTime.Now.ToString(DATEFORMAT)), DATEFORMAT, CultureInfo.InvariantCulture);
                }
                catch
                {
                    Created = DateTime.Now;
                }
                
                bool Fixed = SharedPreferences.GetBoolean("WriteFixed" + i.ToString(), false);

                Add(new WriteBlock(Name, IconId, Created, Description, Fixed));
            }
        }

        public override void NotificationsProcess()
        {

        }

        public void Change(int Position, WriteBlock Block)
        {
            Android.Util.Log.Debug(TAG, "Change");
            BlockList[Position].Change(Block);
            Sort();
            Saved = false;
        }

        public void Open(int Position, Activity Activity)
        {
            Android.Util.Log.Debug(TAG, "Open");

            WriteBlock WB = BlockList[Position];
            string Top = WB.Name;

            string Text = WB.Description;

            string Created = Application.Context.GetString(Resource.String.created) + " " + WB.Created.ToLongDateString();

            string Bottom = Created;
            Utility.DisplayTextInfo(Activity, Top, Text, Bottom);
        }
    }
}