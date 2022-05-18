import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qastly/models/login_model.dart';
import 'package:qastly/modules/login/cubit/states.dart';
import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void userLogin({
    required String phone,
    required String password,
  //  required String fcmToken,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'login', data: {
      'phone': phone,
      'password': password,
      // 'fcm_token': fcmToken,
      // 'device_type': 'flutter'
    }).then((value) {
      print('LoginModelData ${value.data}');
      print('LoginModelData ${value.statusCode}');
      loginModel = LoginModel.fromJson(value.data);
      if (value.statusCode == 200)
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print('${error.toString()}  error ccccccccccccccccc');
    });
  }

  void forgetPassword({
    required String phone,
  }) {
    emit(ForgetPassLoadingState());
    DioHelper.postData(url: 'forget_password', data: {
      'phone': phone,
    }).then((value) {
      print('ForgetPasswordData ${value.data}');
      print('ForgetPasswordData ${value.statusCode}');
      if (value.statusCode == 200)
        emit(ForgetPassSuccessState());
    }).catchError((error) {
      emit(ForgetPassErroeState(error.toString()));
      print('${error.toString()}  error ccccccccccccccccc');
    });
  }
}
