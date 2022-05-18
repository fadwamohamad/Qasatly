import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/shared/component/component.dart';

class Brand extends StatefulWidget {
  const Brand({Key? key}) : super(key: key);

  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {
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
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 25.77.w,end: 25.77.w, top: 31.h),
        children: [
          Container(
            height: 131.h,
            width: 364.23.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            child: Image.asset('assets/images/LG.png'),
          ),
          SizedBox(
            height: 22.h,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.sp,
                crossAxisSpacing: 10.sp),
            itemBuilder: (context, index)=> buildBrandProduct(),
            itemCount: 3,

          )
        ],
      ),
    );
  }
}
