import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/modules/register/cubit/states.dart';

import '../../shared/component/component.dart';
import 'cubit/cubit.dart';
class ActivateAccount extends StatefulWidget {
  const ActivateAccount({Key? key}) : super(key: key);

  @override
  _ActivateAccountState createState() => _ActivateAccountState();
}

class _ActivateAccountState extends State<ActivateAccount> {
  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? currentText;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (BuildContext context, Object? state) {
        print("state $state");
        if(state is SmsSuccessState) {
          navigateTo(context, Login());
        }else if (state is SmsErrorState){
            showToast(text: 'Error', state: ToastStates.ERROR);
          }
      },
      builder:(context, state){
        var cubit = RegisterCubit.get(context);
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'تفعيل الحساب',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                              SizedBox(height: 30.h,),
                              PinCodeTextField(
                                appContext: context,
                                length: 4,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                obscureText: true,
                                obscuringCharacter: '*',
                                autoFocus: true,
                                controller: controller,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5.r),
                                  fieldHeight: 55.h,
                                  fieldWidth: 51.w,
                                  inactiveColor: Colors.grey,
                                  activeColor: Colors.orange,
                                  selectedColor: Color(0xFFFF4941C),

                                ),
                                validator: (String? value) => value!.isEmpty
                                    ? 'يرجى إدخال كود التفعيل'
                                    : null,
                              ),
                              SizedBox(height: 44.h,),
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text('أدخل الكود المرسل إليك عبر المحمول الخاص بك',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12.sp
                                  ),
                                ),
                              ),
                              SizedBox(height: 67.h,),
                              Container(
                                height: 46.h,
                                width: 305.w,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF4941C),
                                    borderRadius: BorderRadius.all(Radius.circular(5.r))
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.sendSmsCode(
                                          smsCode: controller.text,
                                      );
                                    } else {
                                      print("Not Validated");
                                    }

                                  },
                                  child: Text(
                                    'تأكيد',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text(
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
                  ),


                ],
              ),
            ),
          ),
        ),
      );}
    );
  }
}
