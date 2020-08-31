	.arch	armv8-a
	.file	"typemaps.arm64-v8a.s"

/* map_module_count: START */
	.section	.rodata.map_module_count,"a",@progbits
	.type	map_module_count, @object
	.p2align	2
	.global	map_module_count
map_module_count:
	.size	map_module_count, 4
	.word	11
/* map_module_count: END */

/* java_type_count: START */
	.section	.rodata.java_type_count,"a",@progbits
	.type	java_type_count, @object
	.p2align	2
	.global	java_type_count
java_type_count:
	.size	java_type_count, 4
	.word	415
/* java_type_count: END */

/* java_name_width: START */
	.section	.rodata.java_name_width,"a",@progbits
	.type	java_name_width, @object
	.p2align	2
	.global	java_name_width
java_name_width:
	.size	java_name_width, 4
	.word	92
/* java_name_width: END */

	.include	"typemaps.shared.inc"
	.include	"typemaps.arm64-v8a-managed.inc"

/* Managed to Java map: START */
	.section	.data.rel.map_modules,"aw",@progbits
	.type	map_modules, @object
	.p2align	3
	.global	map_modules
map_modules:
	/* module_uuid: 5b459123-67cc-484d-8df8-7210de5e32a8 */
	.byte	0x23, 0x91, 0x45, 0x5b, 0xcc, 0x67, 0x4d, 0x48, 0x8d, 0xf8, 0x72, 0x10, 0xde, 0x5e, 0x32, 0xa8
	/* entry_count */
	.word	9
	/* duplicate_count */
	.word	3
	/* map */
	.xword	module0_managed_to_java
	/* duplicate_map */
	.xword	module0_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Fragment */
	.xword	.L.map_aname.0
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 0d469737-7cab-4b5d-9e93-be53a4f30d70 */
	.byte	0x37, 0x97, 0x46, 0x0d, 0xab, 0x7c, 0x5d, 0x4b, 0x9e, 0x93, 0xbe, 0x53, 0xa4, 0xf3, 0x0d, 0x70
	/* entry_count */
	.word	3
	/* duplicate_count */
	.word	0
	/* map */
	.xword	module1_managed_to_java
	/* duplicate_map */
	.xword	0
	/* assembly_name: Xamarin.Android.Support.DrawerLayout */
	.xword	.L.map_aname.1
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: b8133439-8cc7-4079-a9a3-fd61f42c670b */
	.byte	0x39, 0x34, 0x13, 0xb8, 0xc7, 0x8c, 0x79, 0x40, 0xa9, 0xa3, 0xfd, 0x61, 0xf4, 0x2c, 0x67, 0x0b
	/* entry_count */
	.word	5
	/* duplicate_count */
	.word	1
	/* map */
	.xword	module2_managed_to_java
	/* duplicate_map */
	.xword	module2_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Loader */
	.xword	.L.map_aname.2
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: d0906070-920c-4ebd-a390-173ac972b67c */
	.byte	0x70, 0x60, 0x90, 0xd0, 0x0c, 0x92, 0xbd, 0x4e, 0xa3, 0x90, 0x17, 0x3a, 0xc9, 0x72, 0xb6, 0x7c
	/* entry_count */
	.word	2
	/* duplicate_count */
	.word	1
	/* map */
	.xword	module3_managed_to_java
	/* duplicate_map */
	.xword	module3_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Arch.Lifecycle.LiveData.Core */
	.xword	.L.map_aname.3
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 89352495-6820-4cee-a462-5acd5016e799 */
	.byte	0x95, 0x24, 0x35, 0x89, 0x20, 0x68, 0xee, 0x4c, 0xa4, 0x62, 0x5a, 0xcd, 0x50, 0x16, 0xe7, 0x99
	/* entry_count */
	.word	17
	/* duplicate_count */
	.word	0
	/* map */
	.xword	module4_managed_to_java
	/* duplicate_map */
	.xword	0
	/* assembly_name: DailyPlanner */
	.xword	.L.map_aname.4
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 7916089b-7a3a-482c-80e3-182ce501ba42 */
	.byte	0x9b, 0x08, 0x16, 0x79, 0x3a, 0x7a, 0x2c, 0x48, 0x80, 0xe3, 0x18, 0x2c, 0xe5, 0x01, 0xba, 0x42
	/* entry_count */
	.word	38
	/* duplicate_count */
	.word	3
	/* map */
	.xword	module5_managed_to_java
	/* duplicate_map */
	.xword	module5_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.Compat */
	.xword	.L.map_aname.5
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: e72e94a8-8df9-49d3-b1ab-0ab743fc2949 */
	.byte	0xa8, 0x94, 0x2e, 0xe7, 0xf9, 0x8d, 0xd3, 0x49, 0xb1, 0xab, 0x0a, 0xb7, 0x43, 0xfc, 0x29, 0x49
	/* entry_count */
	.word	30
	/* duplicate_count */
	.word	4
	/* map */
	.xword	module6_managed_to_java
	/* duplicate_map */
	.xword	module6_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.v7.AppCompat */
	.xword	.L.map_aname.6
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 65590bb7-820d-49d5-9a25-e41cf0b7f528 */
	.byte	0xb7, 0x0b, 0x59, 0x65, 0x0d, 0x82, 0xd5, 0x49, 0x9a, 0x25, 0xe4, 0x1c, 0xf0, 0xb7, 0xf5, 0x28
	/* entry_count */
	.word	35
	/* duplicate_count */
	.word	11
	/* map */
	.xword	module7_managed_to_java
	/* duplicate_map */
	.xword	module7_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Support.v7.RecyclerView */
	.xword	.L.map_aname.7
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 6ab406c2-7f04-4088-b058-2ed5df66c238 */
	.byte	0xc2, 0x06, 0xb4, 0x6a, 0x04, 0x7f, 0x88, 0x40, 0xb0, 0x58, 0x2e, 0xd5, 0xdf, 0x66, 0xc2, 0x38
	/* entry_count */
	.word	4
	/* duplicate_count */
	.word	1
	/* map */
	.xword	module8_managed_to_java
	/* duplicate_map */
	.xword	module8_managed_to_java_duplicates
	/* assembly_name: Xamarin.Android.Arch.Lifecycle.Common */
	.xword	.L.map_aname.8
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: e4048fd9-f99b-4e68-ab20-4fc1fb513337 */
	.byte	0xd9, 0x8f, 0x04, 0xe4, 0x9b, 0xf9, 0x68, 0x4e, 0xab, 0x20, 0x4f, 0xc1, 0xfb, 0x51, 0x33, 0x37
	/* entry_count */
	.word	2
	/* duplicate_count */
	.word	0
	/* map */
	.xword	module9_managed_to_java
	/* duplicate_map */
	.xword	0
	/* assembly_name: Xamarin.Android.Arch.Lifecycle.ViewModel */
	.xword	.L.map_aname.9
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	/* module_uuid: 06dbfee0-f520-45f5-8511-0ccebb76149c */
	.byte	0xe0, 0xfe, 0xdb, 0x06, 0x20, 0xf5, 0xf5, 0x45, 0x85, 0x11, 0x0c, 0xce, 0xbb, 0x76, 0x14, 0x9c
	/* entry_count */
	.word	270
	/* duplicate_count */
	.word	42
	/* map */
	.xword	module10_managed_to_java
	/* duplicate_map */
	.xword	module10_managed_to_java_duplicates
	/* assembly_name: Mono.Android */
	.xword	.L.map_aname.10
	/* image */
	.xword	0
	/* java_name_width */
	.word	0
	/* java_map */
	.zero	4
	.xword	0

	.size	map_modules, 792
