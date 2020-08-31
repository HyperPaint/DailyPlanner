package crc640328ab781ea0ede3;


public class IconHolder
	extends android.support.v7.widget.RecyclerView.ViewHolder
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("App.IconHolder, DailyPlanner", IconHolder.class, __md_methods);
	}


	public IconHolder (android.view.View p0)
	{
		super (p0);
		if (getClass () == IconHolder.class)
			mono.android.TypeManager.Activate ("App.IconHolder, DailyPlanner", "Android.Views.View, Mono.Android", this, new java.lang.Object[] { p0 });
	}

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
