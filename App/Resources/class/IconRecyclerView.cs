using System;
using System.Drawing;
using Android.App;
using Android.Graphics;
using Android.Support.V7.Widget;
using Android.Text;
using Android.Views;
using Android.Widget;

namespace App
{
    public class IconHolder : RecyclerView.ViewHolder
    {
        private LinearLayout MainLayout;
        public ImageView Icon { get; private set; }

        public IconHolder(View itemView, Action<int> listener) : base(itemView)
        {
            MainLayout = itemView.FindViewById<LinearLayout>(Resource.Id.MainLayout);
            switch (GlobalVariables.Preferences.UseTheme)
            {
                case UseTheme.Dark:
                    {
                        MainLayout.SetBackgroundColor(GlobalVariables.MyDarkColor);
                        break;
                    }
                    
            }

            Icon = itemView.FindViewById<ImageView>(Resource.Id.icon);

            itemView.Click += (sender, e) => listener(base.LayoutPosition);
        }
    }

    public class IconAdapter : RecyclerView.Adapter
    {
        public event EventHandler<int> ItemClick;
        public override int ItemCount => Block.Icons.Length;

        public override void OnBindViewHolder(RecyclerView.ViewHolder holder, int position)
        {
            IconHolder iconHolder = holder as IconHolder;
            iconHolder.Icon.SetImageDrawable(Application.Context.GetDrawable(Block.Icons[position]));
        }

        public override RecyclerView.ViewHolder OnCreateViewHolder(ViewGroup parent, int viewType)
        {
            View view = LayoutInflater.From(Application.Context).Inflate(Resource.Layout.adapter_icon, null, false);
            IconHolder iconHolder = new IconHolder(view, OnClick);
            return iconHolder;
        }

        void OnClick(int position)
        {
            ItemClick(this, position);
        }
    }
}