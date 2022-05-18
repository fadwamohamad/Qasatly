import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/component/component.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  int lastIndex = -1;
  ScrollController? scrollController;
  void _animateToIndex(double index, double _height) {
    double to = (index * _height);
    if (scrollController != null) {
      scrollController!.animateTo(
        to,
        duration: const Duration(seconds: 2),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
          'مركز المساعدة',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w,top: 46.h),
        itemCount: 3,
        itemBuilder: (context, index) {
        return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _animateToIndex(index.toDouble(), 0);
                lastIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 15.h),
                  padding: EdgeInsetsDirectional.only(
                      start: 16.w, end: 19.w, top: 26.h, bottom: 24.h),
                  decoration: BoxDecoration(
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      customText(
                        'شكل توضع الفقرات في الصفحة',
                        color: Color(0xFF434448),
                        size: 16.sp,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF434448),
                        size: 14.r,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 5.w,
                    end: 5.w,
                    top: 1.h,
                    bottom: 10.h,
                  ),
                  child: Visibility(
                      visible: lastIndex == index,
                      child: Column(
                          children:
                          [Text('هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار'),
                            Text('هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. ')
          ]))
                )],
            ));
      },),
    );
  }
}
