import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: [
                          Text(
                            'تغيير كلمة المرور الحالية',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.r))
                                ),
                                prefixIcon: Icon(Icons.lock_open,color: Color(0xFFFF4941C),size: 25.sp,),
                                hintText: 'كلمة المرور الحالية',
                                hintStyle: TextStyle(
                                    fontSize: 12.sp
                                )
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          TextFormField(
                            controller: newPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.r))
                                ),
                                prefixIcon: Icon(Icons.lock_open,color: Color(0xFFFF4941C),size: 25.sp,),
                                hintText: 'كلمة المرور الجديدة',
                                hintStyle: TextStyle(
                                    fontSize: 12.sp
                                )
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          TextFormField(
                            controller: confirmNewPassController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.r))
                                ),
                                prefixIcon: Icon(Icons.lock_open,color: Color(0xFFFF4941C),size: 25.sp,),
                                hintText: 'تأكيد كلمة المرور الجديدة',
                                hintStyle: TextStyle(
                                    fontSize: 12.sp
                                )
                            ),
                          ),
                          SizedBox(height: 45.h,),
                          Container(
                            height: 46.h,
                            width: 305.w,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF4941C),
                                borderRadius: BorderRadius.all(Radius.circular(5.r))
                            ),

                            child: MaterialButton(
                              onPressed: () {  },
                              child: Text(
                                'دخول',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp
                                ),
                              ),
                            ),
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
}
