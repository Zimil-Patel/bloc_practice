import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/todo%20bloc/todo_events.dart';
import 'package:bloc_practice/bloc/todo%20bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState>{

  TodoBloc() : super(TodoState()){
    on<AddTodo>(_addTodo);
    on<RemoveTodo>(_removeTodo);
  }

  _addTodo(AddTodo event, Emitter<TodoState> emit){
    final List<Map> list = List<Map>.from(state.todoList)..add({'task': event.task, 'file': event.file});
    emit(state.copyWith(todoList: list));
  }

  _removeTodo(RemoveTodo event, Emitter<TodoState> emit){
    final List<Map> list = List<Map>.from(state.todoList)..removeAt(event.index);
    emit(state.copyWith(todoList: list));
  }
}