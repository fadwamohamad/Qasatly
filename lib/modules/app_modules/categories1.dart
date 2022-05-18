import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qastly/layout/cubit/cubit.dart';
import 'package:qastly/modules/app_modules/categories.dart';
import 'package:qastly/shared/component/component.dart';

import '../../layout/cubit/states.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppLayoutCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF221F59),
        title: Text(
          'كل التصنيفات',
          style: TextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: BlocConsumer<AppLayoutCubit, AppLayoutStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AppLoadingCategoriesState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFF4941C),
                          backgroundColor: Color(0xFFFF4941C).withOpacity(0.3),
                        ),
                      );
                    } else if (state is AppErrorCategoriesState) {
                      return AlertDialog(
                        content: Text('Errrrror'),
                      );
                    } else {
                      return buildGrid(cubit);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGrid(AppLayoutCubit cubit) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 26.58.sp,
          crossAxisSpacing: 8.86.sp),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        child: Container(
          height: 200.22.h,
          width: 177.1.w,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: cubit.categoryModel!.result!.category![index].imageUrl!,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Text(
                  cubit.categoryModel!.result!.category![index].name!,
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w800
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          navigateTo(context, CategoriesPage());
        },
      ),
      itemCount: cubit.categoryModel!.result!.category!.length,
    );
  }
}
