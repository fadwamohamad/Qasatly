abstract class AppLayoutStates {}
class AppInitialState extends AppLayoutStates {}
class AppChangeBottomNavState extends AppLayoutStates {}

class AppLoadingHomeDataState extends AppLayoutStates {}
class AppSuccessHomeDataState extends AppLayoutStates {}
class AppErrorHomeDataState extends AppLayoutStates {}

class AppLoadingCategoriesState extends AppLayoutStates {}
class AppSuccessCategoriesState extends AppLayoutStates {}
class AppErrorCategoriesState extends AppLayoutStates {
  final String error;
  AppErrorCategoriesState(
      this.error,
      );
}

class AppLoadingMainSubCategoryState extends AppLayoutStates {}
class AppSuccessMainSubCategoryState extends AppLayoutStates {}
class AppErrorMainSubCategoryState extends AppLayoutStates {
  final String error;
  AppErrorMainSubCategoryState(
      this.error,
      );
}

class AppLoadingSubSubCategoryState extends AppLayoutStates {}
class AppSuccessSubSubCategoryState extends AppLayoutStates {}
class AppErrorSubSubCategoryState extends AppLayoutStates {
  final String error;
  AppErrorSubSubCategoryState(
      this.error,
      );
}

class ChangeRadioState extends AppLayoutStates{}