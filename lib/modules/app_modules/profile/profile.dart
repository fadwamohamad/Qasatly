import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/modules/app_modules/profile/money_info.dart';
import 'package:qastly/modules/app_modules/profile/personal_data.dart';
import '../../../shared/component/component.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          'الملف الشخصي',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 18.w,end: 18.w,top: 32.h),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 18.h,
            ),
            child: InkWell(
              onTap: () {
                navigateTo(context, PersonalData());
              },
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 10.w, end: 16.w, top: 20.h, bottom: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    width: 1.w,
                    color: const Color(0xFFEDEDF7),
                  ),
                  color: Colors.white
                ),
                child: Row(
                  children: [
                    Text(
                      'البيانات الشخصية',
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
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 18.h,
            ),
            child: InkWell(
              onTap: () {
                navigateTo(context, MoneyInfo());
              },
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 10.w, end: 16.w, top: 20.h, bottom: 20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      width: 1.w,
                      color: const Color(0xFFEDEDF7),
                    ),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    Text(
                      'البيانات المالية',
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
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 18.h,
            ),
            child: InkWell(
              onTap: () {

              },
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 10.w, end: 16.w, top: 20.h, bottom: 20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      width: 1.w,
                      color: const Color(0xFFEDEDF7),
                    ),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    Text(
                      'تغيير كلمة المرور',
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
        ],
      ),
    );
  }
}
