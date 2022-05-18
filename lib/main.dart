import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/layout/app_layout.dart';
import 'package:qastly/layout/cubit/cubit.dart';
import 'package:qastly/layout/cubit/states.dart';
import 'package:qastly/modules/app_modules/about/about.dart';
import 'package:qastly/modules/app_modules/addresses/add-address.dart';
import 'package:qastly/modules/app_modules/addresses/addresses.dart';
import 'package:qastly/modules/app_modules/aqsaty.dart';
import 'package:qastly/modules/app_modules/brands/brand.dart';
import 'package:qastly/modules/app_modules/brands/brands.dart';
import 'package:qastly/modules/app_modules/categories.dart';
import 'package:qastly/modules/app_modules/favourite.dart';
import 'package:qastly/modules/app_modules/help/faq.dart';
import 'package:qastly/modules/app_modules/help/help_center.dart';
import 'package:qastly/modules/app_modules/home.dart';
import 'package:qastly/modules/app_modules/more.dart';
import 'package:qastly/modules/app_modules/orders/order-details.dart';
import 'package:qastly/modules/app_modules/orders/orders.dart';
import 'package:qastly/modules/app_modules/product/product_page.dart';
import 'package:qastly/modules/app_modules/product_filter.dart';
import 'package:qastly/modules/app_modules/profile/contact.dart';
import 'package:qastly/modules/app_modules/profile/money_info.dart';
import 'package:qastly/modules/app_modules/profile/personal_data.dart';
import 'package:qastly/modules/app_modules/profile/profile.dart';
import 'package:qastly/modules/app_modules/search/search.dart';
import 'package:qastly/modules/app_modules/shopping_cart/shopping_cart.dart';
import 'package:qastly/modules/app_modules/sub_category.dart';
import 'package:qastly/modules/register/activate_account.dart';
import 'package:qastly/modules/login/change_password.dart';
import 'package:qastly/modules/login/cubit/cubit.dart';
import 'package:qastly/modules/login/forget_password.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/modules/onBoardingScreen/onBoarding_screen.dart';
import 'package:qastly/modules/register/cubit/cubit.dart';
import 'package:qastly/modules/register/new_register.dart';
import 'package:qastly/modules/splash_screen.dart';
import 'package:qastly/modules/tajmeel.dart';
import 'package:qastly/shared/bloc_observer.dart';
import 'package:qastly/shared/component/constants.dart';
import 'package:qastly/shared/network/local/cache_helper.dart';
import 'package:qastly/shared/network/remote/dio_helper.dart';
import 'modules/app_modules/categories1.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper().init();
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) => AppLayoutCubit()
                    ..getHomeData()
                    ..getCategoryData()
                    ..getMainSubCategoryData()
                    ,
                ),
                BlocProvider(
                  create: (BuildContext context) => LoginCubit(),
                ),
                BlocProvider(
                  create: (BuildContext context) => RegisterCubit(),
                ),
              ],
              child: ScreenUtilInit(
                designSize: const Size(414, 896),
                splitScreenMode: true,
                minTextAdapt: true,
                   builder: (BuildContext context) {
                  return MaterialApp(
                      title: 'Flutter Demo',
                      theme: ThemeData(
                        fontFamily: 'Avenir Arabic',
                        primarySwatch: Colors.blue, // color for text
                      ),
                      localizationsDelegates: [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: [
                        Locale('ar', ''),
                      ],
                      debugShowCheckedModeBanner: false,
                      builder: (context, widget) {
                        ScreenUtil.setContext(context);
                        return MediaQuery(
                          //Setting font does not change with system font size
                          data: MediaQuery.of(context).copyWith(
                              textScaleFactor: 1.0),
                          child: widget!,
                        );
                      },
                      home: SplashScreen());
                   }
              ),
            );
          }
  }

