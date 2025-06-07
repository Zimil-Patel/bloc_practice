import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState>{

  LoginBloc() : super(LoginState()) {
    on<LoginWithEmailPassword>(_loginWithEmailPassword);
  }

  _loginWithEmailPassword(LoginWithEmailPassword event, Emitter<LoginState> emit) async {

    if(event.email.isNotEmpty){
      final data = {'email': event.email, 'password': event.password};
      final header = {'x-api-key': 'reqres-free-v1'};
      final url = Uri.parse('https://reqres.in/api/login');

      try{
        emit(state.copyWith(loginStatus: LoginStatus.loading));
        final response = await http.post(
          url,
          body: data,
          headers: header,
        );

        if(response.statusCode == 200){
          emit(state.copyWith(loginStatus: LoginStatus.success, message: 'Success'));
        } else {
          final body = jsonDecode(response.body);
          emit(state.copyWith(loginStatus: LoginStatus.failure, message: 'error: ${body['error']}'));
        }

      } on SocketException{
        emit(state.copyWith(loginStatus: LoginStatus.failure, message: 'Something went wrong'));
      } on TimeoutException{
        emit(state.copyWith(loginStatus: LoginStatus.failure, message: 'Something went wrong'));
      }
    } else {
      log("called");
      emit(state.copyWith(loginStatus: LoginStatus.failure, message: 'Please Enter email and password.'));
      emit(LoginState());
    }

  }

}