import 'package:flutter/widgets.dart';
import 'package:todo/src/data/data_sources/local/daos/todos_dao.dart';
import 'package:todo/src/domain/entities/todo.dart';
import 'package:todo/src/domain/repositories/todos_repository.dart';

class TodosRepositoryImp extends TodosRepository {
  final TodosDao _dao;
  TodosRepositoryImp(this._dao);

  @override
  Future<Todo> create({@required Todo todo}) async {
    return await _dao.createTodo(todo);
  }

  @override
  Future<List<Todo>> getAll() async {
    return await _dao.getAll();
  }

  @override
  Future<int> remove({@required int id}) async {
    return await _dao.removeTodo(id);
  }
}
