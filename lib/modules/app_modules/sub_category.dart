import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qastly/layout/cubit/cubit.dart';
import 'package:qastly/layout/cubit/states.dart';
import 'package:qastly/modules/app_modules/product/product_page.dart';
import 'package:qastly/modules/app_modules/product_filter.dart';
import 'package:qastly/shared/component/component.dart';
import '../../shared/component/colors.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({Key? key}) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? tabController;
  TextEditingController searchController = TextEditingController();
  Color iconColor = Colors.white;
  String button = 'assets/icons/heart2.svg';
  bool isBottomSheetShown = false;
  int selectedRadio = 2;
  int? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // setSelectedRadio(int val) {
  //   setState(() {
  //     selectedRadio = val;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLayoutCubit(),
      child: BlocConsumer<AppLayoutCubit, AppLayoutStates>(
          listener: (context, state) {},
          builder: (BuildContext context, AppLayoutStates state) {
            AppLayoutCubit cubit = AppLayoutCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: Color(0xFFFE5E5E5),
              appBar: AppBar(
                backgroundColor: Color(0xFFF221F59),
                leading: backButton(onTap: () {
                  Navigator.of(context).pop();
                }),
                title: Text(
                  'اكسسوارات',
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      if (isBottomSheetShown) {
                      } else {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            builder: (context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return Container(
                                  height: 406.h,
                                  padding: EdgeInsetsDirectional.only(top: 40.h,bottom: 40.h),
                                  child: Column(
                                    children: [
                                      Text(
                                        'ترتيب المنتجات',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Container(
                                          height: 240.h,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return RadioListTile(
                                                activeColor: Color(0xFFF221F59),
                                                value: index,
                                                groupValue: value,
                                                onChanged: (ind) => setState(() => value = ind as int?),
                                                title: Text("الأعلى سعراً",style: TextStyle(
                                                  fontSize: 16.sp,

                                                ),),
                                              );
                                            },
                                            itemCount: 4,
                                          )
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 46.h,
                                        width: 367.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFF4941C),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.r))),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            'ترتيب',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            });
                      }
                    },
                    icon: SvgPicture.asset('assets/icons/sort by.svg'),
                  ),
                  IconButton(
                    onPressed: () {
                      navigateTo(context, ProductFilter());
                    },
                    icon: SvgPicture.asset('assets/icons/Component 2.svg'),
                  )
                ],
              ),
              body: DefaultTabController(
                  length: 4, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 62.h,
                          child: TabBar(
                            controller: tabController,
                            labelColor: Colors.white,
                            isScrollable: true,
                            indicatorColor: Color(0xFFF221F59),
                            tabs: [
                              Tab(text: 'الكل'),
                              Tab(text: 'العناية بالجسم'),
                              Tab(text: 'العناية بالوجه'),
                              Tab(text: 'كريمات'),
                            ],
                          ),
                          color: Color(0xFFFF4941C),
                        ),
                        Container(
                            height: 730.h, //height of TabBarView
                            child: TabBarView(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0.h, horizontal: 20.w),
                                child: Column(
                                  children: [
                                    TextFormField(
                                        decoration: InputDecoration(
                                      hintText: 'أدخل كلمة البحث ..',
                                      suffixIcon: Icon(Icons.search),
                                      contentPadding:
                                          EdgeInsetsDirectional.only(
                                              start: 20.w,
                                              end: 20.w,
                                              top: 12.w,
                                              bottom: 11.w),
                                      hintTextDirection: TextDirection.rtl,
                                      fillColor: Colors.white,
                                      filled: true,
                                      errorStyle: TextStyle(
                                        fontSize: 8.sp,
                                        color: Colors.red,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: CustomColors.grey2Color,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: CustomColors.borderColor,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: CustomColors.mainColor,
                                          width: 1,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Container(
                                      height: 600.h,
                                      child: GridView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 12.sp,
                                                crossAxisSpacing: 10.sp),
                                        itemBuilder: (context, index)=> InkWell(
                                          onTap: (){
                                            navigateTo(context, ProductPage());
                                          },
                                            child: buildSubCategoryProduct()),
                                        itemCount: 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                        hintText: 'أدخل كلمة البحث ..'),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                        hintText: 'أدخل كلمة البحث ..'),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                        hintText: 'أدخل كلمة البحث ..'),
                                  )
                                ],
                              ),
                            ]))
                      ])),
            );
          }),
    );
  }
}
