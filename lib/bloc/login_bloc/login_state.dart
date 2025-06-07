part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String message;

  const LoginState({this.loginStatus = LoginStatus.initial, this.message = ''});

  LoginState copyWith(
          {LoginStatus? loginStatus, String? message}) =>
      LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [loginStatus, message];
}
