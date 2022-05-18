import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/layout/app_layout.dart';
import 'package:qastly/modules/login/cubit/cubit.dart';
import 'package:qastly/modules/login/cubit/states.dart';
import 'package:qastly/modules/login/forget_password.dart';
import 'package:qastly/modules/register/new_register.dart';
import 'package:qastly/shared/component/component.dart';
import 'package:qastly/shared/network/local/cache_helper.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formLoginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        // if (state is LoginLoadingState) {
        //   showDialog(
        //       context: context,
        //       builder: (_) {
        //         return Center(child: CircularProgressIndicator(color: Color(0xFFFF4941C),));
        //       });
        // }
        // if (state is LoginErrorState) {
        //   AlertDialog(
        //     title: Text("Error"),
        //     content: Text("Error"),
        //   );
        //   _onWidgetDidBuild(() {
        //     /* ScaffoldMessenger.of(context).showSnackBar(
        //           SnackBar(content: Text("ErrorState")));*/
        //   });
        // }
        // if(state is LoginSuccessState){
        //   navigateAndFinish(context, AppLayout());
        // }
        if(state is LoginSuccessState){
          if(state.loginModel!.status!){
            print(state.loginModel!.msg);
            print(state.loginModel!.result!.token);
            CacheHelper()
                .addStringToSF('token', state.loginModel!.result!.token!);
            CacheHelper()
                .addBoolToSF('logged_in', true);
            navigateAndFinish(context, AppLayout());
            // CacheHelper().saveData(key: 'token', value: state.loginModel!.result!.token)
            //     .then((value) {
            //   token = state.loginModel!.result!.token!;
            //   navigateAndFinish(context, AppLayout());
            // });
          }else{
            print(state.loginModel!.msg);
            showToast(text: state.loginModel!.msg!, state: ToastStates.ERROR,);
          }
        }
      },
      builder: (context, state){
        var cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xFFF221F59),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 86.h,),
                  Image.asset(
                      'assets/images/image 16.png',
                    height: 129.h,
                    width: 306.w,
                  ),
                  SizedBox(height: 110.h,),
                  Container(
                    height: 434.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14.r))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.w,horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formLoginKey,
                        child: Column(
                          children: [
                            Text(
                                'تسجيل الدخول',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(height: 30.h,),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.r))
                                  ),
                                  prefixIcon: Icon(Icons.phone_android_outlined,color: Color(0xFFFF4941C),size: 25.sp,),
                                  hintText: 'رقم المحمول',
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp
                                  )
                              ),
                              validator: (String? value){
                                if (value!.isEmpty) {
                                  showToast(text: 'الرجاء إدخال رقم المحمول', state:ToastStates.ERROR);
                                }
                              },
                            ),
                            SizedBox(height: 19.h,),
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.r))
                                  ),
                                  prefixIcon: Icon(Icons.lock_open,color: Color(0xFFFF4941C),size: 25.sp,),
                                  hintText: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp
                                  )
                              ),
                              validator: (String? value){
                                if (value!.isEmpty) {
                                  showToast(text: 'الرجاء إدخال كلمة المرور', state:ToastStates.ERROR);
                                }
                              },
                            ),
                            SizedBox(height: 14.h,),
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 180.w),
                              child: TextButton(onPressed: (){
                               navigateTo(context, ForgetPass());
                              }, child: Text(
                                'نسيت كلمة المرور',
                                style: TextStyle(
                                  color: Color(0xFFF221F59),
                                  fontSize: 12.sp
                                ),
                                textAlign: TextAlign.end,
                              )),
                            ),
                            SizedBox(height: 20.h,),
                            ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (BuildContext context){
                                  return Container(
                                    height: 46.h,
                                    width: 305.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFF4941C),
                                        borderRadius: BorderRadius.all(Radius.circular(5.r))
                                    ),
                                    child: MaterialButton(
                                      onPressed: (){
                                        if (formLoginKey.currentState!.validate()) {
                                          cubit.userLogin(
                                            phone: phoneController.text,
                                            password: passwordController.text,
                                          );

                                        }else{
                                          showToast(text: 'تحقق من رقم الجوال أو كلمة المرور', state: ToastStates.ERROR);
                                        }

                                      },
                                      child: Text(
                                        'دخول',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              fallback: (BuildContext context) => Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFFF4941C),
                                  backgroundColor: Color(0xFFFF4941C).withOpacity(0.3),
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(onPressed: (){
                                navigateTo(context, NewRegister());
                              }, child: Text(
                                'تسجيل جديد',
                                style: TextStyle(
                                    color: Color(0xFFF221F59),
                                  fontSize: 12.sp
                                ),
                              )),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 37.h,),
                  InkWell(
                    onTap: (){
                      navigateTo(context, AppLayout());
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 12.sp,)),
                          Text('تخطى',style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp
                          ),)
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ),
        ));
      },

    );
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
  }
}
