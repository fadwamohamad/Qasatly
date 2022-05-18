import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/modules/app_modules/brands/brand.dart';
import 'package:qastly/shared/component/component.dart';
class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
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
          'العلامات التجارية',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 31.h,horizontal: 25.77.w),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 13.sp,
            crossAxisSpacing: 8.86.sp
        ), itemBuilder: (context, index) => GestureDetector(child: buildBrands(),
      onTap: (){
          navigateTo(context, Brand());
      },),
        itemCount: 6,

      ),
    );
  }
}
