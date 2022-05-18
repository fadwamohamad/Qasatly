import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  String? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        title: Text(
          'سلة التسوق',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 24.w,end: 21.w,top: 29.h,bottom: 60.h),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index)=>Container(
              padding: EdgeInsetsDirectional.only(start: 16.w,top: 24.h,end: 19.w,bottom: 20.h),
            margin: EdgeInsetsDirectional.only(bottom: 67.h),

            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/iron.png'),
                SizedBox(width: 18.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('مكواه فيليبس'),
                    Row(
                      children: [
                        Text('20',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5.w,),
                        Image.asset('assets/images/israel-new-shekel 1.png')
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Container(
                          height: 22.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                            color: Color(0xFFFF4941C)
                          ),
                          child: Text('M',textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.white
                          ),),
                        ) ,
                        SizedBox(width: 11.w,) ,
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 19.h,),
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            height: 29.h,
                            width: 29.w,
                            decoration:BoxDecoration(
                                color: Color(0xFFF221F59),
                                borderRadius: BorderRadius.all(Radius.circular(2.r))
                            ),
                            child: Center(
                              child: Text('+',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                          onTap: (){},
                        ),
                        SizedBox(width: 12.w,),
                        Text('01'),
                        SizedBox(width: 12.w,),
                        InkWell(
                          child: Container(
                            height: 29.h,
                            width: 29.w,
                            decoration:BoxDecoration(
                                color: Color(0xFFF221F59),
                                borderRadius: BorderRadius.all(Radius.circular(2.r))
                            ),
                            child: Center(
                              child: Text('-',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                          onTap: (){},
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/delete.svg'))
              ],
            ),
          ),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: BorderSide(
                        color: Color(0xFFFE0E0E0),
                      ),
                    ),
                    hintText: 'كود الخصم إن وجد ..',
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xFFFA6A2A2)
                    ),

                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFF4941C),
                  borderRadius: BorderRadius.all(Radius.circular(5.r))
                ),
                child: MaterialButton(onPressed: () {  },
                  child: Text('تطبيق',style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              )
            ],
          ),
          SizedBox(height: 13.h,),
          Container(
            padding: EdgeInsetsDirectional.only(start: 17.w,top: 7.h,bottom: 7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color: Color(0xFFF221F59)
            ),
            child: Text('تم تطبيق كود الخصم بنسبة 17 % بنجاح',style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp
            ),),
          ),
          SizedBox(height: 38.h,),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'إختر عنوان التوصيل',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),

            ),
            isDense: true,
            onChanged: (newValue){
              setState(() {});
            },

            value: address,
            items: ['لا', 'نعم']
                .map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) =>
            value == null ? 'الحقل مطلوب' : null,

          ),
          SizedBox(height: 13.h,),
          Container(
            padding: EdgeInsetsDirectional.only(start: 17.w,top: 7.h,bottom: 7.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                color: Color(0xFFFF6CF9F)
            ),
            child: Text('فلسطين - غزة - شارع الجلاء - برج وطن - الطابق الرابع',style: TextStyle(
                color: Color(0xFFF221F59),
                fontSize: 12.sp
            ),),
          ),
          SizedBox(height: 53.h,),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 10.h),
                child: Row(
                  children: [
                    Text('إجمالي',style: TextStyle(
                        color: Color(0xFFFA6A2A2),
                        fontSize: 16.sp
                    ),),
                    Spacer(),
                    Row(
                      children: [
                        Text('75',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5.w,),
                        Image.asset('assets/images/israel-new-shekel 1.png')
                      ],
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 10.h),
                child: Row(
                  children: [
                    Text('الخصم',style: TextStyle(
                        color: Color(0xFFFA6A2A2),
                        fontSize: 16.sp
                    ),),
                    Spacer(),
                    Row(
                      children: [
                        Text('00',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5.w,),
                        Image.asset('assets/images/israel-new-shekel 1.png')
                      ],
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  color: Color(0xFFFC3E2F0),),
                child: Row(
                  children: [
                    Text('إجمالي',style: TextStyle(
                        color: Color(0xFFFA6A2A2),
                        fontSize: 16.sp
                    ),),
                    Spacer(),
                    Row(
                      children: [
                        Text('75',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5.w,),
                        Image.asset('assets/images/israel-new-shekel 1.png')
                      ],
                    )

                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 30.h,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFFF4941C),
                borderRadius: BorderRadius.all(Radius.circular(5.r))
            ),
            child: MaterialButton(onPressed: () {  },
              child: Text('إرسال الطلبية',style: TextStyle(
                  color: Colors.white
              ),),
            ),
          ),
          SizedBox(height: 21.h,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFFEB5757),
                borderRadius: BorderRadius.all(Radius.circular(5.r))
            ),
            child: MaterialButton(onPressed: () {  },
              child: Text('إفراغ السلة',style: TextStyle(
                  color: Colors.white
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
