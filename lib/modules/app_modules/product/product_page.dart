import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qastly/shared/component/colors.dart';
import '../../../shared/component/component.dart';
import '../../../shared/component/pageview_indecator.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<bool> isSelected1;
  final _controller =  PageController();
//PageView Dots
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);
//////
  late final _ratingController;
  late double _rating;
  double? _ratingValue;
  bool viewDescription = true ;
  @override
  void initState() {
    isSelected1 = [true, false];

    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFE5E5E5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF221F59),
          leading: backButton(onTap: () {
            Navigator.of(context).pop();
          }),
          title: Text(
            'عناية بالجسم',
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/Component 3.svg'))
          ],
        ),
        body: ListView(children: [
          Container(
              height: 306.h,
              decoration: const BoxDecoration(color: Colors.white),
              padding: EdgeInsetsDirectional.only(top: 53.h,start: 35.w,end: 20.w),
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: 5,
                      controller: _controller,
                      itemBuilder: (context, index) =>
                      Column(
                        children: [
                          Row(
                              children: [
                            Image.asset('assets/images/image 20.png',
                                 height: 173.h,
                                 width: 278.w,
                                 fit: BoxFit.cover),
                            Spacer(),
                            Column(
                              children: [
                                Container(
                                      height: 49.h,
                                      width: 49.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFE0E0E0)
                                      ),
                                      child: IconButton(icon: SvgPicture.asset('assets/icons/heart.svg',height: 23.h,width: 23.w,),onPressed: (){},),
                                    ),
                                SizedBox(height: 44.h,),
                                Container(
                                  height: 49.h,
                                  width: 49.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFF221F59)
                                  ),
                                  child: IconButton(icon: SvgPicture.asset('assets/icons/star.svg',height: 23.h,width: 23.w,),onPressed: (){
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: Text('أدخل تقييمك للمنتج',style: TextStyle(
                                          fontSize: 18.sp
                                        ),textAlign: TextAlign.center,),
                                        content: Container(
                                          height: 190.h,
                                          child: Column(
                                            children: [
                                              RatingBar(
                                                  initialRating: 0,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 30,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(Icons.star, color: Color(0xFFFF2C94C)),
                                                      half: const Icon(
                                                        Icons.star,
                                                        color: Color(0xFFFF2C94C),
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Color(0xFFFF2C94C),
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                              SizedBox(height: 30.h,),
                                              TextFormField(
                                                keyboardType: TextInputType.text,
                                                maxLines: 3,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsetsDirectional.only(top: 16.h,start: 20.w),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0.r),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFFE0E0E0),
                                                    ),
                                                  ),
                                                  hintText: 'أكتب تعليق عن المنتج',
                                                  hintStyle: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Color(0xFFFA6A2A2)
                                                  ),

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: Container(
                                              height:46.h,
                                              width: 273.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: const Color(0xFFFF4941C),
                                              ),
                                              child: MaterialButton(
                                                onPressed: () {  },
                                                child: Text(
                                                  'تأكيد',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );

                                  },),
                                ),
                              ],
                            )
                          ])
                        ],
                      )
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 0.0,
                    right: 0.0,
                    child: new Center(
                    child: new DotsIndicator(
                    controller: _controller,
                    itemCount: 5,
                    onPageSelected: (int page) {
                    _controller.animateToPage(
                    page,
                    duration: _kDuration,
                    curve: _kCurve,
                    );
                    },
                    ),),
                  )
     ],
              )),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.only(top: 25.h,start: 25.w,end: 23.w),
            children: [
              Text('فرن سمارت الكهربائي',
                style: TextStyle(
                    fontSize: 18.sp,
                  color: Color(0xFFF282626),
                  fontWeight: FontWeight.bold
                ),),
              Row(
                children: [
                  Row(
                    children: [
                      Text('₪280',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Color(0xFFF282626),
                            fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 6.h,start: 12.w,end: 12.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFFA6A2A2),
                      borderRadius: BorderRadius.all(Radius.circular(16.r))
                    ),
                    child: Text('عناية بالجسم',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                  )
                ],
              ),
              SizedBox(height: 26.h,),
              Container(
                padding: EdgeInsetsDirectional.only(top: 7.h,bottom: 7.h,start: 9.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFA4DABB),
                  borderRadius: BorderRadius.all(Radius.circular(5.r))
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/check.svg'),
                    SizedBox(width: 14.w,),
                    Text('هذا المنتج قابل للتقسيط')

                  ],
                ),
              ),
              SizedBox(height: 37.h,),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      height: 46.h,
                      width: 40.w,
                      decoration:BoxDecoration(
                        color: Color(0xFFF221F59),
                        borderRadius: BorderRadius.all(Radius.circular(2.r))
                      ),
                      child: Center(
                        child: Text('+',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    onTap: (){},
                  ),
                  SizedBox(width: 21.w,),
                  Text('01'),
                  SizedBox(width: 21.w,),
                  InkWell(
                    child: Container(
                      height: 46.h,
                      width: 40.w,
                      decoration:BoxDecoration(
                          color: Color(0xFFF221F59),
                          borderRadius: BorderRadius.all(Radius.circular(2.r))
                      ),
                      child: Center(
                        child: Text('-',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    onTap: (){},
                  ),
                  Spacer(),
                  Container(
                    decoration:BoxDecoration(
                        color: Color(0xFFFF4941C),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    child: MaterialButton(onPressed: () {  },
                      child: Text('إضافة الى السلة',style: TextStyle(
                        fontSize: 16.sp,color: Colors.white
                      ),),
                    )
                  ),
                ],
              ),
              SizedBox(height: 22.h,),
              Row(
                children: [
                  Text('العلامة التجارية'),
                  Spacer(),
                  Image.asset('assets/images/image 13.png')
                ],
              ),
              SizedBox(height: 39.h,),
              Text('المقاسات'),
              SizedBox(height: 22.h,),
              Container(
                height: 50,
                width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                      height: 32.h,
                      width: 68.w,
                      margin: EdgeInsetsDirectional.only(end: 25.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        color: Color(0xFFFF4941C)
                      ),
                    ),
                  itemCount: 9,
                ),
              ),
              SizedBox(height: 39.h,),
              Text('الألوان'),
              SizedBox(height: 22.h,),
              Container(
                height: 50,
                width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30.h,
                        width: 30.w,
                        margin: EdgeInsetsDirectional.only(end: 49.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF4941C)
                        ),
                      ),
                      Text('أصفر',textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 12.sp
                      ),)
                    ],
                  ),
                  itemCount: 9,
                ),
              ),
              SizedBox(height: 48.h,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFE0E0E0),
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                ),
                child: Container(
                 // color: CustomColors.greyE0Color,
                  decoration: BoxDecoration(
                      color: CustomColors.greyE0Color,
                      borderRadius: BorderRadius.all(Radius.circular(19.r))
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: viewDescription?CustomColors.mainColor:CustomColors.greyE0Color,
                            borderRadius: BorderRadius.all(Radius.circular(19.r))
                        ),
                        width: 179.w,
                        padding: EdgeInsetsDirectional.only(top: 8.h,bottom: 8.h,start: 8.w,end: 8.w),
                        child:GestureDetector(
                        child:  Text(
                            'تفاصيل المنتج',
                            style: TextStyle(
                                fontSize: 16,
                              color: viewDescription?Colors.white:Color(0xFFFA6A2A2)
                            ),
                            textAlign: TextAlign.center,

                          ),
                          onTap: (){
                            setState(() {
                              isSelected1 = [true, false];
                              viewDescription = true;
                            });
                          },
                        ),

                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: viewDescription?CustomColors.greyE0Color:CustomColors.mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(19.r))
                        ),
                        width: 179.w,
                        padding: EdgeInsetsDirectional.only(top: 8.h,bottom: 8.h,start: 8.w,end: 8.w),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isSelected1 = [false, true];
                              viewDescription = false;
                            });
                          },
                          child: Text(
                            'التقيمات',
                            style: TextStyle(
                                fontSize: 16,
                                color: viewDescription?Color(0xFFFA6A2A2):Colors.white

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                      ),
                    ]
                  ),
                ),
              ),
              SizedBox(height: 17.h,),
              Stack(
                children: [
                      Visibility(
                        visible: viewDescription,
                          child: Text('ناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروءناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ',
                          style: TextStyle(
                            fontSize: 12.sp
                          ),)),
                      Visibility(
                        visible: !viewDescription,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  RatingBar(
                                      initialRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 30,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star, color: Color(0xFFFF2C94C)),
                                          half: const Icon(
                                            Icons.star,
                                            color: Color(0xFFFF2C94C),
                                          ),
                                          empty: const Icon(
                                            Icons.star_outline,
                                            color: Color(0xFFFF2C94C),
                                          )),
                                      onRatingUpdate: (value) {
                                        setState(() {
                                          _ratingValue = value;
                                        });
                                      }),
                                  SizedBox(width: 26.w,),
                                  Text('(1204)',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Color(0xFFF221F59),
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 26.h,),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 3,
                                  itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xFFFC4C4C4),
                                      ),
                                      SizedBox(width: 12.w,),
                                      Text('إسم المستخدم',style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp
                                      ),)
                                    ],
                                  ),
                                  SizedBox(height: 9.h,),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(start: 45.w),
                                    child: Text('هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر ',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                        color: Color(0xFFF828282)
                                      ),),
                                  )
                                ],
                              )),
                              SizedBox(height: 15.h,),
                              TextButton(onPressed: (){}, child: Text('إقرأ مزيد من التعليقات',style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xFFF221F59)
                              ),))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
              Text('منتجات ذات صلة',style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400
              ),),
              SizedBox(height: 22.h,),
              Container(
                width: 200.w,
                height: 200.h,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                        Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: 191.h,
                          width: 153.w,
                          margin: EdgeInsetsDirectional.only(end: 9.w),
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          padding: EdgeInsetsDirectional.only(start: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/iron.png',height: 114.h,width: 114.w,),
                              Text('مكواه بيكو'),
                              Text('₪280')
                            ],
                          ),



                          ),
                        PositionedDirectional(
                          top: 14.h,
                          end: 13.w,
                          child: Column(
                            children: [
                              Container(
                                height: 23.h,
                                width: 23.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFE0E0E0)
                                ),
                                child: IconButton(icon: SvgPicture.asset('assets/icons/heart.svg',height: 23.h,width: 23.w,),onPressed: (){},),
                              ),
                              SizedBox(height: 8.h,),
                              Container(
                                height: 23.h,
                                width: 23.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFF221F59)
                                ),
                                child: Center(
                                  child: Text('جديد',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h,),
                              Container(
                                height: 23.h,
                                width: 23.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFF4941C)
                                ),
                                child: Center(
                                  child: Text('%20',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],

                    )),
              ),
              SizedBox(height: 22.h,),
                ],
              )
            ],
          ),



          );
  }

}

