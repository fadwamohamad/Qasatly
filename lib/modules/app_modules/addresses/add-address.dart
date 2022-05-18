import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/shared/component/component.dart';
class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  String? typeController;
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: backButton(onTap: (){
          Navigator.of(context).pop();
        }),
        title: Text(
          'إضافة عنوان جديد',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 57.h,start: 23.w,end: 23.w),
        child: Column(
          children: [
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
                  hintText: 'إختر المحافظة ',
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFFFA6A2A2)
                  )
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
            SizedBox(height: 21.h,),
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
                  hintText: 'إختر المدينة ',
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFFFA6A2A2)
                  )
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
            SizedBox(height: 21.h,),
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
                  hintText: 'إختر المنطقة',
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFFFA6A2A2)
                  )
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
            SizedBox(height: 21.h,),
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
                  hintText: 'أدخل تفاصيل العنوان',
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFFFA6A2A2)
                  )
              ),
            ),
            SizedBox(height: 57.h,),
            Row(
              children: [
                Checkbox(
                  value: this.checkBox,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox = value!;
                    });
                  },

                ),
                Text('تعيين كعنوان إفتراضي',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFF221F59)
                  ),
                )
              ],
            ),
            SizedBox(height: 268.h,),
            Container(
              height: 46.h,
              width: 367.w,
              decoration: BoxDecoration(
                  color: Color(0xFFFF4941C),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.r))
              ),
              child: MaterialButton(
                onPressed: () {  },
                child: Text(
                  'أضف',
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
    );
  }
}
