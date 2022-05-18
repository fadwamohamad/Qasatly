import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/component/component.dart';
class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: backButton(onTap: (){
          Navigator.of(context).pop();
        }),
        title: Text(
          'مركز المساعدة',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(top: 32.h,start: 18.w,end: 18.w),
          itemBuilder: (context, index) =>Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 18.h,
            ),
            child: InkWell(
              onTap: () {

              },
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 26.w, end: 18.w, top: 20.h, bottom: 19.h),
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
                      'سياسة الإرجاع',
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
      itemCount: 4,),
    );
  }
}
