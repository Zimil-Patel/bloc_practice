import 'package:equatable/equatable.dart';

class TodoState extends Equatable{

  final List<Map> todoList;

  const TodoState({this.todoList = const []});

  TodoState copyWith({List<Map>? todoList}) => TodoState(todoList: todoList ?? this.todoList);

  @override
  List<Object?> get props => [todoList];

}