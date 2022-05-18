import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/shared/component/component.dart';
import 'package:qastly/shared/network/local/cache_helper.dart';
import 'onBoarding_screen_content.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(
          Radius.circular(50.r),
        ),
        color:_currentPage == index?const Color(0xFFFF4941C):const Color(0xFFFFDDDEE7),
      ),
      margin: EdgeInsetsDirectional.only(start: 5.w),
      height: 6.63.h,
      width: 23.19.w,
      curve: Curves.easeIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF221F59),
      body: SafeArea(
          child:PageView.builder(
              controller: _controller,
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemCount: contents.length,
              itemBuilder: (context, index) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 71.h),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    contents[index].image,
                    height: 313.h,
                    width: 345.w,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 413.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(32.r),topEnd: Radius.circular(32.r))
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 40.h,horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contents[index].title,
                        style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFFF221F59)
                        ),
                      ),
                      SizedBox(height: 42.h,),
                      Text(contents[index].desc,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFF4C4C4C)
                        ),
                        textAlign: TextAlign.start,),
                      SizedBox(height: 80.h,),
                      Row(
                        children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                              (int index) => InkWell(
                                onTap: (){
                                  _controller.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                                },
                                  child: _buildDots(index: index)),
                        ),
                      ),
                          const Spacer(),
                          Container(
                              height: 53.01.h,
                              width:53.01.w ,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFF4941C),
                                  borderRadius: BorderRadius.all(Radius.circular(10.r))
                              ),
                              child: IconButton(onPressed: (){
                                if(_currentPage == 2){
                                  CacheHelper()
                                      .addBoolToSF('onBoarding', true);
                                  navigateTo(context, Login());
                                }else{
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );}
                              }, icon: SvgPicture.asset('assets/icons/backArrow.svg',height: 23.h,width: 23.w,))
                          )
                        ],
                      )


                    ],
                  ),
                ),

              )
            ],
          )))
    );
  }
}
