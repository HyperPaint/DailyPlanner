package crc640328ab781ea0ede3;


public class WriteBlockHolder
	extends android.support.v7.widget.RecyclerView.ViewHolder
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("App.WriteBlockHolder, DailyPlanner", WriteBlockHolder.class, __md_methods);
	}


	public WriteBlockHolder (android.view.View p0)
	{
		super (p0);
		if (getClass () == WriteBlockHolder.class)
			mono.android.TypeManager.Activate ("App.WriteBlockHolder, DailyPlanner", "Android.Views.View, Mono.Android", this, new java.lang.Object[] { p0 });
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
