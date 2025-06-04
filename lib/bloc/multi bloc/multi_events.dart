import 'package:equatable/equatable.dart';

abstract class MultiEvent extends Equatable{

  const MultiEvent();

  @override
  List<Object?> get props => [];

}

class SwitchEnableDisableEvent extends MultiEvent{}

class SliderEvent extends MultiEvent{
  final double slider;

  const SliderEvent({required this.slider});

  @override
  List<Object?> get props => [];
}