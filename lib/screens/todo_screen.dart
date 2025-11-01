import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();
  late Box todosBox;

  @override
  void initState() {
    super.initState();
    todosBox = Hive.box('todosBox');
  }

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      final todo = {'title': _controller.text, 'isDone': false};
      todosBox.add(todo);
      _controller.clear();
      setState(() {});
    }
  }

  void _toggleTodo(int index) {
    final todo = todosBox.getAt(index) as Map;
    todosBox.putAt(index, {'title': todo['title'], 'isDone': !todo['isDone']});
    setState(() {});
  }

  void _removeTodoAt(int index) {
    todosBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? const Color(0xFF1E1E3F)
        : const Color(0xFFF7F8FA);
    final cardColor = isDark
        ? const Color(0xFF2C2C54)
        : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final secondaryText = isDark ? Colors.white70 : Colors.grey[700];

    return Scaffold(
      backgroundColor: backgroundColor,
      
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field
            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Add Item",
                        hintStyle: TextStyle(color: secondaryText),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                      ),
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.blueAccent.shade100
                          : Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: _addTodo,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "TO DO",
              style: TextStyle(
                color: secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // To-do list
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: todosBox.listenable(),
                builder: (context, box, _) {
                  if (box.isEmpty) {
                    return Center(
                      child: Text(
                        "No tasks yet — add one above!",
                        style: TextStyle(color: secondaryText),
                      ),
                    );
                  }

                  final todos = box.values.toList();
                  final active = todos
                      .asMap()
                      .entries
                      .where((e) => e.value['isDone'] == false)
                      .toList();
                  final completed = todos
                      .asMap()
                      .entries
                      .where((e) => e.value['isDone'] == true)
                      .toList();

                  return ListView(
                    children: [
                      ...active.map((entry) => _buildTodoCard(
                            entry.key,
                            entry.value,
                            cardColor,
                            textColor,
                            secondaryText!,
                            isDark,
                          )),
                      if (completed.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        Text(
                          "COMPLETED",
                          style: TextStyle(
                            color: secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...completed.map((entry) => _buildTodoCard(
                              entry.key,
                              entry.value,
                              cardColor,
                              textColor,
                              secondaryText!,
                              isDark,
                            )),
                      ]
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoCard(
    int index,
    Map todo,
    Color cardColor,
    Color textColor,
    Color secondaryText,
    bool isDark,
  ) {
    final isDone = todo['isDone'] as bool;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            shape: const CircleBorder(),
            activeColor: Colors.greenAccent.shade400,
            value: isDone,
            onChanged: (_) => _toggleTodo(index),
          ),
          Expanded(
            child: Text(
              todo['title'],
              style: TextStyle(
                fontSize: 16,
                color: isDone ? secondaryText : textColor,
                decoration:
                    isDone ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline,
                color: isDark
                    ? Colors.redAccent.shade100
                    : Colors.redAccent.shade200),
            onPressed: () => _removeTodoAt(index),
          ),
        ],
      ),
    );
  }
}
