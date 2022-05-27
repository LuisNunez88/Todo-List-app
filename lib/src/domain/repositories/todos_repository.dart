import 'package:flutter/widgets.dart';
import 'package:todo/src/domain/entities/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> getAll();

  Future<Todo> create({@required Todo todo});

  Future<int> remove({@required int id});
}
