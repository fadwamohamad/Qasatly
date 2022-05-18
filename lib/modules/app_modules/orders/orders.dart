import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/modules/app_modules/orders/order-details.dart';
import 'package:qastly/shared/component/component.dart';
class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  int selectedRadio = 2;
  int? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/icons/Back.svg'),
        ),
        title: Text(
          'الطلبيات',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
      icon: SvgPicture.asset('assets/icons/Component 2.svg'),
     onPressed: (){
            if (isBottomSheetShown) {} else {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) {
                    return StatefulBuilder(builder:
                        (BuildContext context, StateSetter setState) {
                      return Container(
                        height: 484.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          children: [
                            Text(
                              'فلترة الطلبيات حسب الحالة',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              height: 300.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return RadioListTile(
                                    activeColor: Color(0xFFF221F59),
                                    value: index,
                                    groupValue: value,
                                    onChanged: (ind) => setState(() => value = ind as int?),
                                    title: Text("جديد",style: TextStyle(
                                      fontSize: 16.sp,

                                    ),),
                                  );
                                },
                                itemCount: 10,
                              )
                            ),
                            Spacer(),
                            Container(
                              height: 46.h,
                              width: 367.w,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF4941C),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.r))
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'ترتيب',
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
                    });
                  });
            } })
        ],
      ),
      body: ListView.builder(
        padding:EdgeInsets.symmetric(vertical: 31.h,horizontal: 25.77.w),
        itemBuilder: (context,index)=>InkWell(
          onTap: (){
            navigateTo(context, OrderDetails());
          },
            child: buildOrders()),
        itemCount: 3,

      ),
    );
  }
}
