import 'package:flutter/material.dart';
import '../Model/Todo.dart';

class Todoprovider with ChangeNotifier {
  // List todo untuk menampung data todo
  final List<Todo> _todos = [];
  int _nextId = 1;
  String _filter = 'semua';

  List<Todo> get todos {
    if (_filter == 'aktif') {
      return _todos.where((todo) => !todo.isDone).toList();
    } else if (_filter == 'selesai') {
      return _todos.where((todo) => todo.isDone).toList();
    }
    return _todos;
  }

  String get filter => _filter;

  // function untuk menambahkan todo ke list
  void addTodo(String title) {
    _todos.add(Todo(id: _todos.length + 1, title: title));
    _nextId++;
    notifyListeners();
  }

  void toggleDone(int id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isDone = !_todos[index].isDone;
      notifyListeners();
    }
  }

  void removeTodo(int id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
}
