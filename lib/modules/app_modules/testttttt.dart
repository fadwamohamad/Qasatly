import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 460.h,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      top: 63.h,
                      bottom: 80.h,
                    ),
                    height: 420.h,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          width: double.infinity.w,
                          child:Column(
                            children: [
                              Row(
                                children: [
                                  Text('العلامات التجارية'),
                                  SizedBox(width: 241.w,),
                                  Text('المزيد'),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                height: 89.h,
                                width: 467.w,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  children: [
                                    Container(
                                        height: 89.h,
                                        width: 113.w,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(left: 5.w),
                                        child: Image.asset('assets/images/LG.png')),
                                    Container(
                                        height: 89.h,
                                        width: 113.w,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(left: 5.w),
                                        child: Image.asset('assets/images/LG.png')),
                                    Container(
                                        height: 89.h,
                                        width: 113.w,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(left: 5.w),
                                        child: Image.asset('assets/images/LG.png')),
                                    Container(
                                        height: 89.h,
                                        width: 113.w,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(left: 5.w),
                                        child: Image.asset('assets/images/LG.png')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                  Container(
                    height:446.h ,
                    width: double.infinity.w,
                    color: Color(0xFFF221F59),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity.w,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'أهلا بك , محمد أشرف',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text('عنوان التوصيل,',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white
                                            ),
                                          ),
                                          TextButton(onPressed: (){}, child: Text(
                                            'أدخل عنوان',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white
                                            ),
                                          ))
                                        ],

                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 85.w,),
                                Row(
                                  children: [
                                    Container(
                                        height: 47.h,
                                        width: 47.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(12.r))
                                        ),
                                        child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/search.svg'),)
                                    ),
                                    SizedBox(width: 8.w,),
                                    Container(
                                      height: 47.h,
                                      width: 47.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(12.r))
                                      ),
                                      child: IconButton(
                                        icon: SvgPicture.asset('assets/icons/notification.svg'),
                                        onPressed: (){},
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                        CarouselSlider(items: [
                          Image.asset('assets/images/imageQas.png',height: 217.h,width: 380.w,fit: BoxFit.cover,),
                          Image.asset('assets/images/imageQas.png',height: 217.h,width: 380.w,fit: BoxFit.cover,),
                          Image.asset('assets/images/imageQas.png',height: 217.h,width: 380.w,fit: BoxFit.cover,),
                        ],
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                          ),),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.only(top:  399.h,start: 10.w),
                    width: double.infinity,
                    height: 113.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: 113.h,
                          width: 100.w,
                          margin: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(Radius.circular(10.r))
                          ),
                        ),
                        Container(
                          height: 113.h,
                          width: 100.w,
                          margin: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(Radius.circular(10.r))
                          ),
                        ),
                        Container(
                          height: 113.h,
                          width: 100.w,
                          margin: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(Radius.circular(10.r))
                          ),
                        ),
                        Container(
                          height: 113.h,
                          width: 100.w,
                          margin: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(Radius.circular(10.r))
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
