
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qastly/layout/cubit/cubit.dart';
import 'package:qastly/layout/cubit/states.dart';
import 'package:qastly/modules/app_modules/brands/brands.dart';
import 'package:qastly/modules/app_modules/categories.dart';
import 'package:qastly/shared/component/component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late AppLayoutCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = AppLayoutCubit.get(context);
    if(cubit.homeModel==null)
      cubit.getHomeData();
    else
      cubit.emit(AppSuccessHomeDataState());

  }
  @override
  Widget build(BuildContext context) {

        return Scaffold(
        backgroundColor: Color(0xFFFE5E5E5),
        body:  BlocConsumer<AppLayoutCubit,AppLayoutStates>(
          listener: (context, state) {},
          builder:(context, state) {
            if(state is AppLoadingHomeDataState){
              return  Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFF4941C),
                  backgroundColor: Color(0xFFFF4941C).withOpacity(0.3),
                ),
              );
            }else if(state is AppErrorHomeDataState){
              return AlertDialog(
                content: Text('Errrrror'),
              );
            }else if(state is AppSuccessHomeDataState){
              return bulidHome(cubit);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        )
        );

     //   state==AppSuccessHomeDataState?Center(child: Text(cubit.homeModel!.result!.sliders![0].imageUrl!),):Center(child:CircularProgressIndicator() ,)

      }


  Row buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 19.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('أهلا بك , ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),),
                    Text('محمد أشرف', style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Text('عنوان التوصيل, ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),),
                    Text('أدخل عنوان',  style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ) ),
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Get.to(() => const NotificationUi());
          },
          child: Container(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 15.w,
              top: 15.h,
              bottom: 16.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0XFFF5F5F5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 1.w, color:Colors.black26),
            ),
            child: SvgPicture.asset(
              'assets/icons/searchhhh.svg',
              height: 15.8.h,
              width: 15.8.w,
            ),
          ),
        ),
        SizedBox(width: 8.w,),
        InkWell(
          onTap: () {
            // Get.to(() => const NotificationUi());
          },
          child: Container(
            padding: EdgeInsetsDirectional.only(
              start: 14.w,
              end: 14.w,
              top: 13.h,
              bottom: 12.h,
            ),
            decoration: BoxDecoration(
                color: const Color(0XFFF5F5F5),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    width: 1.w, color: Colors.black26)),
            child: SvgPicture.asset(
              'assets/icons/notifi.svg',
              height: 22.h,
              width: 19.w,
            ),
          ),
        )
      ],
    );
  }
  Widget buildCarouselSlider(AppLayoutCubit cubit,int index){
    return Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.only(
          top: 19.h,
          bottom: 19.h,
        ),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => Image.asset('assets/images/imageQas.png'),
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
          imageUrl: cubit.homeModel!.result!.sliders![index].imageUrl!,));
  }
  Widget bulidHome(AppLayoutCubit cubit){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 475.h,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(
                      top: 63.h,
                      bottom: 80.h,
                      end: 17.w,
                      start: 17.w
                  ),
                  height: 450.h,
                  color: Color(0xFFF221F59),

                  child: Column(
                    children: [
                      buildHeader(context),
                      CarouselSlider.builder(
                        itemCount: cubit.homeModel!.result!.sliders!.length,
                        carouselController: _controller,
                        itemBuilder: (context, index, realIndex) => buildCarouselSlider(cubit, index),
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: cubit.homeModel!.result!.sliders!.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 5.0.w,
                              height: 5.0.h,
                              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.light
                                      ? Colors.white
                                      : Colors.black)
                                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ) //getRowIndicator()
                    ],
                  ),
                ),
                PositionedDirectional(
                  top: 370.h,
                  child: Container(
                    margin:EdgeInsetsDirectional.only(start: 10.w),
                    height: 100.h,
                    width: 414.w,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                navigateTo(context, CategoriesPage());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w),
                                height: 113.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF4941C),
                                    borderRadius: BorderRadius.all(Radius.circular(10.r))
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(top: 15.h),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: cubit.homeModel!.result!.categories![index].imageUrl!,
                                        placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                      SizedBox(height: 12.h,),
                                      Text(cubit.homeModel!.result!.categories![index].name!,style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white
                                      ),)
                                    ],
                                  ),
                                ),
                              ));
                        },
                        itemCount: cubit.homeModel!.result!.categories!.length),
                  ),
                ),
              ],
            ),
          ),
          ListView(
            padding: EdgeInsetsDirectional.only(start: 19.w,top: 43.h,end: 15.w),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text('العلامات التجارية',style: TextStyle(
                        fontSize: 16.sp,),),
                      const Spacer(),
                      TextButton(onPressed: (){
                        navigateTo(context, Brands());
                      }, child: Text('المزيد',style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFFF221F59)
                      ),),)

                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    height: 134.h,
                    width: 467.w,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index)=>
                          Container(
                            margin: EdgeInsetsDirectional.only(end: 5.w),
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child: CachedNetworkImage(imageUrl: cubit.homeModel!.result!.brands![index].imageUrl!,) ,
                          ),
                      itemCount: cubit.homeModel!.result!.brands!.length,
                    ),
                  )
                ],
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Row(
                        children: [
                          Text(cubit.homeModel!.result!.categoryProducts![index].name!,style: TextStyle(
                            fontSize: 16.sp,

                          ),),
                          const Spacer(),
                          TextButton(onPressed: (){

                          }, child: Text('المزيد',style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFFF221F59)

                          ),),)

                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        height: 200.h,
                        width: 467.w,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.homeModel!.result!.categoryProducts![index].products!.length,
                            //cubit.homeModel!.result!.categoryProducts![index].products!.length
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

                                ))
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => Container(
                      margin: EdgeInsetsDirectional.only(top: 25.h),
                      child:
                      CachedNetworkImage(
                        imageUrl: cubit.homeModel!.result!.categoryProducts![index].banner!=null? cubit.homeModel!.result!.categoryProducts![index].banner!.imageUrl!:"",
                        errorWidget: (context, url, error) => Image.asset('assets/images/banner.png'),
                        progressIndicatorBuilder: (context, url, progress) => Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                      )),
                  itemCount: cubit.homeModel!.result!.categoryProducts!.length)
            ],
          ),
          // Container(
          //   child: ListView.separated(
          //     scrollDirection: Axis.vertical,
          //     padding: EdgeInsetsDirectional.zero,
          //     physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         mainAxisSize: MainAxisSize.min,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           // _homeController.categoryProducts[index].products.length != 0
          //           //     ?
          //           SectionTitle(
          //               title: 'عروض',
          //               // _homeController.categoryProducts[index].name,
          //               press: () {
          //                 // if (_homeController
          //                 //     .categoryProducts[index].idIsInteger) {
          //                 //   data["category_id"] =
          //                 //       _homeController.categoryProducts[index].id;
          //                 // } else {
          //                 //   data["type"] =
          //                 //       _homeController.categoryProducts[index].id;
          //                 // }
          //                 // Get.to(() => CategoryProductsScreen(
          //                 //     parm: data,
          //                 //     title: _homeController
          //                 //         .categoryProducts[index].name));
          //               }),
          //           // : SizedBox(),
          //           ProductMainPage(
          //             products: DummyData.categoryProducts,
          //           ),
          //           SizedBox(
          //             height: 25.h,
          //           ),
          //         ],
          //       );
          //     },
          //     separatorBuilder: (context, index) {
          //       // if (_homeController.categoryProducts[index].banner != null) {
          //       return Container(
          //         width: 379.w,
          //         height: 110.h,
          //         margin: EdgeInsetsDirectional.only(bottom: 25.h),
          //         child: Image.asset(
          //           'assets/images/'
          //         ),
          //       );
          //       // } else {
          //       //   return SizedBox();
          //       // }
          //     },
          //     itemCount: 4,
          //   ),
          // ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
