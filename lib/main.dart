import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourite_state.dart';
import 'package:bloc_practice/bloc/favourite%20app%20bloc/favourtie_bloc.dart';
import 'package:bloc_practice/bloc/image%20bloc/image_bloc.dart';
import 'package:bloc_practice/bloc/multi%20bloc/multi_bloc.dart';
import 'package:bloc_practice/bloc/post%20bloc/post_bloc.dart';
import 'package:bloc_practice/bloc/todo%20bloc/todo_bloc.dart';
import 'package:bloc_practice/config/routes/routes_name.dart';
import 'package:bloc_practice/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';


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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MultiBloc()),
        BlocProvider(create: (_) => ImageBloc(ImageUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteState())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoutes,
        theme: ThemeData.dark(),
      ),
    );
  }
}
