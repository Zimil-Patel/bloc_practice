import 'dart:developer';
import 'package:bloc_practice/bloc/counter%20bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter%20bloc/counter_events.dart';
import 'package:bloc_practice/bloc/counter%20bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _counterBloc,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Decrement
                  IconButton(
                    padding: const EdgeInsets.all(14),
                    onPressed: () {
                     _counterBloc.add(DecrementCounter());
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 30,
                    ),
                  ),

                  // Counter value
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      log("Counter value build");
                      return Text(
                        state.counter.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),

                  // Increment
                  IconButton(
                    padding: const EdgeInsets.all(14),
                    onPressed: () {
                      _counterBloc.add(IncrementCounter());
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
