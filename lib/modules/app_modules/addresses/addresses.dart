
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/modules/app_modules/addresses/add-address.dart';
import 'package:qastly/shared/component/component.dart';
class Addresses extends StatefulWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
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
          'العناوين',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 35.h,horizontal: 20.w),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>buildAddresses(),
            itemCount: 2,
          ),
          SizedBox(height: 200.h,),
          Container(
            height: 46.h,
            width: 367.w,
            decoration: BoxDecoration(
                color: Color(0xFFFF4941C),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.r))
            ),
            child: MaterialButton(
              onPressed: () {
                navigateTo(context, AddAddress());
              },
              child: Text(
                'أضف عنوان جديد',
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
