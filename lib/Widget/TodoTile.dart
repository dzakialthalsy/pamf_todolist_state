import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Todo.dart';
import '../Provider/TodoProvider.dart';

class Todotile extends StatelessWidget {
  final Todo todo;

  const Todotile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        // ceklis tombol
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            context.read<Todoprovider>().toggleDone(todo.id);
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            color: todo.isDone ? Colors.grey : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: () {
            context.read<Todoprovider>().removeTodo(todo.id);
          },
        ),
      ),
    );
  }
}
