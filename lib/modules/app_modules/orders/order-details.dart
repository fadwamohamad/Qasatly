import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/shared/component/component.dart';
class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Back.svg'),
        ),
        title: Text(
          'طلبية رقم 12567',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 25.h,horizontal: 20.w),
        children: [
          Row(
            children: [
              Spacer(),
              Container(
                // height: 21.h,
                // width: 49.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                color: Color(0xFFFF4941C),
                child: Text('جديد',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context, index) =>  buildOrderDetailsItem(),
            itemCount: 6,
          ),
          SizedBox(height: 129.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('إجمالي',style: TextStyle(
                      color: Color(0xFFFA6A2A2),
                      fontSize: 16.sp
                    ),)),
                    SizedBox(width: 239.w,),
                    Expanded(child: Row(
                      children: [
                        Text('75',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5.w,),
                        Image.asset('assets/images/israel-new-shekel 1.png')
                      ],
                    ))

                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text('الخصم',style: TextStyle(
                        color: Color(0xFFFA6A2A2),
                        fontSize: 16.sp
                    ),)),
                    SizedBox(width: 239.w,),
                    Expanded(child: Row(
                      children: [
                        Text('00',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5.w,),
                        Image.asset('assets/images/israel-new-shekel 1.png')
                      ],
                    ))

                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    color: Colors.blueGrey,),
                  child: Row(
                    children: [
                      Expanded(child: Text('إجمالي',style: TextStyle(
                          color: Color(0xFFFA6A2A2),
                          fontSize: 16.sp
                      ),)),
                      SizedBox(width: 239.w,),
                      Expanded(child: Row(
                        children: [
                          Text('75',style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 5.w,),
                          Image.asset('assets/images/israel-new-shekel 1.png')
                        ],
                      ))

                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 16.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color: Color(0xFFFF6CF9F)
            ),
            child: Text('فلسطين - غزة - شارع الجلاء - برج وطن - الطابق الرابع',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 47.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: Color(0xFFFEB5757),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.r))
            ),
            child: MaterialButton(
              onPressed: () {  },
              child: Text(
                'إلغاء الطلبية',
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