/* Managed to Java map: END */

/* Java to managed map: START */
	.section	.rodata.map_java,"a",@progbits
	.type	map_java, @object
	.p2align	2
	.global	map_java
map_java:
	/* #0 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554781
	/* java_name */
	.ascii	"android/animation/Animator"
	.zero	66

	/* #1 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554783
	/* java_name */
	.ascii	"android/animation/Animator$AnimatorListener"
	.zero	49

	/* #2 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554785
	/* java_name */
	.ascii	"android/animation/Animator$AnimatorPauseListener"
	.zero	44

	/* #3 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554787
	/* java_name */
	.ascii	"android/animation/AnimatorListenerAdapter"
	.zero	51

	/* #4 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554790
	/* java_name */
	.ascii	"android/animation/TimeInterpolator"
	.zero	58

	/* #5 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554792
	/* java_name */
	.ascii	"android/app/Activity"
	.zero	72

	/* #6 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554793
	/* java_name */
	.ascii	"android/app/AlarmManager"
	.zero	68

	/* #7 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554794
	/* java_name */
	.ascii	"android/app/AlertDialog"
	.zero	69

	/* #8 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554795
	/* java_name */
	.ascii	"android/app/Application"
	.zero	69

	/* #9 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554796
	/* java_name */
	.ascii	"android/app/DatePickerDialog"
	.zero	64

	/* #10 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554798
	/* java_name */
	.ascii	"android/app/DatePickerDialog$OnDateSetListener"
	.zero	46

	/* #11 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554799
	/* java_name */
	.ascii	"android/app/Dialog"
	.zero	74

	/* #12 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554812
	/* java_name */
	.ascii	"android/app/DialogFragment"
	.zero	66

	/* #13 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554813
	/* java_name */
	.ascii	"android/app/Fragment"
	.zero	72

	/* #14 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554800
	/* java_name */
	.ascii	"android/app/FragmentManager"
	.zero	65

	/* #15 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554802
	/* java_name */
	.ascii	"android/app/Notification"
	.zero	68

	/* #16 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554803
	/* java_name */
	.ascii	"android/app/Notification$Builder"
	.zero	60

	/* #17 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554804
	/* java_name */
	.ascii	"android/app/NotificationManager"
	.zero	61

	/* #18 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554815
	/* java_name */
	.ascii	"android/app/PendingIntent"
	.zero	67

	/* #19 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554808
	/* java_name */
	.ascii	"android/app/TimePickerDialog"
	.zero	64

	/* #20 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554810
	/* java_name */
	.ascii	"android/app/TimePickerDialog$OnTimeSetListener"
	.zero	46

	/* #21 */
	/* module_index */
	.word	8
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/arch/lifecycle/Lifecycle"
	.zero	60

	/* #22 */
	/* module_index */
	.word	8
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/arch/lifecycle/Lifecycle$State"
	.zero	54

	/* #23 */
	/* module_index */
	.word	8
	/* type_token_id */
	.word	33554438
	/* java_name */
	.ascii	"android/arch/lifecycle/LifecycleObserver"
	.zero	52

	/* #24 */
	/* module_index */
	.word	8
	/* type_token_id */
	.word	33554440
	/* java_name */
	.ascii	"android/arch/lifecycle/LifecycleOwner"
	.zero	55

	/* #25 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/arch/lifecycle/LiveData"
	.zero	61

	/* #26 */
	/* module_index */
	.word	3
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/arch/lifecycle/Observer"
	.zero	61

	/* #27 */
	/* module_index */
	.word	9
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/arch/lifecycle/ViewModelStore"
	.zero	55

	/* #28 */
	/* module_index */
	.word	9
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/arch/lifecycle/ViewModelStoreOwner"
	.zero	50

	/* #29 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554820
	/* java_name */
	.ascii	"android/content/BroadcastReceiver"
	.zero	59

	/* #30 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554827
	/* java_name */
	.ascii	"android/content/ComponentCallbacks"
	.zero	58

	/* #31 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554829
	/* java_name */
	.ascii	"android/content/ComponentCallbacks2"
	.zero	57

	/* #32 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554822
	/* java_name */
	.ascii	"android/content/ComponentName"
	.zero	63

	/* #33 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554818
	/* java_name */
	.ascii	"android/content/Context"
	.zero	69

	/* #34 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554824
	/* java_name */
	.ascii	"android/content/ContextWrapper"
	.zero	62

	/* #35 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554837
	/* java_name */
	.ascii	"android/content/DialogInterface"
	.zero	61

	/* #36 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554831
	/* java_name */
	.ascii	"android/content/DialogInterface$OnCancelListener"
	.zero	44

	/* #37 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554833
	/* java_name */
	.ascii	"android/content/DialogInterface$OnClickListener"
	.zero	45

	/* #38 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554835
	/* java_name */
	.ascii	"android/content/DialogInterface$OnDismissListener"
	.zero	43

	/* #39 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554819
	/* java_name */
	.ascii	"android/content/Intent"
	.zero	70

	/* #40 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554838
	/* java_name */
	.ascii	"android/content/IntentSender"
	.zero	64

	/* #41 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554844
	/* java_name */
	.ascii	"android/content/SharedPreferences"
	.zero	59

	/* #42 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554840
	/* java_name */
	.ascii	"android/content/SharedPreferences$Editor"
	.zero	52

	/* #43 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554842
	/* java_name */
	.ascii	"android/content/SharedPreferences$OnSharedPreferenceChangeListener"
	.zero	26

	/* #44 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554846
	/* java_name */
	.ascii	"android/content/pm/PackageInfo"
	.zero	62

	/* #45 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554848
	/* java_name */
	.ascii	"android/content/pm/PackageManager"
	.zero	59

	/* #46 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554851
	/* java_name */
	.ascii	"android/content/res/ColorStateList"
	.zero	58

	/* #47 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554852
	/* java_name */
	.ascii	"android/content/res/Configuration"
	.zero	59

	/* #48 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554853
	/* java_name */
	.ascii	"android/content/res/Resources"
	.zero	63

	/* #49 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554586
	/* java_name */
	.ascii	"android/database/DataSetObserver"
	.zero	60

	/* #50 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554764
	/* java_name */
	.ascii	"android/graphics/Bitmap"
	.zero	69

	/* #51 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554765
	/* java_name */
	.ascii	"android/graphics/Canvas"
	.zero	69

	/* #52 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554768
	/* java_name */
	.ascii	"android/graphics/ColorFilter"
	.zero	64

	/* #53 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554769
	/* java_name */
	.ascii	"android/graphics/Matrix"
	.zero	69

	/* #54 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554770
	/* java_name */
	.ascii	"android/graphics/Paint"
	.zero	70

	/* #55 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554771
	/* java_name */
	.ascii	"android/graphics/Point"
	.zero	70

	/* #56 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554772
	/* java_name */
	.ascii	"android/graphics/PointF"
	.zero	69

	/* #57 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554773
	/* java_name */
	.ascii	"android/graphics/PorterDuff"
	.zero	65

	/* #58 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554774
	/* java_name */
	.ascii	"android/graphics/PorterDuff$Mode"
	.zero	60

	/* #59 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554775
	/* java_name */
	.ascii	"android/graphics/Rect"
	.zero	71

	/* #60 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554776
	/* java_name */
	.ascii	"android/graphics/RectF"
	.zero	70

	/* #61 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554777
	/* java_name */
	.ascii	"android/graphics/drawable/Drawable"
	.zero	58

	/* #62 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554779
	/* java_name */
	.ascii	"android/graphics/drawable/Drawable$Callback"
	.zero	49

	/* #63 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554761
	/* java_name */
	.ascii	"android/net/Uri"
	.zero	77

	/* #64 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554748
	/* java_name */
	.ascii	"android/os/BaseBundle"
	.zero	71

	/* #65 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554749
	/* java_name */
	.ascii	"android/os/Build"
	.zero	76

	/* #66 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554750
	/* java_name */
	.ascii	"android/os/Build$VERSION"
	.zero	68

	/* #67 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554752
	/* java_name */
	.ascii	"android/os/Bundle"
	.zero	75

	/* #68 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554747
	/* java_name */
	.ascii	"android/os/Handler"
	.zero	74

	/* #69 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554757
	/* java_name */
	.ascii	"android/os/Looper"
	.zero	75

	/* #70 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554758
	/* java_name */
	.ascii	"android/os/Parcel"
	.zero	75

	/* #71 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554756
	/* java_name */
	.ascii	"android/os/Parcelable"
	.zero	71

	/* #72 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554754
	/* java_name */
	.ascii	"android/os/Parcelable$Creator"
	.zero	63

	/* #73 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554760
	/* java_name */
	.ascii	"android/os/SystemClock"
	.zero	70

	/* #74 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554746
	/* java_name */
	.ascii	"android/preference/PreferenceManager"
	.zero	56

	/* #75 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554899
	/* java_name */
	.ascii	"android/runtime/JavaProxyThrowable"
	.zero	58

	/* #76 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v13/view/DragAndDropPermissionsCompat"
	.zero	39

	/* #77 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554474
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat"
	.zero	55

	/* #78 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554476
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$OnRequestPermissionsResultCallback"
	.zero	20

	/* #79 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554478
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$PermissionCompatDelegate"
	.zero	30

	/* #80 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554480
	/* java_name */
	.ascii	"android/support/v4/app/ActivityCompat$RequestPermissionsRequestCodeValidator"
	.zero	16

	/* #81 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/support/v4/app/Fragment"
	.zero	61

	/* #82 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v4/app/Fragment$SavedState"
	.zero	50

	/* #83 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v4/app/FragmentActivity"
	.zero	53

	/* #84 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554438
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager"
	.zero	54

	/* #85 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554440
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager$BackStackEntry"
	.zero	39

	/* #86 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554441
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager$FragmentLifecycleCallbacks"
	.zero	27

	/* #87 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554444
	/* java_name */
	.ascii	"android/support/v4/app/FragmentManager$OnBackStackChangedListener"
	.zero	27

	/* #88 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554449
	/* java_name */
	.ascii	"android/support/v4/app/FragmentTransaction"
	.zero	50

	/* #89 */
	/* module_index */
	.word	2
	/* type_token_id */
	.word	33554440
	/* java_name */
	.ascii	"android/support/v4/app/LoaderManager"
	.zero	56

	/* #90 */
	/* module_index */
	.word	2
	/* type_token_id */
	.word	33554442
	/* java_name */
	.ascii	"android/support/v4/app/LoaderManager$LoaderCallbacks"
	.zero	40

	/* #91 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554482
	/* java_name */
	.ascii	"android/support/v4/app/NotificationBuilderWithBuilderAccessor"
	.zero	31

	/* #92 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554483
	/* java_name */
	.ascii	"android/support/v4/app/NotificationCompat"
	.zero	51

	/* #93 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554484
	/* java_name */
	.ascii	"android/support/v4/app/NotificationCompat$Action"
	.zero	44

	/* #94 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554485
	/* java_name */
	.ascii	"android/support/v4/app/NotificationCompat$Builder"
	.zero	43

	/* #95 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554487
	/* java_name */
	.ascii	"android/support/v4/app/NotificationCompat$Extender"
	.zero	42

	/* #96 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554488
	/* java_name */
	.ascii	"android/support/v4/app/NotificationCompat$Style"
	.zero	45

	/* #97 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554490
	/* java_name */
	.ascii	"android/support/v4/app/RemoteInput"
	.zero	58

	/* #98 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554491
	/* java_name */
	.ascii	"android/support/v4/app/SharedElementCallback"
	.zero	48

	/* #99 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554493
	/* java_name */
	.ascii	"android/support/v4/app/SharedElementCallback$OnSharedElementsReadyListener"
	.zero	18

	/* #100 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554495
	/* java_name */
	.ascii	"android/support/v4/app/TaskStackBuilder"
	.zero	53

	/* #101 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554497
	/* java_name */
	.ascii	"android/support/v4/app/TaskStackBuilder$SupportParentable"
	.zero	35

	/* #102 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554473
	/* java_name */
	.ascii	"android/support/v4/content/ContextCompat"
	.zero	52

	/* #103 */
	/* module_index */
	.word	2
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v4/content/Loader"
	.zero	59

	/* #104 */
	/* module_index */
	.word	2
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v4/content/Loader$OnLoadCanceledListener"
	.zero	36

	/* #105 */
	/* module_index */
	.word	2
	/* type_token_id */
	.word	33554439
	/* java_name */
	.ascii	"android/support/v4/content/Loader$OnLoadCompleteListener"
	.zero	36

	/* #106 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554470
	/* java_name */
	.ascii	"android/support/v4/internal/view/SupportMenu"
	.zero	48

	/* #107 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554472
	/* java_name */
	.ascii	"android/support/v4/internal/view/SupportMenuItem"
	.zero	44

	/* #108 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/support/v4/view/AccessibilityDelegateCompat"
	.zero	41

	/* #109 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v4/view/ActionProvider"
	.zero	54

	/* #110 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554439
	/* java_name */
	.ascii	"android/support/v4/view/ActionProvider$SubUiVisibilityListener"
	.zero	30

	/* #111 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554443
	/* java_name */
	.ascii	"android/support/v4/view/ActionProvider$VisibilityListener"
	.zero	35

	/* #112 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554452
	/* java_name */
	.ascii	"android/support/v4/view/NestedScrollingChild"
	.zero	48

	/* #113 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554454
	/* java_name */
	.ascii	"android/support/v4/view/NestedScrollingChild2"
	.zero	47

	/* #114 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554456
	/* java_name */
	.ascii	"android/support/v4/view/ScrollingView"
	.zero	55

	/* #115 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554461
	/* java_name */
	.ascii	"android/support/v4/view/ViewPropertyAnimatorCompat"
	.zero	42

	/* #116 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554458
	/* java_name */
	.ascii	"android/support/v4/view/ViewPropertyAnimatorListener"
	.zero	40

	/* #117 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554460
	/* java_name */
	.ascii	"android/support/v4/view/ViewPropertyAnimatorUpdateListener"
	.zero	34

	/* #118 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554462
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityNodeInfoCompat"
	.zero	27

	/* #119 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554463
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat"
	.zero	1

	/* #120 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554464
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat"
	.zero	6

	/* #121 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554465
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat"
	.zero	2

	/* #122 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554466
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityNodeInfoCompat$RangeInfoCompat"
	.zero	11

	/* #123 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554467
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityNodeProviderCompat"
	.zero	23

	/* #124 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554468
	/* java_name */
	.ascii	"android/support/v4/view/accessibility/AccessibilityWindowInfoCompat"
	.zero	25

	/* #125 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v4/widget/DrawerLayout"
	.zero	54

	/* #126 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v4/widget/DrawerLayout$DrawerListener"
	.zero	39

	/* #127 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar"
	.zero	60

	/* #128 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$LayoutParams"
	.zero	47

	/* #129 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554439
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$OnMenuVisibilityListener"
	.zero	35

	/* #130 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554443
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$OnNavigationListener"
	.zero	39

	/* #131 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554444
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$Tab"
	.zero	56

	/* #132 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554447
	/* java_name */
	.ascii	"android/support/v7/app/ActionBar$TabListener"
	.zero	48

	/* #133 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554451
	/* java_name */
	.ascii	"android/support/v7/app/ActionBarDrawerToggle"
	.zero	48

	/* #134 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554453
	/* java_name */
	.ascii	"android/support/v7/app/ActionBarDrawerToggle$Delegate"
	.zero	39

	/* #135 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554455
	/* java_name */
	.ascii	"android/support/v7/app/ActionBarDrawerToggle$DelegateProvider"
	.zero	31

	/* #136 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554456
	/* java_name */
	.ascii	"android/support/v7/app/AppCompatActivity"
	.zero	52

	/* #137 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554460
	/* java_name */
	.ascii	"android/support/v7/app/AppCompatCallback"
	.zero	52

	/* #138 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554457
	/* java_name */
	.ascii	"android/support/v7/app/AppCompatDelegate"
	.zero	52

	/* #139 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v7/graphics/drawable/DrawerArrowDrawable"
	.zero	36

	/* #140 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554474
	/* java_name */
	.ascii	"android/support/v7/view/ActionMode"
	.zero	58

	/* #141 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554476
	/* java_name */
	.ascii	"android/support/v7/view/ActionMode$Callback"
	.zero	49

	/* #142 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554478
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuBuilder"
	.zero	52

	/* #143 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554480
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuBuilder$Callback"
	.zero	43

	/* #144 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554487
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuItemImpl"
	.zero	51

	/* #145 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554484
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuPresenter"
	.zero	50

	/* #146 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554482
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuPresenter$Callback"
	.zero	41

	/* #147 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554486
	/* java_name */
	.ascii	"android/support/v7/view/menu/MenuView"
	.zero	55

	/* #148 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554488
	/* java_name */
	.ascii	"android/support/v7/view/menu/SubMenuBuilder"
	.zero	49

	/* #149 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554471
	/* java_name */
	.ascii	"android/support/v7/widget/DecorToolbar"
	.zero	54

	/* #150 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"android/support/v7/widget/LinearLayoutManager"
	.zero	47

	/* #151 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView"
	.zero	54

	/* #152 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554437
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$Adapter"
	.zero	46

	/* #153 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554439
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$AdapterDataObserver"
	.zero	34

	/* #154 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554442
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ChildDrawingOrderCallback"
	.zero	28

	/* #155 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554443
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$EdgeEffectFactory"
	.zero	36

	/* #156 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554444
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ItemAnimator"
	.zero	41

	/* #157 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554446
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener"
	.zero	12

	/* #158 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554447
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ItemAnimator$ItemHolderInfo"
	.zero	26

	/* #159 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554449
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ItemDecoration"
	.zero	39

	/* #160 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554451
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$LayoutManager"
	.zero	40

	/* #161 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554453
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry"
	.zero	17

	/* #162 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554454
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$LayoutManager$Properties"
	.zero	29

	/* #163 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554456
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$LayoutParams"
	.zero	41

	/* #164 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554458
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener"
	.zero	21

	/* #165 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554462
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$OnFlingListener"
	.zero	38

	/* #166 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554465
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$OnItemTouchListener"
	.zero	34

	/* #167 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554470
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$OnScrollListener"
	.zero	37

	/* #168 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554472
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$RecycledViewPool"
	.zero	37

	/* #169 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554473
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$Recycler"
	.zero	45

	/* #170 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554475
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$RecyclerListener"
	.zero	37

	/* #171 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554478
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$SmoothScroller"
	.zero	39

	/* #172 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554479
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$SmoothScroller$Action"
	.zero	32

	/* #173 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554481
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$SmoothScroller$ScrollVectorProvider"
	.zero	18

	/* #174 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554483
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$State"
	.zero	48

	/* #175 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554484
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ViewCacheExtension"
	.zero	35

	/* #176 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554486
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerView$ViewHolder"
	.zero	43

	/* #177 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554500
	/* java_name */
	.ascii	"android/support/v7/widget/RecyclerViewAccessibilityDelegate"
	.zero	33

	/* #178 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554472
	/* java_name */
	.ascii	"android/support/v7/widget/ScrollingTabContainerView"
	.zero	41

	/* #179 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554473
	/* java_name */
	.ascii	"android/support/v7/widget/ScrollingTabContainerView$VisibilityAnimListener"
	.zero	18

	/* #180 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554461
	/* java_name */
	.ascii	"android/support/v7/widget/Toolbar"
	.zero	59

	/* #181 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554465
	/* java_name */
	.ascii	"android/support/v7/widget/Toolbar$OnMenuItemClickListener"
	.zero	35

	/* #182 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554462
	/* java_name */
	.ascii	"android/support/v7/widget/Toolbar_NavigationOnClickEventDispatcher"
	.zero	26

	/* #183 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554503
	/* java_name */
	.ascii	"android/support/v7/widget/helper/ItemTouchHelper"
	.zero	44

	/* #184 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554504
	/* java_name */
	.ascii	"android/support/v7/widget/helper/ItemTouchHelper$Callback"
	.zero	35

	/* #185 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554507
	/* java_name */
	.ascii	"android/support/v7/widget/helper/ItemTouchHelper$ViewDropHandler"
	.zero	28

	/* #186 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554502
	/* java_name */
	.ascii	"android/support/v7/widget/helper/ItemTouchUIUtil"
	.zero	44

	/* #187 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554728
	/* java_name */
	.ascii	"android/text/Editable"
	.zero	71

	/* #188 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554731
	/* java_name */
	.ascii	"android/text/GetChars"
	.zero	71

	/* #189 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554734
	/* java_name */
	.ascii	"android/text/InputFilter"
	.zero	68

	/* #190 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554736
	/* java_name */
	.ascii	"android/text/NoCopySpan"
	.zero	69

	/* #191 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554738
	/* java_name */
	.ascii	"android/text/Spannable"
	.zero	70

	/* #192 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554741
	/* java_name */
	.ascii	"android/text/Spanned"
	.zero	72

	/* #193 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554744
	/* java_name */
	.ascii	"android/text/TextWatcher"
	.zero	68

	/* #194 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554722
	/* java_name */
	.ascii	"android/util/AttributeSet"
	.zero	67

	/* #195 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554720
	/* java_name */
	.ascii	"android/util/DisplayMetrics"
	.zero	65

	/* #196 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554719
	/* java_name */
	.ascii	"android/util/Log"
	.zero	76

	/* #197 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554723
	/* java_name */
	.ascii	"android/util/SparseArray"
	.zero	68

	/* #198 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554655
	/* java_name */
	.ascii	"android/view/ActionMode"
	.zero	69

	/* #199 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554657
	/* java_name */
	.ascii	"android/view/ActionMode$Callback"
	.zero	60

	/* #200 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554660
	/* java_name */
	.ascii	"android/view/ActionProvider"
	.zero	65

	/* #201 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554669
	/* java_name */
	.ascii	"android/view/ContextMenu"
	.zero	68

	/* #202 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554667
	/* java_name */
	.ascii	"android/view/ContextMenu$ContextMenuInfo"
	.zero	52

	/* #203 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554662
	/* java_name */
	.ascii	"android/view/ContextThemeWrapper"
	.zero	60

	/* #204 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554663
	/* java_name */
	.ascii	"android/view/Display"
	.zero	72

	/* #205 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554664
	/* java_name */
	.ascii	"android/view/DragEvent"
	.zero	70

	/* #206 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554678
	/* java_name */
	.ascii	"android/view/InputEvent"
	.zero	69

	/* #207 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554638
	/* java_name */
	.ascii	"android/view/KeyEvent"
	.zero	71

	/* #208 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554640
	/* java_name */
	.ascii	"android/view/KeyEvent$Callback"
	.zero	62

	/* #209 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554641
	/* java_name */
	.ascii	"android/view/LayoutInflater"
	.zero	65

	/* #210 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554643
	/* java_name */
	.ascii	"android/view/LayoutInflater$Factory"
	.zero	57

	/* #211 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554645
	/* java_name */
	.ascii	"android/view/LayoutInflater$Factory2"
	.zero	56

	/* #212 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554647
	/* java_name */
	.ascii	"android/view/LayoutInflater$Filter"
	.zero	58

	/* #213 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554671
	/* java_name */
	.ascii	"android/view/Menu"
	.zero	75

	/* #214 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554693
	/* java_name */
	.ascii	"android/view/MenuInflater"
	.zero	67

	/* #215 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554677
	/* java_name */
	.ascii	"android/view/MenuItem"
	.zero	71

	/* #216 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554673
	/* java_name */
	.ascii	"android/view/MenuItem$OnActionExpandListener"
	.zero	48

	/* #217 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554675
	/* java_name */
	.ascii	"android/view/MenuItem$OnMenuItemClickListener"
	.zero	47

	/* #218 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554648
	/* java_name */
	.ascii	"android/view/MotionEvent"
	.zero	68

	/* #219 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554696
	/* java_name */
	.ascii	"android/view/SearchEvent"
	.zero	68

	/* #220 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554681
	/* java_name */
	.ascii	"android/view/SubMenu"
	.zero	72

	/* #221 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554630
	/* java_name */
	.ascii	"android/view/View"
	.zero	75

	/* #222 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554632
	/* java_name */
	.ascii	"android/view/View$OnClickListener"
	.zero	59

	/* #223 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554635
	/* java_name */
	.ascii	"android/view/View$OnCreateContextMenuListener"
	.zero	47

	/* #224 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554700
	/* java_name */
	.ascii	"android/view/ViewGroup"
	.zero	70

	/* #225 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554701
	/* java_name */
	.ascii	"android/view/ViewGroup$LayoutParams"
	.zero	57

	/* #226 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554702
	/* java_name */
	.ascii	"android/view/ViewGroup$MarginLayoutParams"
	.zero	51

	/* #227 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554683
	/* java_name */
	.ascii	"android/view/ViewManager"
	.zero	68

	/* #228 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554685
	/* java_name */
	.ascii	"android/view/ViewParent"
	.zero	69

	/* #229 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554704
	/* java_name */
	.ascii	"android/view/ViewPropertyAnimator"
	.zero	59

	/* #230 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554649
	/* java_name */
	.ascii	"android/view/ViewTreeObserver"
	.zero	63

	/* #231 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554651
	/* java_name */
	.ascii	"android/view/ViewTreeObserver$OnPreDrawListener"
	.zero	45

	/* #232 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554652
	/* java_name */
	.ascii	"android/view/Window"
	.zero	73

	/* #233 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554654
	/* java_name */
	.ascii	"android/view/Window$Callback"
	.zero	64

	/* #234 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554688
	/* java_name */
	.ascii	"android/view/WindowManager"
	.zero	66

	/* #235 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554686
	/* java_name */
	.ascii	"android/view/WindowManager$LayoutParams"
	.zero	53

	/* #236 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554711
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityEvent"
	.zero	47

	/* #237 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554718
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityEventSource"
	.zero	41

	/* #238 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554712
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityNodeInfo"
	.zero	44

	/* #239 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554713
	/* java_name */
	.ascii	"android/view/accessibility/AccessibilityRecord"
	.zero	46

	/* #240 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554707
	/* java_name */
	.ascii	"android/view/animation/Animation"
	.zero	60

	/* #241 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554710
	/* java_name */
	.ascii	"android/view/animation/Interpolator"
	.zero	57

	/* #242 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554606
	/* java_name */
	.ascii	"android/widget/Adapter"
	.zero	70

	/* #243 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554588
	/* java_name */
	.ascii	"android/widget/AdapterView"
	.zero	66

	/* #244 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554590
	/* java_name */
	.ascii	"android/widget/AdapterView$OnItemSelectedListener"
	.zero	43

	/* #245 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554596
	/* java_name */
	.ascii	"android/widget/Button"
	.zero	71

	/* #246 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554597
	/* java_name */
	.ascii	"android/widget/CheckBox"
	.zero	69

	/* #247 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554608
	/* java_name */
	.ascii	"android/widget/Checkable"
	.zero	68

	/* #248 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554598
	/* java_name */
	.ascii	"android/widget/CompoundButton"
	.zero	63

	/* #249 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554591
	/* java_name */
	.ascii	"android/widget/DatePicker"
	.zero	67

	/* #250 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554593
	/* java_name */
	.ascii	"android/widget/DatePicker$OnDateChangedListener"
	.zero	45

	/* #251 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554600
	/* java_name */
	.ascii	"android/widget/EdgeEffect"
	.zero	67

	/* #252 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554601
	/* java_name */
	.ascii	"android/widget/EditText"
	.zero	69

	/* #253 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554602
	/* java_name */
	.ascii	"android/widget/FrameLayout"
	.zero	66

	/* #254 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554603
	/* java_name */
	.ascii	"android/widget/GridLayout"
	.zero	67

	/* #255 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554604
	/* java_name */
	.ascii	"android/widget/HorizontalScrollView"
	.zero	57

	/* #256 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554609
	/* java_name */
	.ascii	"android/widget/ImageButton"
	.zero	66

	/* #257 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554610
	/* java_name */
	.ascii	"android/widget/ImageView"
	.zero	68

	/* #258 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554613
	/* java_name */
	.ascii	"android/widget/LinearLayout"
	.zero	65

	/* #259 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554614
	/* java_name */
	.ascii	"android/widget/RadioButton"
	.zero	66

	/* #260 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554615
	/* java_name */
	.ascii	"android/widget/RadioGroup"
	.zero	67

	/* #261 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554617
	/* java_name */
	.ascii	"android/widget/RadioGroup$OnCheckedChangeListener"
	.zero	43

	/* #262 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554622
	/* java_name */
	.ascii	"android/widget/RelativeLayout"
	.zero	63

	/* #263 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554623
	/* java_name */
	.ascii	"android/widget/RemoteViews"
	.zero	66

	/* #264 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554612
	/* java_name */
	.ascii	"android/widget/SpinnerAdapter"
	.zero	63

	/* #265 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554624
	/* java_name */
	.ascii	"android/widget/Switch"
	.zero	71

	/* #266 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554594
	/* java_name */
	.ascii	"android/widget/TextView"
	.zero	69

	/* #267 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554625
	/* java_name */
	.ascii	"android/widget/TimePicker"
	.zero	67

	/* #268 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554627
	/* java_name */
	.ascii	"android/widget/TimePicker$OnTimeChangedListener"
	.zero	45

	/* #269 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554628
	/* java_name */
	.ascii	"android/widget/Toast"
	.zero	72

	/* #270 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554440
	/* java_name */
	.ascii	"com/hyperpaint/app/TimeNotification"
	.zero	57

	/* #271 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554458
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/DatePickerFragment"
	.zero	52

	/* #272 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554442
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/IconAdapter"
	.zero	59

	/* #273 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554441
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/IconHolder"
	.zero	60

	/* #274 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554454
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/MainActivity"
	.zero	58

	/* #275 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554448
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/SettingsActivity"
	.zero	54

	/* #276 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554455
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/SplashActivity"
	.zero	56

	/* #277 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554465
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/TaskActivity"
	.zero	58

	/* #278 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554439
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/TaskBlockAdapter"
	.zero	54

	/* #279 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554438
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/TaskBlockHolder"
	.zero	55

	/* #280 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554457
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/TaskFormActivity"
	.zero	54

	/* #281 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554447
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/TextInfoActivity"
	.zero	54

	/* #282 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554459
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/TimePickerFragment"
	.zero	52

	/* #283 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554456
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/WriteActivity"
	.zero	57

	/* #284 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554436
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/WriteBlockAdapter"
	.zero	53

	/* #285 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554435
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/WriteBlockHolder"
	.zero	54

	/* #286 */
	/* module_index */
	.word	4
	/* type_token_id */
	.word	33554466
	/* java_name */
	.ascii	"crc640328ab781ea0ede3/WriteFormActivity"
	.zero	53

	/* #287 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555046
	/* java_name */
	.ascii	"java/io/Closeable"
	.zero	75

	/* #288 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555042
	/* java_name */
	.ascii	"java/io/File"
	.zero	80

	/* #289 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555043
	/* java_name */
	.ascii	"java/io/FileDescriptor"
	.zero	70

	/* #290 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555044
	/* java_name */
	.ascii	"java/io/FileInputStream"
	.zero	69

	/* #291 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555048
	/* java_name */
	.ascii	"java/io/Flushable"
	.zero	75

	/* #292 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555052
	/* java_name */
	.ascii	"java/io/IOException"
	.zero	73

	/* #293 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555049
	/* java_name */
	.ascii	"java/io/InputStream"
	.zero	73

	/* #294 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555051
	/* java_name */
	.ascii	"java/io/InterruptedIOException"
	.zero	62

	/* #295 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555055
	/* java_name */
	.ascii	"java/io/OutputStream"
	.zero	72

	/* #296 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555057
	/* java_name */
	.ascii	"java/io/PrintWriter"
	.zero	73

	/* #297 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555054
	/* java_name */
	.ascii	"java/io/Serializable"
	.zero	72

	/* #298 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555058
	/* java_name */
	.ascii	"java/io/StringWriter"
	.zero	72

	/* #299 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555059
	/* java_name */
	.ascii	"java/io/Writer"
	.zero	78

	/* #300 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555010
	/* java_name */
	.ascii	"java/lang/Appendable"
	.zero	72

	/* #301 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554986
	/* java_name */
	.ascii	"java/lang/Boolean"
	.zero	75

	/* #302 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554987
	/* java_name */
	.ascii	"java/lang/Byte"
	.zero	78

	/* #303 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555011
	/* java_name */
	.ascii	"java/lang/CharSequence"
	.zero	70

	/* #304 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554988
	/* java_name */
	.ascii	"java/lang/Character"
	.zero	73

	/* #305 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554989
	/* java_name */
	.ascii	"java/lang/Class"
	.zero	77

	/* #306 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555005
	/* java_name */
	.ascii	"java/lang/ClassCastException"
	.zero	64

	/* #307 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554990
	/* java_name */
	.ascii	"java/lang/ClassNotFoundException"
	.zero	60

	/* #308 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555014
	/* java_name */
	.ascii	"java/lang/Cloneable"
	.zero	73

	/* #309 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555016
	/* java_name */
	.ascii	"java/lang/Comparable"
	.zero	72

	/* #310 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554991
	/* java_name */
	.ascii	"java/lang/Double"
	.zero	76

	/* #311 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555006
	/* java_name */
	.ascii	"java/lang/Enum"
	.zero	78

	/* #312 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555008
	/* java_name */
	.ascii	"java/lang/Error"
	.zero	77

	/* #313 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554992
	/* java_name */
	.ascii	"java/lang/Exception"
	.zero	73

	/* #314 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554993
	/* java_name */
	.ascii	"java/lang/Float"
	.zero	77

	/* #315 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555019
	/* java_name */
	.ascii	"java/lang/IllegalArgumentException"
	.zero	58

	/* #316 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555020
	/* java_name */
	.ascii	"java/lang/IllegalStateException"
	.zero	61

	/* #317 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555021
	/* java_name */
	.ascii	"java/lang/IndexOutOfBoundsException"
	.zero	57

	/* #318 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554995
	/* java_name */
	.ascii	"java/lang/Integer"
	.zero	75

	/* #319 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555018
	/* java_name */
	.ascii	"java/lang/Iterable"
	.zero	74

	/* #320 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555024
	/* java_name */
	.ascii	"java/lang/LinkageError"
	.zero	70

	/* #321 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554996
	/* java_name */
	.ascii	"java/lang/Long"
	.zero	78

	/* #322 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555025
	/* java_name */
	.ascii	"java/lang/NoClassDefFoundError"
	.zero	62

	/* #323 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555026
	/* java_name */
	.ascii	"java/lang/NullPointerException"
	.zero	62

	/* #324 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555027
	/* java_name */
	.ascii	"java/lang/Number"
	.zero	76

	/* #325 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554997
	/* java_name */
	.ascii	"java/lang/Object"
	.zero	76

	/* #326 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555029
	/* java_name */
	.ascii	"java/lang/ReflectiveOperationException"
	.zero	54

	/* #327 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555023
	/* java_name */
	.ascii	"java/lang/Runnable"
	.zero	74

	/* #328 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554998
	/* java_name */
	.ascii	"java/lang/RuntimeException"
	.zero	66

	/* #329 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555030
	/* java_name */
	.ascii	"java/lang/SecurityException"
	.zero	65

	/* #330 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554999
	/* java_name */
	.ascii	"java/lang/Short"
	.zero	77

	/* #331 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555000
	/* java_name */
	.ascii	"java/lang/String"
	.zero	76

	/* #332 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555002
	/* java_name */
	.ascii	"java/lang/Thread"
	.zero	76

	/* #333 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555004
	/* java_name */
	.ascii	"java/lang/Throwable"
	.zero	73

	/* #334 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555031
	/* java_name */
	.ascii	"java/lang/UnsupportedOperationException"
	.zero	53

	/* #335 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555033
	/* java_name */
	.ascii	"java/lang/annotation/Annotation"
	.zero	61

	/* #336 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555035
	/* java_name */
	.ascii	"java/lang/reflect/AnnotatedElement"
	.zero	58

	/* #337 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555037
	/* java_name */
	.ascii	"java/lang/reflect/GenericDeclaration"
	.zero	56

	/* #338 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555039
	/* java_name */
	.ascii	"java/lang/reflect/Type"
	.zero	70

	/* #339 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555041
	/* java_name */
	.ascii	"java/lang/reflect/TypeVariable"
	.zero	62

	/* #340 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554923
	/* java_name */
	.ascii	"java/net/ConnectException"
	.zero	67

	/* #341 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554925
	/* java_name */
	.ascii	"java/net/HttpURLConnection"
	.zero	66

	/* #342 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554927
	/* java_name */
	.ascii	"java/net/InetSocketAddress"
	.zero	66

	/* #343 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554928
	/* java_name */
	.ascii	"java/net/ProtocolException"
	.zero	66

	/* #344 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554929
	/* java_name */
	.ascii	"java/net/Proxy"
	.zero	78

	/* #345 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554930
	/* java_name */
	.ascii	"java/net/Proxy$Type"
	.zero	73

	/* #346 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554931
	/* java_name */
	.ascii	"java/net/ProxySelector"
	.zero	70

	/* #347 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554933
	/* java_name */
	.ascii	"java/net/SocketAddress"
	.zero	70

	/* #348 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554935
	/* java_name */
	.ascii	"java/net/SocketException"
	.zero	68

	/* #349 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554936
	/* java_name */
	.ascii	"java/net/SocketTimeoutException"
	.zero	61

	/* #350 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554938
	/* java_name */
	.ascii	"java/net/URI"
	.zero	80

	/* #351 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554939
	/* java_name */
	.ascii	"java/net/URL"
	.zero	80

	/* #352 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554940
	/* java_name */
	.ascii	"java/net/URLConnection"
	.zero	70

	/* #353 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554937
	/* java_name */
	.ascii	"java/net/UnknownServiceException"
	.zero	60

	/* #354 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554962
	/* java_name */
	.ascii	"java/nio/Buffer"
	.zero	77

	/* #355 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554964
	/* java_name */
	.ascii	"java/nio/ByteBuffer"
	.zero	73

	/* #356 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554969
	/* java_name */
	.ascii	"java/nio/channels/ByteChannel"
	.zero	63

	/* #357 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554971
	/* java_name */
	.ascii	"java/nio/channels/Channel"
	.zero	67

	/* #358 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554966
	/* java_name */
	.ascii	"java/nio/channels/FileChannel"
	.zero	63

	/* #359 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554973
	/* java_name */
	.ascii	"java/nio/channels/GatheringByteChannel"
	.zero	54

	/* #360 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554975
	/* java_name */
	.ascii	"java/nio/channels/InterruptibleChannel"
	.zero	54

	/* #361 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554977
	/* java_name */
	.ascii	"java/nio/channels/ReadableByteChannel"
	.zero	55

	/* #362 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554979
	/* java_name */
	.ascii	"java/nio/channels/ScatteringByteChannel"
	.zero	53

	/* #363 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554981
	/* java_name */
	.ascii	"java/nio/channels/SeekableByteChannel"
	.zero	55

	/* #364 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554983
	/* java_name */
	.ascii	"java/nio/channels/WritableByteChannel"
	.zero	55

	/* #365 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554984
	/* java_name */
	.ascii	"java/nio/channels/spi/AbstractInterruptibleChannel"
	.zero	42

	/* #366 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554949
	/* java_name */
	.ascii	"java/security/KeyStore"
	.zero	70

	/* #367 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554951
	/* java_name */
	.ascii	"java/security/KeyStore$LoadStoreParameter"
	.zero	51

	/* #368 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554953
	/* java_name */
	.ascii	"java/security/KeyStore$ProtectionParameter"
	.zero	50

	/* #369 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554948
	/* java_name */
	.ascii	"java/security/Principal"
	.zero	69

	/* #370 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554954
	/* java_name */
	.ascii	"java/security/SecureRandom"
	.zero	66

	/* #371 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554955
	/* java_name */
	.ascii	"java/security/cert/Certificate"
	.zero	62

	/* #372 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554957
	/* java_name */
	.ascii	"java/security/cert/CertificateFactory"
	.zero	55

	/* #373 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554960
	/* java_name */
	.ascii	"java/security/cert/X509Certificate"
	.zero	58

	/* #374 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554959
	/* java_name */
	.ascii	"java/security/cert/X509Extension"
	.zero	60

	/* #375 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554891
	/* java_name */
	.ascii	"java/util/ArrayList"
	.zero	73

	/* #376 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554880
	/* java_name */
	.ascii	"java/util/Collection"
	.zero	72

	/* #377 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554943
	/* java_name */
	.ascii	"java/util/Enumeration"
	.zero	71

	/* #378 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554882
	/* java_name */
	.ascii	"java/util/HashMap"
	.zero	75

	/* #379 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554900
	/* java_name */
	.ascii	"java/util/HashSet"
	.zero	75

	/* #380 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554945
	/* java_name */
	.ascii	"java/util/Iterator"
	.zero	74

	/* #381 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554946
	/* java_name */
	.ascii	"java/util/Random"
	.zero	76

	/* #382 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554563
	/* java_name */
	.ascii	"javax/net/SocketFactory"
	.zero	69

	/* #383 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554568
	/* java_name */
	.ascii	"javax/net/ssl/HostnameVerifier"
	.zero	62

	/* #384 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554565
	/* java_name */
	.ascii	"javax/net/ssl/HttpsURLConnection"
	.zero	60

	/* #385 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554570
	/* java_name */
	.ascii	"javax/net/ssl/KeyManager"
	.zero	68

	/* #386 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554579
	/* java_name */
	.ascii	"javax/net/ssl/KeyManagerFactory"
	.zero	61

	/* #387 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554580
	/* java_name */
	.ascii	"javax/net/ssl/SSLContext"
	.zero	68

	/* #388 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554572
	/* java_name */
	.ascii	"javax/net/ssl/SSLSession"
	.zero	68

	/* #389 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554574
	/* java_name */
	.ascii	"javax/net/ssl/SSLSessionContext"
	.zero	61

	/* #390 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554581
	/* java_name */
	.ascii	"javax/net/ssl/SSLSocketFactory"
	.zero	62

	/* #391 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554576
	/* java_name */
	.ascii	"javax/net/ssl/TrustManager"
	.zero	66

	/* #392 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554583
	/* java_name */
	.ascii	"javax/net/ssl/TrustManagerFactory"
	.zero	59

	/* #393 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554578
	/* java_name */
	.ascii	"javax/net/ssl/X509TrustManager"
	.zero	62

	/* #394 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554559
	/* java_name */
	.ascii	"javax/security/cert/Certificate"
	.zero	61

	/* #395 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554561
	/* java_name */
	.ascii	"javax/security/cert/X509Certificate"
	.zero	57

	/* #396 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555082
	/* java_name */
	.ascii	"mono/android/TypeManager"
	.zero	68

	/* #397 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554876
	/* java_name */
	.ascii	"mono/android/runtime/InputStreamAdapter"
	.zero	53

	/* #398 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	0
	/* java_name */
	.ascii	"mono/android/runtime/JavaArray"
	.zero	62

	/* #399 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554897
	/* java_name */
	.ascii	"mono/android/runtime/JavaObject"
	.zero	61

	/* #400 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554915
	/* java_name */
	.ascii	"mono/android/runtime/OutputStreamAdapter"
	.zero	52

	/* #401 */
	/* module_index */
	.word	0
	/* type_token_id */
	.word	33554445
	/* java_name */
	.ascii	"mono/android/support/v4/app/FragmentManager_OnBackStackChangedListenerImplementor"
	.zero	11

	/* #402 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554441
	/* java_name */
	.ascii	"mono/android/support/v4/view/ActionProvider_SubUiVisibilityListenerImplementor"
	.zero	14

	/* #403 */
	/* module_index */
	.word	5
	/* type_token_id */
	.word	33554445
	/* java_name */
	.ascii	"mono/android/support/v4/view/ActionProvider_VisibilityListenerImplementor"
	.zero	19

	/* #404 */
	/* module_index */
	.word	1
	/* type_token_id */
	.word	33554442
	/* java_name */
	.ascii	"mono/android/support/v4/widget/DrawerLayout_DrawerListenerImplementor"
	.zero	23

	/* #405 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554441
	/* java_name */
	.ascii	"mono/android/support/v7/app/ActionBar_OnMenuVisibilityListenerImplementor"
	.zero	19

	/* #406 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554461
	/* java_name */
	.ascii	"mono/android/support/v7/widget/RecyclerView_OnChildAttachStateChangeListenerImplementor"
	.zero	5

	/* #407 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554469
	/* java_name */
	.ascii	"mono/android/support/v7/widget/RecyclerView_OnItemTouchListenerImplementor"
	.zero	18

	/* #408 */
	/* module_index */
	.word	7
	/* type_token_id */
	.word	33554477
	/* java_name */
	.ascii	"mono/android/support/v7/widget/RecyclerView_RecyclerListenerImplementor"
	.zero	21

	/* #409 */
	/* module_index */
	.word	6
	/* type_token_id */
	.word	33554467
	/* java_name */
	.ascii	"mono/android/support/v7/widget/Toolbar_OnMenuItemClickListenerImplementor"
	.zero	19

	/* #410 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554726
	/* java_name */
	.ascii	"mono/android/text/TextWatcherImplementor"
	.zero	52

	/* #411 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554633
	/* java_name */
	.ascii	"mono/android/view/View_OnClickListenerImplementor"
	.zero	43

	/* #412 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554619
	/* java_name */
	.ascii	"mono/android/widget/RadioGroup_OnCheckedChangeListenerImplementor"
	.zero	27

	/* #413 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33555003
	/* java_name */
	.ascii	"mono/java/lang/RunnableImplementor"
	.zero	58

	/* #414 */
	/* module_index */
	.word	10
	/* type_token_id */
	.word	33554555
	/* java_name */
	.ascii	"xamarin/android/net/OldAndroidSSLSocketFactory"
	.zero	46

	.size	map_java, 41500
/* Java to managed map: END */

