import 'dart:developer';
import 'package:bloc_practice/bloc/counter%20bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter%20bloc/counter_events.dart';
import 'package:bloc_practice/bloc/counter%20bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("Counter screen build");
    return Center(
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
                  context.read<CounterBloc>().add(DecrementCounter());
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
                  context.read<CounterBloc>().add(IncrementCounter());
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
    );
  }
}
