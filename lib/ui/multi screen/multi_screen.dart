import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/multi bloc/multi_bloc.dart';
import '../../bloc/multi bloc/multi_events.dart';
import '../../bloc/multi bloc/multi_state.dart';
import '../counter/counter_screen.dart';

class MultiScreen extends StatefulWidget {
  const MultiScreen({super.key});

  @override
  State<MultiScreen> createState() => _MultiScreenState();
}

class _MultiScreenState extends State<MultiScreen> {
  @override
  Widget build(BuildContext context) {
    log("Multi Screen build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'MultiState using Bloc',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Notification Row
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Row(
                  children: [
                    Text('Notification'),
                    SizedBox(width: 8),
                    Icon(Icons.notifications_active),
                  ],
                ),
                const Spacer(),
                BlocBuilder<MultiBloc, MultiState>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    log("Switch build");
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (_) => context
                          .read<MultiBloc>()
                          .add(SwitchEnableDisableEvent()),
                    );
                  },
                ),
              ],
            ),
          ),

          // Slider & Container
          BlocBuilder<MultiBloc, MultiState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              log("Container-Slider build");
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(state.slider),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Slider(
                      value: state.slider,
                      min: 0.1,
                      max: 1.0,
                      onChanged: (value) => context
                          .read<MultiBloc>()
                          .add(SliderEvent(slider: value)),
                    ),
                  ],
                ),
              );
            },
          ),

          // Counter Screen taking remaining space
          const SizedBox(height: 16),
          Expanded(child: CounterScreen()),
        ],
      ),
    );
  }
}
