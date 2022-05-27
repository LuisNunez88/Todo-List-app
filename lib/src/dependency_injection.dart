import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/src/data/data_sources/helpers/database.dart';
import 'package:todo/src/data/data_sources/local/daos/todos_dao.dart';
import 'package:todo/src/data/repositories/authentication_repository_imp.dart';
import 'package:todo/src/data/repositories/todos_repository_imp.dart';
import 'package:todo/src/domain/repositories/authentication_repository.dart';
import 'package:todo/src/domain/repositories/todos_repository.dart';

Future<void> dependencyInjection() async {
  final GetIt inject = GetIt.I;
  final Database database = await DBProvider().initDB();

  inject.registerSingleton<Database>(database);

  inject.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp());

  inject.registerLazySingleton<TodosRepository>(
      () => TodosRepositoryImp(TodosDao(database)));
}
