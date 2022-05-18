import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/component/component.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  String? typeController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: backButton(onTap: (){
          Navigator.of(context).pop();
        }),
        title: Text(
          'البيانات الشخصية',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 18.w,end: 18.w,top: 33.h),
        children: [
          Container(
            height: 103.h,
            width: 103.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: Image.asset('assets/images/personaldata.png'),

          ),
          SizedBox(height: 27.h,),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'البريد الإلكتروني',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
              prefixIcon: Icon(Icons.email_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 10.h,),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'رقم الهوية',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.perm_identity,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 10.h,),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'رقم المحمول',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.phone_android_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 10.h,),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'رقم واتس اب',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.phone_android_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 10.h,),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'اختر المحافظة',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.location_on_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
            isDense: true,
            onChanged: (newValue){
              setState(() {});
            },

            value: typeController,
            items: ['لا', 'نعم']
                .map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) =>
            value == null ? 'الحقل مطلوب' : null,

          ),
          SizedBox(height: 10.h,),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'اختر المنطقة',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.location_on_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
            isDense: true,
            onChanged: (newValue){
              setState(() {});
            },

            value: typeController,
            items: ['لا', 'نعم']
                .map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) =>
            value == null ? 'الحقل مطلوب' : null,

          ),
          SizedBox(height: 10.h,),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'اكتب العنوان التفصيلي',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.location_on_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 10.h,),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'اضغط لتحديد الموقع GPS',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.gps_fixed_outlined,color: Color(0xFFFF4941C),size: 18,)
            ),
          ),
          SizedBox(height: 30.h,),
          Container(
            height: 46.h,
            decoration: BoxDecoration(
                color: Color(0xFFFF4941C),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.r))
            ),
            child: MaterialButton(
              onPressed: () {  },
              child: Text(
                'تعديل البيانات الشخصية',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
