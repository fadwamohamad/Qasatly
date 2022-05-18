import 'package:qastly/models/register_model.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates {
  final RegisterModel? registerModel;
  RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterStates {
  final String? error;
  RegisterErrorState({this.error});

}
class SmsInitialState extends RegisterStates{}
class SmsLoadingState extends RegisterStates{}
class SmsSuccessState extends RegisterStates{
}
class SmsErrorState extends RegisterStates{
  final String? error;
  SmsErrorState({this.error});
}


