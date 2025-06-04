import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class TodoEvents extends Equatable{
  const TodoEvents();

  @override
  List<Object> get props => [];
}


class AddTodo extends TodoEvents{

  final String task;
  final XFile file;

  const AddTodo({required this.task, required this.file});

  @override
  List<Object> get props => [task, file];
}

class RemoveTodo extends TodoEvents{

  final int index;

  const RemoveTodo({required this.index});

  @override
  List<Object> get props => [index];
}