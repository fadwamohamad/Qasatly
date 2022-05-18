import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/layout/app_layout.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/modules/register/activate_account.dart';
import 'package:qastly/modules/register/cubit/cubit.dart';
import 'package:qastly/modules/register/cubit/states.dart';
import 'package:qastly/shared/component/component.dart';
import '../../shared/network/local/cache_helper.dart';
class NewRegister extends StatefulWidget {
  const NewRegister({Key? key}) : super(key: key);

  @override
  _NewRegisterState createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  var formRegisterKey = GlobalKey<FormState>();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (BuildContext context, Object? state) {
          if(state is RegisterSuccessState){
            if(state.registerModel!.status!){
              print(state.registerModel!.msg);
              print(state.registerModel!.result!.token);
              CacheHelper()
                  .addStringToSF('token', state.registerModel!.result!.token!);
                  navigateTo(context, ActivateAccount());
              // CacheHelper().saveData(key: 'token',
              //     value: state.registerModel!.result!.token)
              //     .then((value) {
              //   token = state.registerModel!.result!.token!;
              //   navigateTo(context, ActivateAccount());
              // });
            }else{
              print(state.registerModel!.msg);
              showToast(
                text: state.registerModel!.msg!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Color(0xFFF221F59),
            body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 158.h),
                        width: 343.w,
                        height: 602.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.r))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Form(
                              key: formRegisterKey,
                              child: Column(
                                children: [
                                  Text(
                                    'تسجيل جديد',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 44.h,),
                                  TextFormField(
                                    controller: nameController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.r))
                                        ),
                                        prefixIcon: Icon(Icons.perm_identity,
                                          color: Color(0xFFFF4941C),
                                          size: 25.sp,),
                                        hintText: 'الإسم الرباعي',
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp
                                        )
                                    ),
                                    validator: (String? value) => value!.isEmpty
                                        ? 'يجب ادخال الإسم رباعي'
                                        : null,
                                  ),
                                  SizedBox(height: 20.h,),
                                  TextFormField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.r))
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone_android_outlined,
                                          color: Color(0xFFFF4941C),
                                          size: 25.sp,),
                                        hintText: 'رقم المحمول',
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp
                                        )
                                    ),
                                    validator: (String? value) => value!.isEmpty
                                        ? 'يجب ادخال رقم المحمول'
                                        : null,
                                  ),
                                  SizedBox(height: 20.h,),
                                  TextFormField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.r))
                                        ),
                                        prefixIcon: Icon(Icons.lock_open,
                                          color: Color(0xFFFF4941C),
                                          size: 25.sp,),
                                        hintText: 'كلمة المرور',
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp
                                        )
                                    ),
                                    validator: (String? value) => value!.isEmpty
                                        ? 'يجب ادخال كلمة المرور'
                                        : null,
                                  ),
                                  SizedBox(height: 20.h,),
                                  TextFormField(
                                    controller: confirmPassController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.r))
                                        ),
                                        prefixIcon: Icon(Icons.lock_open,
                                          color: Color(0xFFFF4941C),
                                          size: 25.sp,),
                                        hintText: 'تأكيد كلمة المرور',
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp
                                        )
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty)
                                        return 'يجب تأكيد كلمة المرور';
                                      if(value != passwordController.text)
                                        return 'يجب أن تطابق كلمة المرور';
                                      return null;
                                    }
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: this.value,
                                        onChanged: (value) {
                                          setState(() {
                                            this.value = value!;
                                          });
                                        },

                                      ),
                                      Text(
                                        'أوافق على الشروط والأحكام وسياسة الخصوصية',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Color(0xFFF132D48),
                                            fontWeight: FontWeight.w800
                                        ),
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 30.h,),
                                  ConditionalBuilder(
                                      condition: state is! RegisterLoadingState,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 46.h,
                                          width: 305.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFF4941C),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.r))
                                          ),
                                          child: MaterialButton(
                                            child: Text(
                                              'تسجيل جديد',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp
                                              ),
                                            ),
                                            onPressed: () {
                                              if (formRegisterKey.currentState!.validate()) {
                                                //navigateTo(context, ActivateAccount());
                                                cubit.userRegister(
                                                    username: nameController.text,
                                                    password: passwordController.text,
                                                    phone: phoneController.text);
                                              } else {
                                                print("Not Validated");
                                              }

                                            },
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
                                  TextButton(onPressed: () {
                                    navigateTo(context, Login());
                                  },
                                      child: Text('تسجيل دخول', style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xFFF132D48)
                                      ),))

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 39.h,),
                      InkWell(
                        onTap: (){
                          navigateTo(context, AppLayout());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: () {},
                                  icon: Icon(Icons.arrow_back_ios_outlined,
                                    color: Colors.white, size: 12.sp,)),
                              Text('تخطى', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp
                              ),)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            ),
          );
        });
  }
}
