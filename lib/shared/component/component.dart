import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qastly/shared/component/pageview_indecator.dart';


// Widget getRowIndicator(List<Sliders> sliders) {
//   List<Widget> list = [];
//   for (var i = 0; i < sliders.length; i++) {
//     list.add(
//       SliderIndicator(
//         endMargin: 5,
//         selected: _selectedPage == i,
//         color1: Color(0XFFF7F7F7),
//         color2: Color(0XFFF7F7F7).withOpacity(0.45),
//         isCircle: true,
//       ),
//     );
//   }
//   return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
// }
Widget buildOrderDetailsItem()=>Container(
  color: Colors.white,
  margin: EdgeInsetsDirectional.only(bottom: 12.h),
  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
  child: Row(
    children: [
      Image.asset('assets/images/iron.png',
        height: 92.h,
        width: 110.w,
      ),
      SizedBox(width: 10.w),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مكواه فيليبس',
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8.w,),
          Row(
            children: [
              Text('3×20',
                style: TextStyle(
                    fontSize: 16.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 50.w,),
              Row(
                children: [
                  Text('الإجمالي',
                    style: TextStyle(
                      fontSize: 12.sp
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Text('60',
                    style: TextStyle(
                        fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),),
                  SizedBox(width: 5.w,),
                  Image.asset('assets/images/israel-new-shekel 1.png')
                ],
              ),

            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4941C),
                  borderRadius: BorderRadius.all(Radius.circular(16.r))
                ),
                child: Text('M'),
              ),
              SizedBox(width: 10.w,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(16.r))
                ),
                height: 22.h,
                width: 22.w,
              ),
            ],
          )
        ],
      )
    ],
  ),
);
Widget buildAddresses()=>Container(
  margin: EdgeInsetsDirectional.only(bottom: 20.h),
  decoration: BoxDecoration(
    color: Colors.white
  ),
  padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 26.w),
  child: Column(
    children: [
      Container(
        height: 46.h,
        width: 315.w,
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.circular(5.sp))
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 17.w),
        child: Text(
          'العنوان الأول',
          style: TextStyle(
              fontSize: 16.sp
          ),
        ),
      ),
      SizedBox(height: 10.h,),
      Text('فلسطين - الضفة الغربية - رام الله - شارع الإرسالمقابل مبنى السفينة',
        style: TextStyle(
            fontSize: 16.sp
        ),
      ),
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(onPressed: (){},
                    icon: SvgPicture.asset('assets/icons/delete.svg')),
                IconButton(onPressed: (){},
                    icon: SvgPicture.asset('assets/icons/edit.svg')),
              ],
            ),
          ),
          SizedBox(width: 100.w,),
          Expanded(child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
              color: Color(0xFFFF4941C),
              borderRadius: BorderRadius.all(Radius.circular(2.r))
            ),
            child: Text('إفتراضي',style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp
            ),),
          ))
        ],
      )
    ],
  ),
);
Widget buildBrands()=>Container(
  height: 161.h,
  width: 177.18.w,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    border: Border.all(color: Color(0xFFFE0E0E0))
  ),
  child: Center(
      child: Image.asset('assets/images/LG.png')
  ),
);
Widget buildBrandProduct()=>GestureDetector(
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.asset('assets/images/microwave.png',
                height: 100.h,
                width: 155.w,
              ),
              PositionedDirectional(
                  top: -15.h,
                  end: -14.w,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/icons/heart2.svg')))
            ],
          ),
          Text('ميكرويف سامسونج',style: TextStyle(
              fontSize: 16.sp
          ),),
          Text('₪ 20')
        ],
      ),
    ),
  ),
  onTap: () {},
);
Widget buildAqsaty()=>Container(
  color: Colors.white,
  margin: EdgeInsetsDirectional.only(bottom: 18.h),
  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 23.h),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(child: Row(
            children: [
              Text('قسط رقم',style: TextStyle(
                  fontSize: 18.sp
              ),),
              Text('1000',style: TextStyle(
                  fontSize: 18.sp
              ),)
            ],
          ),),
          SizedBox(width: 70.w,),
          Expanded(
            child: Row(
              children: [
                Text('قيمة القسط :',style: TextStyle(
                    fontSize: 12.sp
                ),),
                SizedBox(width: 13.w,),
                Text('186',style: TextStyle(
                    fontSize: 16.sp
                ),)
              ],
            ),
          )
        ],
      ),
      Divider(),
      Row(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/calendar.svg'),
              SizedBox(width: 5.w,),
              Text('2022-11-06',style: TextStyle(
                  fontSize: 12.sp
              ),)
            ],
          ),
          SizedBox(width: 38.w,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/colored-calendar.svg'),
              SizedBox(width: 5.w,),
              Text('2022-11-06',style: TextStyle(
                  fontSize: 12.sp
              ),)
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsetsDirectional.only(top: 1.h,start: 4.w,bottom: 1.h,end: 5.w),
            alignment: Alignment.center,
            color: Colors.orange,
            child: Text('قيد الانتظار',style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white
            ),),
          )
        ],
      )
    ],
  ),
);
Widget buildOrders()=>Container(
  color: Colors.white,
  margin: EdgeInsetsDirectional.only(bottom: 18.h),
  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 23.h),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(child: Row(
            children: [
              Text('طلبية رقم',style: TextStyle(
                  fontSize: 18.sp
              ),),
              Text('1000',style: TextStyle(
                  fontSize: 18.sp
              ),)
            ],
          ),),
          SizedBox(width: 70.w,),
          Expanded(
            child: Row(
              children: [
                Text('عدد المنتجات :',style: TextStyle(
                    fontSize: 12.sp
                ),),
                SizedBox(width: 13.w,),
                Text('186',style: TextStyle(
                    fontSize: 16.sp
                ),)
              ],
            ),
          )
        ],
      ),
      Divider(),
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/calendar.svg'),
                SizedBox(width: 5.w,),
                Text('2022-11-06',style: TextStyle(
                    fontSize: 12.sp
                ),)
              ],
            ),
          ),
          Expanded(child: Row(
            children: [
              SvgPicture.asset('assets/icons/colored-calendar.svg'),
              SizedBox(width: 5.w,),
              Text('2022-11-06',style: TextStyle(
                  fontSize: 12.sp
              ),)
            ],
          )),
          Expanded(
            child: Container(
              height: 21.h,
              width: 65.w,
              alignment: Alignment.center,
              color: Colors.orange,
              child: Text('جديد',style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white
              ),),
            ),
          )
        ],
      )
    ],
  ),
);
Widget customText(String text,
    {double size = 15,
      Color color = Colors.black,
      FontWeight fontWeight = FontWeight.bold,
      double height = 1.5,
      TextAlign align = TextAlign.start,
      TextOverflow textOverflow = TextOverflow.ellipsis,
      TextDecoration decoration = TextDecoration.none})
  => Text(
    text,
    textAlign: align,
    style: TextStyle(
      color: color,
      fontSize: size.sp,
      fontWeight: fontWeight,
      height: height.h,
      decoration: decoration,
    ),
    overflow: textOverflow,
  );
