class Task {
  final int? id;
  final String title;
  final String description;
  final int? isComplete;

  Task({this.id, required this.title, required this.description, required this.isComplete});
  
  factory Task.fromMap(Map<String, dynamic> map) => new Task(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    isComplete: map['isComplete']
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': id,
      'title': title,
      'description': description,
      'isComplete': isComplete
    };

    return map;
  }
}