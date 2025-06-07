part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable{
  const LoginEvents();
}

class LoginWithEmailPassword extends LoginEvents{

  final String email, password;

  const LoginWithEmailPassword({required this.email, required this.password,});

  @override
  List<Object?> get props => [email, password];
}