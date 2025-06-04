import 'package:bloc_practice/bloc/counter%20bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/image%20bloc/image_bloc.dart';
import 'package:bloc_practice/bloc/multi%20bloc/multi_bloc.dart';
import 'package:bloc_practice/bloc/todo%20bloc/todo_bloc.dart';
import 'package:bloc_practice/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/todo screen/todo_screen.dart';

void main() {
  runApp(BlocApp());
}

class BlocApp extends StatefulWidget {
  const BlocApp({super.key});

  @override
  State<BlocApp> createState() => _BlocAppState();
}

class _BlocAppState extends State<BlocApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => MultiBloc()),
          BlocProvider(create: (_) => ImageBloc(ImageUtils())),
          BlocProvider(create: (_) => TodoBloc()),
        ],
        child: TodoScreen(),
      ),
    );
  }
}
