class Task {
  final int? id;
  final String title;
  final String description;

  Task({this.id, required this.title, required this.description});
  
  factory Task.fromMap(Map<String, dynamic> map) => new Task(
    id: map['id'],
    title: map['title'],
    description: map['description'],
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': id,
      'title': title,
      'description': description
    };

    return map;
  }
}