
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/shared/component/component.dart';
class ProductFilter extends StatefulWidget {
  const ProductFilter({Key? key}) : super(key: key);

  @override
  _ProductFilterState createState() => _ProductFilterState();
}

class _ProductFilterState extends State<ProductFilter> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController colors = TextEditingController();
  TextEditingController marketPlace = TextEditingController();
  bool isBottomSheetShown = false;
  String? typeController;
  int selectedRadio = 2;
  int? value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  setSelectedRadio(int val){
    setState(() {
       selectedRadio  = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        leading: backButton(onTap: (){
          Navigator.of(context).pop();
        }),
        title: Text(
            'فلترة المنتجات',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
                'السعر',
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFFF221F59)
              ),
            ),
            SizedBox(height: 14.h,),
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: from,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: BorderSide(
                        color: Color(0xFFFE0E0E0),
                      ),
                    ),
                    hintText: 'من',
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFFFA6A2A2)
                    )
                  ),
                )),
                SizedBox(width: 17.w,),
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: to,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0.r),
                        borderSide: BorderSide(
                          color: Color(0xFFFE0E0E0),
                        ),
                      ),
                      hintText: 'إلى',
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFFFA6A2A2)
                      )
                  ),
                )),
              ],
            ),
            SizedBox(height: 33.h,),
            Text(
              'المقاس',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFFF221F59)
              ),
            ),
            SizedBox(height: 14.h,),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                GestureDetector(
                onTap: (){
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
                        builder: (context){
                          return StatefulBuilder(
                          builder:(BuildContext context, StateSetter setState) {
                            return Container(
                              height: 590.h,
                              padding: EdgeInsetsDirectional.only(top: 40.h,bottom: 40.h),
                              child: Column(
                                children: [
                                  Text(
                                    'المقاسات',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                      height: 380.h,
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
                                        itemCount: 6,
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
                                        'تأكيد',
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
                          } );});
                  }
                },
                child: Container(
                  height: 55.h,
                  width: 371.w,
                  padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0.r),
                    border: Border.all(color: Color(0xFFFE0E0E0))
                      ),
                  child: Stack(
                    children: [
                      Text('اختر مقاس أو أكثر',style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFFFA6A2A2)
                      ),),

                    ],
                  ),

                  ),
              ),
                Container(
                  width: 300.w,
                  height: 30.h,
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.only(start: 10.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                      itemBuilder: (context, index) => Container(
                        height: 36.h,
                        width: 44.w,
                        margin: EdgeInsetsDirectional.only(end: 6.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Color(0xFFFF4941C)
                        ),
                      )),
                )
              ],
              ),
            SizedBox(height: 33.h,),
            Text(
              'الألوان',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFFF221F59)
              ),
            ),
            SizedBox(height: 14.h,),
            GestureDetector(
              onTap: (){
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
                  builder: (context){
                  return StatefulBuilder(
                  builder:(BuildContext context, StateSetter setState) {
                  return Container(
                        height: 590.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(30.r),
                              topEnd: Radius.circular(30.r)),

                        ),
                      padding: EdgeInsetsDirectional.only(top: 40.h,bottom: 40.h),
                        child: Column(
                          children: [
                            Text(
                              'الألوان',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                                height: 380.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return RadioListTile(
                                      activeColor: Color(0xFFF221F59),
                                      value: index,
                                      groupValue: value,
                                      onChanged: (ind) => setState(() => value = ind as int?),
                                      title: Row(
                                        children: [
                                          Container(
                                            height: 30.h,
                                            width: 30.w,
                                            decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius: BorderRadius.all(Radius.circular(100.r))
                                            ),
                                          ),
                                          SizedBox(width: 13.w,),
                                          Text('أصفر',style: TextStyle(
                                              fontSize: 16.sp
                                          ),)
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: 6,
                                )
                            ),
                            Spacer(),
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
                                onPressed: () {  },
                                child: Text(
                                  'تأكيد',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ) );
                  });});
                }
              },
              child: Container(
                height: 55.h,
                width: 371.w,
                padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0.r),
                    border: Border.all(color: Color(0xFFFE0E0E0))
                ),
                child: Stack(
                  children: [
                    Text('اختر لون او أكثر',style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFFFA6A2A2)
                    ),)
                  ],
                ),

              ),
            ),
            SizedBox(height: 33.h,),
            Text(
              'العلامة التجارية',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFFF221F59)
              ),
            ),
            SizedBox(height: 14.h,),
            GestureDetector(
              onTap: (){
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
                        height: 441.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(30.r),
                              topEnd: Radius.circular(30.r)),

                        ),
                      padding: EdgeInsetsDirectional.only(top: 40.h,bottom: 40.h),
                        child: Column(
                          children: [
                            Text(
                              'الألوان',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                                height: 250.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return RadioListTile(
                                      activeColor: Color(0xFFF221F59),
                                      value: index,
                                      groupValue: value,
                                      onChanged: (ind) => setState(() => value = ind as int?),
                                      title: Text("اديدس",style: TextStyle(
                                        fontSize: 16.sp,

                                      ),),
                                    );
                                  },
                                  itemCount: 6,
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
                                onPressed: () {  },
                                child: Text(
                                  'تأكيد',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ) );
                  } );});
                }
              },
              child: Container(
                height: 55.h,
                width: 371.w,
                padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0.r),
                    border: Border.all(color: Color(0xFFFE0E0E0))
                ),
                child: Stack(
                  children: [
                    Text('اختر براند او أكثر',style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFFFA6A2A2)
                    ),)
                  ],
                ),

              ),
            ),
            SizedBox(height: 33.h,),
            Text(
              'امكانية التقسيط',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFFF221F59)
              ),
            ),
            SizedBox(height: 14.h,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0.r),
                    borderSide: BorderSide(
                      color: Color(0xFFFE0E0E0),
                    ),
                  ),
                  hintText: 'اختر ',
                  hintStyle: TextStyle(
                      fontSize: 12.sp,
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
            SizedBox(height: 43.h,),
            Container(
              height: 46.h,
              width: 367.w,
              decoration: BoxDecoration(
                  color: Color(0xFFFF4941C),
                  borderRadius: BorderRadius.all(Radius.circular(5.r))
              ),
              child: MaterialButton(
                onPressed: () {  },
                child: Text(
                  'فلترة',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp
                  ),
                ),
              ),
            ),
          ],
        ),
      )
      
    );
  }
}
