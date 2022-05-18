import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qastly/shared/component/component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0.h),
        child: AppBar(
          backgroundColor: Color(0xFFF221F59),
          leading: backButton(onTap: (){
            Navigator.of(context).pop();
          }),
          title: Container(
            width: 292.w,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsetsDirectional.only(start: 18.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r))
                ),
                hintText: 'أدخل كلمة البحث',
                hintStyle: TextStyle(
                  fontSize: 12.sp
                ),
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/searchiiii.svg',height: 45.h,width: 45.w,))

          ],
        ),
      ),

    );
  }
}
