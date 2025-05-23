import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/multi%20bloc/multi_events.dart';
import 'package:bloc_practice/bloc/multi%20bloc/multi_state.dart';

class MultiBloc extends Bloc<MultiEvent, MultiState>{

  MultiBloc() : super(MultiState()){
    on<SwitchEnableDisableEvent>(_switchEnableDisableEvent);
    on<SliderEvent>(_sliderEvent);
  }

  void _switchEnableDisableEvent(SwitchEnableDisableEvent event, Emitter<MultiState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvent(SliderEvent event, Emitter<MultiState> emit){
    emit(state.copyWith(slider: event.slider));
  }
}