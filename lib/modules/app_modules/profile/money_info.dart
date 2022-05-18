import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/component/component.dart';

class MoneyInfo extends StatefulWidget {
  const MoneyInfo({Key? key}) : super(key: key);

  @override
  _MoneyInfoState createState() => _MoneyInfoState();
}

class _MoneyInfoState extends State<MoneyInfo> {
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
        padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w,top: 46.h),
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 19.h,horizontal: 20.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'قيمة الراتب الشهري',
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: IconButton(
                  icon: SvgPicture.asset('assets/icons/dollar-sign.svg',height: 18.h,width: 18.w,),
                  onPressed: (){},
                )
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
                hintText: 'اختر البنك',
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: Icon(Icons.bookmark_border_rounded,color: Color(0xFFFF4941C),size: 18,)
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
                contentPadding: EdgeInsets.symmetric(vertical: 19.h,horizontal: 20.w),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0.r),
                  borderSide: BorderSide(
                    color: Color(0xFFFE0E0E0),
                  ),
                ),
                hintText: 'قيمة القسط الشهري',
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFA6A2A2)
                ),
                prefixIcon: IconButton(
                    icon: SvgPicture.asset('assets/icons/dollar-sign.svg',height: 18.h,width: 18.w,),
                  onPressed: (){},
                )
            ),
          ),
          SizedBox(height: 470.h,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFFF4941C),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.r))
            ),
            child: MaterialButton(
              onPressed: () {  },
              child: Text(
                'تعديل البيانات المالية',
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
