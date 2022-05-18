import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qastly/modules/app_modules/sub_category.dart';
import 'package:qastly/shared/component/component.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Tab>? myTabs;
  TabController? tabController;
  late List<Widget> views;

  @override
  void initState() {
    super.initState();
  }

  // myTabs = List.generate(categoriesGetXController.category.length, (index) {
  // return Tab(
  // text: categoriesGetXController.category[index].name,
  // );
  // });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: backButton(onTap: (){
          Navigator.of(context).pop();
        }),
        title: Image.asset('assets/images/image 16.png',width: 140.w,height: 59.h,),
        centerTitle: true,
      ),
      body: DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  Container(
                    child: TabBar(
                      controller: tabController,
                      labelColor: Colors.white,
                      isScrollable: true,
                      indicatorColor: Color(0xFFF221F59),
                      tabs: [
                        Tab(text: 'تجميل'),
                        Tab(text: 'أطفال'),
                        Tab(text: 'اكسسوارات'),
                        Tab(text: 'طبيعة'),
                      ],
                    ),
                    color: Color(0xFFFF4941C),
                  ),
                  Container(
                      height: 738.h, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                      ),
                      child: TabBarView(children: <Widget>[
                        ListView.builder(
                          padding:  EdgeInsetsDirectional.only(top: 31.h,start: 18.w,end: 18.w),
                          itemBuilder: (context, index) =>Padding(
                            padding: EdgeInsetsDirectional.only(
                              bottom: 18.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                navigateTo(context, SubCategory());
                              },
                              child: Container(
                                padding: EdgeInsetsDirectional.only(
                                    start: 19.w, end: 19.w, top: 19.h, bottom: 19.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    width: 1.w,
                                    color:  Color(0xFFEDEDF7),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'اكسسوارات',
                                      style: TextStyle(
                                          fontSize: 18.sp
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14.r,
                                      color: Color(0xFFF86869E),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          itemCount: 5,

                        ),
                        Container(
                          child: Center(
                            child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ])
                  )
                ]),
              )
          ),

    );
  }
}
