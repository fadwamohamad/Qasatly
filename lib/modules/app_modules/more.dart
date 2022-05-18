import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qastly/modules/app_modules/addresses/addresses.dart';
import 'package:qastly/modules/app_modules/aqsaty.dart';
import 'package:qastly/modules/app_modules/favourite.dart';
import 'package:qastly/modules/app_modules/orders/orders.dart';
import 'package:qastly/modules/app_modules/profile/profile.dart';
import 'package:qastly/shared/component/component.dart';
class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      body: SafeArea(child: ListView(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.zero,
                  margin: EdgeInsetsDirectional.only(start: 24.w, end: 16.w),
                  decoration: BoxDecoration(
                    // color: CustomColors.mainColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                        'assets/images/image 25.png',
                        height: 60.h,
                        width: 60.h,
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'أهلا بك مجددا , محمد أشرف',
                          style: TextStyle(
                            fontSize: 16.sp,
                              fontWeight: FontWeight.w900
                          ),

                          ),
                      Text(
                        'mohammed@example.com',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 16.h,
              // bottom: 75.h
            ),
            child: Ink(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(
                        30.r,
                      ),
                      topEnd: Radius.circular(
                        30.r,
                      ))),
              child: ListView(
                padding: EdgeInsetsDirectional.only(
                    start: 16.w, end: 16.w, top: 27.h, bottom: 75.h
                  // top: 27.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      bottom: 18.h,
                    ),
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, ProfilePage());
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/profile.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                                'الملف الشخصي',
                              style: TextStyle(
                                fontSize: 14.sp
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
                        navigateTo(context, Orders());
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/myorders.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'طلباتي',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                        navigateTo(context, AqsatyPage());
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/aqsaty.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'أقساطي',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/Frame 20.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'طلبات مرجعه',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/categories.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'التصنيفات',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                        navigateTo(context, Favourite());
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/heeeeeart.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'المفضلة',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                        navigateTo(context, Addresses());
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/addresses.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'العناويين',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/whatsapp.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'راسلنا على الواتساب',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/helpcenter.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'مركز المساعدة',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/contact.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'تواصل مع الدعم',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/logout.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'تسجيل خروج',
                              style: TextStyle(
                                  fontSize: 14.sp
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
                            start: 10.w, end: 16.w, top: 10.h, bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            width: 1.w,
                            color: const Color(0xFFEDEDF7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: const Color(0xFFF5F5F5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 9.h,
                              ),
                              child: SvgPicture.asset('assets/icons/logiiiin.svg'),),
                            SizedBox(
                              width: 17.w,
                            ),
                            Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                  fontSize: 14.sp
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
            ),
          ),
        ],
      )),
    );
  }
}
