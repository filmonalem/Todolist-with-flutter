class Todo {
  int? id; // optional for SQLite auto-increment
  String title;
  bool isDone;

  Todo({
    this.id,
    required this.title,
    this.isDone = false,
  });

  // Convert a Todo into a Map. The keys must match the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0, // SQLite doesn't have boolean
    };
  }

  // Create a Todo from a Map
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'] == 1,
    );
  }
}
