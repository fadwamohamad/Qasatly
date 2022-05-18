import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/shared/component/component.dart';

import '../../shared/component/colors.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
          'المفضلة',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 24.w,end: 26.w,top: 16.h),
        children: [
          TextFormField(
      decoration: InputDecoration(
      hintText: 'ما الذي تبحث عنه؟',
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsetsDirectional.only(
            start: 20.w, end: 20.w, top: 12.w, bottom: 11.w),
        hintTextDirection: TextDirection.rtl,
        fillColor: Colors.white,
        filled: true,
        errorStyle: TextStyle(
          fontSize: 8.sp,
          color: Colors.red,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: CustomColors.grey2Color,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: CustomColors.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: CustomColors.mainColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
          )
          ),
          SizedBox(height: 16.h,),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.sp,
                crossAxisSpacing: 10.sp),
            itemBuilder: (context, index)=> buildFavouriteProduct(),
            itemCount: 3,

          )
        ],
      ),
    );
  }
}
