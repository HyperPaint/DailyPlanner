using Android.App;
using Android.Graphics.Drawables;
using Android.Support.V7.Widget;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;

namespace App
{
    class WriteBlockDataSpoofer : DataSpoofer<WriteBlock>
    {
        public WriteBlockDataSpoofer(ref List<WriteBlock> In) : base(ref In) { }

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
            else
            {
                return false;
            }
        }
    }

    class WriteBlockHolder : RecyclerView.ViewHolder
    {
        public RelativeLayout MainLayout, SecondaryLayout;
        public ImageView Icon { get; private set; }
        public TextView Name { get; private set; }
        public TextView Time { get; private set; }
        public TextView Description { get; private set; }
        public ImageButton Open { get; private set; }
        public ImageButton Change { get; private set; }
        public ImageButton Delete { get; private set; }

        public WriteBlockHolder(View itemView, Action<int> OpenClick, Action<int> ChangeClick, Action<int> DeleteClick, Action<int> ItemClick) : base(itemView)
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

            Change = itemView.FindViewById<ImageButton>(Resource.Id.Change);
            Change.Click += (sender, e) => ChangeClick(base.LayoutPosition);

            Delete = itemView.FindViewById<ImageButton>(Resource.Id.Delete);
            Delete.Click += (sender, e) => DeleteClick(base.LayoutPosition);

            itemView.Click += (sender, e) => ItemClick(base.LayoutPosition);
        }
    }

    class WriteBlockAdapter : RecyclerView.Adapter
    {
        public event EventHandler<int> OpenClick;
        public event EventHandler<int> ChangeClick;
        public event EventHandler<int> DeleteClick;
        public event EventHandler<int> ItemClick;

        public WriteBlockDataSpoofer Data = new WriteBlockDataSpoofer(ref GlobalVariables.WWorker.BlockList);

        const int EmptyLine = 1;
        public override int ItemCount => Data.Count + EmptyLine;
        public int RealItemCount => Data.Count;

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int Position)
        {
            WriteBlockHolder writeHolder = holder as WriteBlockHolder;
            if (Position < RealItemCount)
            {
                writeHolder.ItemView.Visibility = ViewStates.Visible;

                WriteBlock block = Data[Position];

                try
                {
                    int IconId = Block.Icons[(int)block.IconId];
                    Drawable drawable = Application.Context.GetDrawable(IconId);
                    writeHolder.Icon.SetImageDrawable(drawable);
                }
                catch
                {
                    int IconId = Block.Icons[(int)Block.Icon.noicon];
                    Drawable drawable = Application.Context.GetDrawable(IconId);
                    writeHolder.Icon.SetImageDrawable(drawable);
                }

                writeHolder.Name.Text = block.Name;

                writeHolder.Time.Text = block.Created.ToLongDateString();

                if (block.Fixed) writeHolder.Description.Text = Application.Context.GetString(Resource.String.fixedwrite);
            }
            else
            {
                writeHolder.ItemView.Visibility = ViewStates.Invisible;
            }
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(Application.Context).Inflate(Resource.Layout.adapter_write_item, null, false);
            WriteBlockHolder taskHolder = new WriteBlockHolder(view, OnOpenClick, OnChangeClick, OnDeleteClick, OnItemClick);
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

        void OnItemClick(int Position)
        {
            ItemClick(this, Position);
        }
    }
}