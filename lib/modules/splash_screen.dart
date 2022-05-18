import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/shared/component/constants.dart';
import '../layout/app_layout.dart';
import '../shared/network/local/cache_helper.dart';
import 'onBoardingScreen/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 // bool? isViewBoarding = false;
  bool? isLogged = false;
  bool? onBoarding = CacheHelper().getData(key: 'onBoarding');
  @override
  void initState() {
    super.initState();
    CacheHelper().getBoolSF('logged_in').then((value) {
      setState(() {
        isLogged = value;
        print("isLogged $isLogged");
      });
    });
    CacheHelper().getBoolSF('onBoarding').then((value) {
      setState(() {
        onBoarding = value;

      });
    });
    Timer(const Duration(seconds: 6),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) {
                  Widget? widget;
                  token = CacheHelper().getData(key: 'token');
                  print(token);
                  if(onBoarding != null){
                    if (token != null) {
                      widget = const AppLayout();
                    }else {
                      widget = const Login();
                    }
                  }else{
                    widget = const OnBoardingScreen();
                  }
                  return widget;
                }
            )
        )
    );}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Color(0xFFF221F59),
        body: Center(
          child: Stack(
            children: [
              Image.asset('assets/images/Frame.png',width: 387,height: 682,),
              Center(child: Image.asset('assets/images/image 16.png',width: 326,height: 137,))
            ],
          ),
        ),
      ),
    );
  }
}
