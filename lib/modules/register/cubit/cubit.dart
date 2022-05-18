import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qastly/models/register_model.dart';
import 'package:qastly/modules/register/cubit/states.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;
  int? activeSmsCode;

  void userRegister({
    required String username,
    required String phone,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: 'register',
      data: {
        'username': username,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      print(value);
      // activeSmsCode = registerModel.result.user!.smsVerify;
      registerModel = RegisterModel.fromJson(value.data);
      CacheHelper().addStringToSF('token', registerModel!.result!.token!);
      emit(
        RegisterSuccessState(registerModel),
      );
    }).catchError((error) {
      print(error.toString());
      emit(
        RegisterErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  // void sendSmsCode({
  //   required String smsCode,
  // }) {
  //   emit(SmsLoadingState());
  //   DioHelper.postData(
  //       url: 'auth/sms_code',
  //       token: token,
  //       data: {
  //     'sms_code' : smsCode,
  //   }).then((value) {
  //     //print('ValueData ${value.data.toString().contains('msg')}');
  //     print('SmsCodeData ${value.data}');
  //     print('SmsCodeStatus ${value.statusCode}');
  //     if (value.statusCode == 200)
  //       emit(SmsSuccessState());
  //   }).catchError((error) {
  //     emit(SmsErrorState(
  //         error: error.toString()));
  //     print('${error.toString()}  error');
  //   });
  // }

  var timToken;
  void sendSmsCode({
    required smsCode,
  }) {
    emit(SmsLoadingState());
    DioHelper.postData(
      url: 'auth/sms_code',
      data: {
        'sms_code': smsCode,
      },
    ).then((value) => {
              print('SmsCodeData ${value.data}'),
              print('SmsCodeStatus ${value.statusCode}'),
              // print('ValueData ${value.data.toString().contains('message')}'),
              //activeModel =  ActiveModel.fromJson(value.data),
              //timToken = printFullText(('${registerModel!.result!.token}'),),
              timToken = registerModel!.result!.token,
              CacheHelper().addStringToSF('token', timToken),
              emit(SmsSuccessState()),print("state $state")
              // CacheHelper().saveData(
              //   key: 'token',
              //   value: "Bearer $timToken",
              // ).then((value)  => {
              //   token = 'Bearer $timToken',
              //
              // }
              // ),

      //if (value.statusCode == 200)
            })
        .catchError((error) {
          emit(SmsErrorState());
          print('${error.toString()} + error');
          print("state $state");
});
  }
}
