import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/modules/login/cubit/cubit.dart';
import 'package:qastly/modules/login/cubit/states.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/shared/component/component.dart';
class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (BuildContext context, Object? state) {
        if(state is ForgetPassSuccessState) {
          navigateTo(context, Login());
        }else{
          showToast(
            text: 'Error',
            state: ToastStates.ERROR,
          );
        }
      },
      builder:(context, state)
    {
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Text(
                              'نسيت كلمة المرور',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(height: 30.h,),
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.h),
                                  border: OutlineInputBorder(
                                  ),
                                  prefixIcon: Icon(Icons.phone_android_outlined,
                                    color: Color(0xFFFF4941C), size: 25.sp,),
                                  hintText: 'رقم المحمول',
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp
                                  )


                              ),
                              validator: (String? value) => value!.isEmpty
                                  ? 'يرجى إدخال رقم المحمول'
                                  : null,

                            ),
                            SizedBox(height: 23.h,),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'ستصلك رسالة عبر المحمول فيها كلمة المرور الخاصة بك',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFFF221F59),
                                      fontWeight: FontWeight.w800
                                  ),
                                )),
                            SizedBox(height: 78.h,),
                            Container(
                              height: 46.h,
                              width: 305.w,
                              color: Color(0xFFFF4941C),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.forgetPassword(
                                        phone: phoneController.text
                                    );
                                  } else {
                                    print("Not Validated");
                                  }
                                },
                                child: Text(
                                  'إرسال',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              child: TextButton(onPressed: () {
                                navigateTo(context, Login());
                              }, child: Text(
                                'رجوع',
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


                ],
              ),
            ),
          ),
        ),
      );
    }
    );
  }
}
