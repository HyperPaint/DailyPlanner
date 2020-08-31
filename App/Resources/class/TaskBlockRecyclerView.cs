using Android.App;
using Android.Graphics.Drawables;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;

namespace App
{
    class TaskBlockDataSpoofer : DataSpoofer<TaskBlock>
    {
        public TaskBlockDataSpoofer(ref List<TaskBlock> In) : base(ref In) { }

        protected override bool SearchProcess(string Text, int Index)
        {
            if (InData[Index].Name.Contains(Text, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
            else if (InData[Index].Created.ToLongDateString().Contains(Text, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
            else if (InData[Index].Description.Contains(Text, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
            else if (InData[Index].Date.ToLongDateString().Contains(Text, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    class TaskBlockHolder : RecyclerView.ViewHolder
    {
        public RelativeLayout MainLayout, SecondaryLayout;
        public ImageView Icon { get; private set; }
        public TextView Name { get; private set; }
        public TextView Time { get; private set; }
        public TextView Description { get; private set; }
        public ImageButton Open { get; private set; }
        public ImageButton Complete { get; private set; }
        public ImageButton Change { get; private set; }
        public ImageButton Delete { get; private set; }
        public ImageButton AddSubtask { get; private set; }

        public TaskBlockHolder(View itemView, Action<int> OpenClick, Action<int> CompleteClick, Action<int> ChangeClick, Action<int> DeleteClick, Action<int> AddSubtaskClick, Action<int> ItemClick) : base(itemView)
        {
            MainLayout = itemView.FindViewById<RelativeLayout>(Resource.Id.MainLayout);
            SecondaryLayout = itemView.FindViewById<RelativeLayout>(Resource.Id.SecondaryLayout);
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Dark:
                    {
                        itemView.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        MainLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        SecondaryLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                
            }

            Icon = itemView.FindViewById<ImageView>(Resource.Id.Image);
            Name = itemView.FindViewById<TextView>(Resource.Id.Name);
            Time = itemView.FindViewById<TextView>(Resource.Id.Time);
            Description = itemView.FindViewById<TextView>(Resource.Id.Description);

            Open = itemView.FindViewById<ImageButton>(Resource.Id.Open);
            Open.Click += (sender, e) => OpenClick(base.LayoutPosition);

            Complete = itemView.FindViewById<ImageButton>(Resource.Id.Complete);
            Complete.Click += (sender, e) => CompleteClick(base.LayoutPosition);

            Change = itemView.FindViewById<ImageButton>(Resource.Id.Change);
            Change.Click += (sender, e) => ChangeClick(base.LayoutPosition);

            Delete = itemView.FindViewById<ImageButton>(Resource.Id.Delete);
            Delete.Click += (sender, e) => DeleteClick(base.LayoutPosition);
            /*
            AddSubtask = itemView.FindViewById<ImageButton>(Resource.Id.AddSub);
            AddSubtask.Click += (sender, e) => AddSubtaskClick(base.LayoutPosition);
            */
            itemView.Click += (sender, e) => ItemClick(base.LayoutPosition);
        }
    }

    class TaskBlockAdapter : RecyclerView.Adapter
    {
        public event EventHandler<int> OpenClick;
        public event EventHandler<int> CompleteClick;
        public event EventHandler<int> ChangeClick;
        public event EventHandler<int> DeleteClick;
        public event EventHandler<int> AddSubtaskClick;
        public event EventHandler<int> ItemClick;

        public TaskBlockDataSpoofer Data = new TaskBlockDataSpoofer(ref GlobalVariables.TWorker.BlockList);

        const int EmptyLine = 1;
        public override int ItemCount => Data.Count + EmptyLine;
        public int RealItemCount => Data.Count;

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int Position)
        {
            TaskBlockHolder taskHolder = holder as TaskBlockHolder;
            if (Position < RealItemCount)
            {
                taskHolder.ItemView.Visibility = ViewStates.Visible;

                TaskBlock block = Data[Position];

                try
                {
                    int IconId = Block.Icons[(int)block.IconId];
                    Drawable drawable = Application.Context.GetDrawable(IconId);
                    taskHolder.Icon.SetImageDrawable(drawable);
                }
                catch
                {
                    int IconId = Block.Icons[(int)Block.Icon.noicon];
                    Drawable drawable = Application.Context.GetDrawable(IconId);
                    taskHolder.Icon.SetImageDrawable(drawable);
                }

                taskHolder.Name.Text = block.Name;

                if (block.UseDate)
                {
                    int Days, Hours, Minutes;
                    block.GetTimeLeft(out Days, out Hours, out Minutes);
                    taskHolder.Time.Text = Days.ToString() + " " + Application.Context.GetString(Resource.String.days) + " " + Hours.ToString() + " " + Application.Context.GetString(Resource.String.hours) + " " + Minutes.ToString() + " " + Application.Context.GetString(Resource.String.minutes);
                }
                else
                {
                    taskHolder.Time.Text = Application.Context.GetString(Resource.String.timeunlimited);
                }

                switch (block.UrgentImportantType)
                {
                    case TaskBlock.UrgentImportant.urgent_important: { taskHolder.Description.Text = Application.Context.GetString(Resource.String.urgent_important); break; }
                    case TaskBlock.UrgentImportant.urgent_notimportant: { taskHolder.Description.Text = Application.Context.GetString(Resource.String.urgent_notimportant); break; }
                    case TaskBlock.UrgentImportant.noturgent_important: { taskHolder.Description.Text = Application.Context.GetString(Resource.String.noturgent_important); break; }
                    case TaskBlock.UrgentImportant.noturgent_notimportant: { taskHolder.Description.Text = Application.Context.GetString(Resource.String.noturgent_notimportant); break; }
                }
            }
            else
            {
                taskHolder.ItemView.Visibility = ViewStates.Invisible;
            }
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(Application.Context).Inflate(Resource.Layout.adapter_task_item, null, false);
            TaskBlockHolder taskHolder = new TaskBlockHolder(view, OnOpenClick, OnCompleteClick, OnChangeClick, OnDeleteClick, OnAddSubtaskClick, OnItemClick);
            return taskHolder;
        }

        public void Reload()
        {
            Data.Reload();
            NotifyDataSetChanged();
        }

        void OnOpenClick(int Position)
        {
            OpenClick(this, Position);
        }

        void OnCompleteClick(int Position)
        {
            CompleteClick(this, Position);
            Data.Reload();
        }

        void OnChangeClick(int Position)
        {
            ChangeClick(this, Position);
        }

        void OnDeleteClick(int Position)
        {
            DeleteClick(this, Position);
            Data.Reload();
            NotifyItemRemoved(Position);
        }

        void OnAddSubtaskClick(int Position)
        {
            AddSubtaskClick(this, Position);
        }

        void OnItemClick(int Position)
        {
            ItemClick(this, Position);
        }
    }
}