import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/layout/cubit/cubit.dart';
import 'package:qastly/layout/cubit/states.dart';
import 'package:qastly/modules/app_modules/shopping_cart/shopping_cart.dart';
import 'package:qastly/modules/login/cubit/cubit.dart';
import '../modules/app_modules/aqsaty.dart';
import '../modules/app_modules/categories.dart';
import '../modules/app_modules/categories1.dart';
import '../modules/app_modules/home.dart';
import '../modules/app_modules/more.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit,AppLayoutStates>(
        listener: (context, state){},
        builder: (context,state) {
          var cubit = AppLayoutCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/home.svg',
                      color: cubit.currentIndex == 0 ? Colors.orange : Colors.grey),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/grid.svg',
                      color: cubit.currentIndex == 1 ? Colors.orange : Colors.grey),
                  label: 'التصنيفات',
                ),
                BottomNavigationBarItem(
                    icon: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 60.h,
                          width: 88.w,
                          alignment: AlignmentDirectional.bottomCenter,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF4941C),
                              borderRadius: BorderRadius.all(Radius.circular(30
                                  .r))
                          ),
                          child: Text(
                            'السلة',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          child: Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: SvgPicture.asset(
                                'assets/icons/FrameIcon.svg'),
                          ),
                        )
                      ],
                    ),
                    label: ''

                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/briefcase.svg',
                      color: cubit.currentIndex == 3 ? Colors.orange : Colors.grey),
                  label: 'أقساطي',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/more.svg',
                      color: cubit.currentIndex == 4 ? Colors.orange : Colors.grey),
                  label: 'المزيد',
                ),
              ],
            ));

        });
  }
}
