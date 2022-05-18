import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qastly/layout/cubit/states.dart';
import 'package:qastly/models/category_model.dart';
import 'package:qastly/models/home_model.dart';
import 'package:qastly/models/sub_category_model.dart';
import 'package:qastly/modules/app_modules/aqsaty.dart';
import 'package:qastly/modules/app_modules/categories1.dart';
import 'package:qastly/modules/app_modules/home.dart';
import 'package:qastly/modules/app_modules/more.dart';
import 'package:qastly/modules/app_modules/shopping_cart/shopping_cart.dart';
import 'package:qastly/shared/component/constants.dart';
import 'package:qastly/shared/network/remote/dio_helper.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates>{
  AppLayoutCubit() : super(AppInitialState());
  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
     HomePage(),
     CategoriesScreen(),
     ShoppingCart(),
     AqsatyPage(),
     MorePage()
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }


  int selectedRadio = 2;
  setSelectedRadio(int val){
      selectedRadio = val;
      emit(ChangeRadioState());
  }

  HomeModel? homeModel;
  void getHomeData(){
    emit(AppLoadingHomeDataState());
    DioHelper.getData(
      url: 'home',
      token: token,
    ).then((value){

      print("data ");
      homeModel = HomeModel.fromJson(value.data);
      print("data after");

      emit(AppSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorHomeDataState());
    });
  }

  CategoryModel? categoryModel;
  void getCategoryData(){
    emit(AppLoadingCategoriesState());
    DioHelper.getData(
      url: 'category',
      token: token,
    ).then((value){
      categoryModel = CategoryModel.fromJson(value.data);
      emit(AppSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCategoriesState(error));
    });
  }

  SubCategoryModel? subCategoryModel;
  void getMainSubCategoryData(){
    emit(AppLoadingMainSubCategoryState());
    DioHelper.getData(
      url: 'sub_category?main_category_id',
      token: token,
    ).then((value){
      subCategoryModel = SubCategoryModel.fromJson(value.data);
      emit(AppSuccessMainSubCategoryState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorMainSubCategoryState(error));
    });
  }

  void getSubSubCategoryData(){
    emit(AppLoadingSubSubCategoryState());
    DioHelper.getData(
      url: 'sub_category?main_category_id',
      token: token,
    ).then((value){
      subCategoryModel = SubCategoryModel.fromJson(value.data);
      emit(AppSuccessSubSubCategoryState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorSubSubCategoryState(error));
    });
  }
}