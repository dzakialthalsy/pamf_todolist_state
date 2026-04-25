import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/TodoProvider.dart';
import '../Widget/TodoTile.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<Todoprovider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TodoList Apps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Todo list',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<Todoprovider>().addTodo(_controller.text);
                    _controller.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterChip(
                label: const Text('Semua'),
                selected: todoProvider.filter == 'semua',
                onSelected: (_) =>
                    context.read<Todoprovider>().setFilter('semua'),
              ),
              const SizedBox(width: 10),
              FilterChip(
                label: const Text('Aktif'),
                selected: todoProvider.filter == 'aktif',
                onSelected: (_) =>
                    context.read<Todoprovider>().setFilter('aktif'),
              ),
              const SizedBox(width: 10),
              FilterChip(
                label: const Text('Selesai'),
                selected: todoProvider.filter == 'selesai',
                onSelected: (_) =>
                    context.read<Todoprovider>().setFilter('selesai'),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                return Todotile(todo: Todoprovider.todos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
