import 'dart:io';

import 'package:bloc_practice/bloc/todo%20bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/todo bloc/todo_bloc.dart';
import '../../bloc/todo bloc/todo_events.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Bloc'),
        centerTitle: true,
        elevation: 1,
      ),

      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) => state.todoList.isEmpty
            ? Center(
                child: Text('No Todo Found'),
              )
            : ListView.builder(
                padding: EdgeInsets.all(12),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Text((index + 1).toString()),
                    title: Row(
                      children: [
                        
                        // Image
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              File(state.todoList[index]['file'].path
                                  .toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 12,),

                        // Task
                        Text(state.todoList[index]['task']),
                      ],
                    ),
                    
                    trailing: IconButton(onPressed: (){
                      context.read<TodoBloc>().add(RemoveTodo(index: index));
                    }, icon: Icon(Icons.delete),),
                  ),
                ),
                itemCount: state.todoList.length,
              ),
      ),

      // Floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(14),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            _showAddTodoDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

void _showAddTodoDialog(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  XFile? selectedImage;

  showDialog(
    context: context,
    builder: (_) => BlocProvider.value(
      value: context.read<TodoBloc>(),
      child: StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Enter task'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? file =
                          await picker.pickImage(source: ImageSource.camera);
                      if (file != null) {
                        setState(() => selectedImage = file);
                      }
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('Take Image'),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? file =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (file != null) {
                        setState(() => selectedImage = file);
                      }
                    },
                    icon: const Icon(Icons.image),
                    label: const Text('Pick Image'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (selectedImage != null)
                Image.file(
                  File(selectedImage!.path),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final task = controller.text.trim();
                if (task.isNotEmpty && selectedImage != null) {
                  context
                      .read<TodoBloc>()
                      .add(AddTodo(task: task, file: selectedImage!));
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      }),
    ),
  );
}
