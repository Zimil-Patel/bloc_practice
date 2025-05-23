import 'package:equatable/equatable.dart';

class MultiState extends Equatable{
  final bool isSwitch;
  final double slider;

  const MultiState({this.isSwitch = false, this.slider = 1.0});

  MultiState copyWith({bool? isSwitch, double? slider}) => MultiState(isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);

  @override
  List<Object?> get props => [isSwitch, slider];

}