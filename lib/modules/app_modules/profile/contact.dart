import 'package:flutter/material.dart';

import '../../../shared/component/component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
          'البيانات الشخصية',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 18.w,end: 18.w,top: 64.h),
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 19.h,horizontal: 20.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'البريد الإلكتروني',
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.email_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 26.h,),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 19.h,horizontal: 20.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'رقم المحمول',
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.phone_android_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 26.h,),
          TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 4,
            decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.only(top: 16.h,start: 58.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'الرسالة',
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFA6A2A2)
                ),

            ),
          ),
          SizedBox(height: 298.h,),
          Container(

            decoration: BoxDecoration(
                color: Color(0xFFFF4941C),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.r))
            ),
            child: MaterialButton(
              onPressed: () {  },
              child: Text(
                'تعديل البيانات الشخصية',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