Widget backButton({required Function onTap})
  => Padding(
    padding: EdgeInsetsDirectional.only(
      start: 15.w,
      bottom: 10.h,
      top: 10.h,
    ),
    child: InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsetsDirectional.only(
            start: 15.w, top: 10.h, end: 7.w, bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xFFFF4941C),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 15.r,
        ),
      ),
    ),
  );

Widget buildFavouriteProduct()=>GestureDetector(
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.asset('assets/images/microwave.png',
                height: 100.h,
                width: 155.w,
              ),
              PositionedDirectional(
                  top: -15.h,
                  end: -10.w,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/icons/heart press.svg')))
            ],
          ),
          Text('ميكرويف سامسونج',style: TextStyle(
              fontSize: 16.sp
          ),),
          Text('₪ 20')
        ],
      ),
    ),
  ),
  onTap: () {},
);
Widget buildSubCategoryProduct()=>GestureDetector(
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.asset('assets/images/microwave.png',
                height: 100.h,
                width: 155.w,
              ),
              PositionedDirectional(
                  top: -15.h,
                  end: -10.w,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/icons/heart2.svg')))
            ],
          ),
          Text('ميكرويف سامسونج',style: TextStyle(
              fontSize: 16.sp
          ),),
          Text('₪ 20')
        ],
      ),
    ),
  ),
  onTap: () {},
);
Widget getRowIndicator() {
  int pageIndex = 0;
  List<Widget> list = [];
  for (var i = 0; i < 4; i++) {
    list.add(
      SliderIndicator(
        endMargin: 5,
        selected: pageIndex == i,
        color1: Colors.white,
        color2: Colors.white.withOpacity(0.5),
        isCircle: true,
      ),
    );
  }
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
}
Widget customSizeListView({
  required int value,
  required int groupValue,
  required Function onChange
})=>RadioListTile<int>(
    activeColor: Color(0xFFF221F59),
    title: Text('S', style: TextStyle(
        fontSize: 16.sp
    ),),
    value: value,
    groupValue: groupValue,
    onChanged: (val){
      onChange();
    },
    //onChanged: onChange
);
////////////////////////////////////////////////////////////////////////////////////////
void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
/////////////////////////////////////////////////////////////////////////////////////////
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ), (route) {
  return false;
});
void showToast({
  required String text,
  required ToastStates state,
}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastStates{SUCCESS, ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS :
      color = Colors.green;
      break;
    case ToastStates.ERROR :
      color = Colors.red;
      break;
    case ToastStates.WARNING :
      color = Colors.amber;
      break;
  }
  return color;
}

