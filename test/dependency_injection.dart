import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/src/data/data_sources/local/daos/todos_dao.dart';
import 'package:todo/src/data/repositories/authentication_repository_imp.dart';
import 'package:todo/src/data/repositories/todos_repository_imp.dart';
import 'package:todo/src/domain/repositories/authentication_repository.dart';
import 'package:todo/src/domain/repositories/todos_repository.dart';

import 'database.dart';

abstract class TestDependencyInjection {
  static Future<void> initialize() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final GetIt inject = GetIt.I;
    final Database database = await DBProviderTest().initDB();

    inject.registerSingleton<AuthenticationRepository>(
        AuthenticationRepositoryImp());

    inject.registerSingleton<TodosRepository>(
        TodosRepositoryImp(TodosDao(database)));
  }

  static clear() {
    GetIt.I.reset();
  }
}
