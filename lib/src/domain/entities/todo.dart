import 'package:equatable/equatable.dart';

List<Todo> todosFromJson(List<dynamic> str) =>
    List<Todo>.from(str.map((x) => Todo.fromJson(x)));

class Todo extends Equatable {
  final int id;
  final String title;
  const Todo({this.id, this.title});

  Todo copyWith({
    int id,
    String title,
  }) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };

  @override
  List<Object> get props => [id, title];
}
