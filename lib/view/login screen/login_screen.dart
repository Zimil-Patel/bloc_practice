import 'dart:developer';

import 'package:bloc_practice/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log('building login screen');
    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Bloc'),
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(controller: _txtEmail, hintText: 'email'),
              _buildTextField(controller: _txtPassword, hintText: 'password'),

              SizedBox(height: 20,),


              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  switch(state.loginStatus) {
                    case LoginStatus.loading:
                      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('logging in...'), duration: Duration(seconds: 2),));
                      break;

                    case LoginStatus.success:
                      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('logging success'), duration: Duration(seconds: 2),));
                      break;

                    case LoginStatus.failure:
                      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.message), duration: Duration(seconds: 2),));
                      break;

                    default:
                  }
                },
                child: ElevatedButton(onPressed: (){
                  _loginBloc.add(LoginWithEmailPassword(email: _txtEmail.text, password: _txtPassword.text,));
                }, style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                ), child: Text('Login'),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  Padding _buildTextField({required TextEditingController controller, String? hintText}) {
    return Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: controller,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            );
  }
}