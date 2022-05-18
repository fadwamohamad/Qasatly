import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qastly/shared/component/component.dart';
class AqsatyPage extends StatefulWidget {
  const AqsatyPage({Key? key}) : super(key: key);

  @override
  _AqsatyPageState createState() => _AqsatyPageState();
}

class _AqsatyPageState extends State<AqsatyPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  int selectedRadio = 2;
  int? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        title: Text(
          'أقساطي',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            if (isBottomSheetShown) {} else {
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
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return
                        Container(
                          height: 484.h,
                          width: double.infinity.w,

                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            child: Column(
                              children: [
                                Text(
                                  'فلترة الطلبيات حسب الحالة',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Container(
                                    height: 300.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                          activeColor: Color(0xFFF221F59),
                                          value: index,
                                          groupValue: value,
                                          onChanged: (ind) => setState(() => value = ind as int?),
                                          title: Text("جديد",style: TextStyle(
                                            fontSize: 16.sp,

                                          ),),
                                        );
                                      },
                                      itemCount: 10,
                                    )
                                ),
                                Spacer(),
                                Container(
                                  height: 46.h,
                                  width: 367.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF4941C),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r))
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      'ترتيب',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                    });
              } );};
          }, icon: SvgPicture.asset('assets/icons/Component 2.svg'))
        ],
      ),
      body: ListView.builder(
        padding:EdgeInsets.symmetric(vertical: 31.h,horizontal: 25.77.w),
        itemBuilder: (context,index)=>buildAqsaty(),
        itemCount: 4,

      ),
    );
  }
  Widget buildAqsaty()=>Container(
    color: Colors.white,
    margin: EdgeInsetsDirectional.only(bottom: 18.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 23.h),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(child: Row(
              children: [
                Text('قسط رقم',style: TextStyle(
                    fontSize: 18.sp
                ),),
                Text('1000',style: TextStyle(
                    fontSize: 18.sp
                ),)
              ],
            ),),
            SizedBox(width: 70.w,),
            Expanded(
              child: Row(
                children: [
                  Text('قيمة القسط :',style: TextStyle(
                      fontSize: 12.sp
                  ),),
                  SizedBox(width: 13.w,),
                  Text('186',style: TextStyle(
                      fontSize: 16.sp
                  ),)
                ],
              ),
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/calendar.svg'),
                SizedBox(width: 5.w,),
                Text('2022-11-06',style: TextStyle(
                    fontSize: 12.sp
                ),)
              ],
            ),
            SizedBox(width: 38.w,),
            Row(
              children: [
                SvgPicture.asset('assets/icons/colored-calendar.svg'),
                SizedBox(width: 5.w,),
                Text('2022-11-06',style: TextStyle(
                    fontSize: 12.sp
                ),)
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsetsDirectional.only(top: 1.h,start: 4.w,bottom: 1.h,end: 5.w),
              alignment: Alignment.center,
              color: Colors.orange,
              child: Text('قيد الانتظار',style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white
              ),),
            )
          ],
        )
      ],
    ),
  );
}
