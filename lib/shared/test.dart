// import 'package:agri_store/models/dummy_data.dart';
// import 'package:agri_store/screens/basic_screen/categories/categories_controller.dart';
// import 'package:agri_store/screens/basic_screen/product_details/product_controller.dart';
// import 'package:agri_store/screens/basic_screen/products_list/products_list_ui.dart';
// import 'package:agri_store/screens/sub_categories/sub_categories2.dart';
// import 'package:agri_store/services/webservice.dart';
// import 'package:agri_store/utils/colors.dart';
// import 'package:agri_store/widgets/app_bar.dart';
// import 'package:agri_store/widgets/list_general_ui.dart';
// import 'package:agri_store/widgets/text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class SubCategoriesUi extends StatefulWidget {
//   int index;
//
//   @override
//   _SubCategoriesUiState createState() => _SubCategoriesUiState();
//
//   SubCategoriesUi({required this.index});
// }
//
// class _SubCategoriesUiState extends State<SubCategoriesUi>
//     with SingleTickerProviderStateMixin {
//   CategoriesGetXController categoriesGetXController = Get.find();
//   ProductController productController = Get.put(ProductController());
//
//   late TabController tabController;
//   late List<Tab> myTabs;
//   late List<String> myId;
//
//   late List<Widget> views;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     myTabs = List.generate(categoriesGetXController.category.length, (index) {
//       return Tab(
//         text: categoriesGetXController.category[index].name,
//       );
//     });
//     myId = List.generate(categoriesGetXController.category.length, (index) {
//       return categoriesGetXController.category[index].id.toString();
//     });
//     tabController = TabController(
//         vsync: this,
//         length: categoriesGetXController.category.length,
//         initialIndex: widget.index);
//
//     views = List.generate(
//       categoriesGetXController.category.length,
//           (index) => Obx(() {
//         return ListGeneralUi(
//           isMoreDataAvailable: false,
//           length: categoriesGetXController.subCategory.length,
//           error: '',
//           onGetData: (page) async {
//             return false;
//           },
//           status: LoadingStatus.completed,
//           pagination: true,
//           pullToRefresh: true,
//           itemBuilder: (context, index2) {
//             return Padding(
//               padding: EdgeInsets.only(bottom: 15.h),
//               child: InkWell(
//                 onTap: () async {
//                   await categoriesGetXController.getSubData(
//                       parent_id: categoriesGetXController.subCategory[index2].id
//                           .toString());
//                   Map<String, dynamic> parm = <String, dynamic>{};
//
//                   parm["category_id"] = categoriesGetXController
//                       .subCategory[index2].id
//                       .toString();
//
//                   await productController.getProduct(map: parm);
//                   Get.to(() => Sub2CategoriesUi(
//                     index: index2,
//                   ));
//                   // Map<String, dynamic> parm = <String, dynamic>{};
//                   //
//                   // parm["category_id"] =
//                   //     categoriesGetXController.subCategory[index2].id.toString();
//                   //
//                   // Get.to(ProductsListUi(
//                   //   title: categoriesGetXController.subCategory[index2].name ?? '',
//                   //   parm: parm,
//                   // ));
//                 },
//                 child: Ink(
//                   padding: EdgeInsetsDirectional.only(
//                       start: 20.0.w, top: 19.h, bottom: 19.h, end: 20.w),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(16.r),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: customText(
//                           categoriesGetXController.subCategory[index2].name ??
//                               '',
//                           fontWeight: FontWeight.w600,
//
//                           size: 18,
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         color: CustomColors.mainColor,
//                         size: 20.r,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     tabController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xFFE5E5E5),
//         appBar: customAppBar(context, title: 'التصنيفات'),
//         body: DefaultTabController(
//           length: categoriesGetXController.category.length,
//           child: Container(
//             height: double.infinity,
//             child: Column(
//               children: [
//                 // SizedBox(
//                 //   height: 62.h,
//                 //   child: ListView.builder(
//                 //       shrinkWrap: true,
//                 //       scrollDirection: Axis.horizontal,
//                 //       itemCount: categoriesGetXController.category.length,
//                 //       itemBuilder: (context, index) {
//                 //         return Container(
//                 //           color: CustomColors.seconderyColor,
//                 //           // height: 62.h,
//                 //           padding: EdgeInsetsDirectional.only(
//                 //               start: 16.w, end: 16.w, top: 19.h, bottom: 14.h),
//                 //           child: customText(
//                 //             categoriesGetXController.category[index].name ?? '',
//                 //             size: 18,
//                 //             color: CustomColors.whiteColor,
//                 //           ),
//                 //         );
//                 //       }),
//                 // ),
//                 Container(
//                   padding: EdgeInsets.zero,
//                   height: 62.h,
//                   color: CustomColors.seconderyColor,
//                   child: TabBar(
//                     isScrollable: true,
//                     indicatorColor: CustomColors.mainColor,
//                     controller: tabController,
//                     onTap: (index) {
//                       setState(() {
//                         categoriesGetXController.getData(
//                             parent_id: myId[index]);
//                       });
//                     },
//                     // unselectedLabelColor: CustomColors.GREY1_COLOR,
//                     labelStyle: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.normal,
//                         fontFamily: 'Avenir'),
//
//                     tabs: myTabs,
//                   ),
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: views,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
