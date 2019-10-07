import 'package:moor_flutter/moor_flutter.dart';
part 'my_database.g.dart';

class Produtos extends Table {
  TextColumn get codigo => text()();
  TextColumn get descricao => text().withLength(min: 2, max: 40)();
  DateTimeColumn get datahora => dateTime()();
}

class Clientes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 2, max: 40)();

}


// o Jacob fez algumas alteracoes aqui nesta classe para que ela fique
// em singleton
@UseMoor(tables: [Produtos, Clientes])
class MyDatabase extends _$MyDatabase {

  static final MyDatabase instance = MyDatabase._internal();

  MyDatabase._internal() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  // construtores p/retornar dados
  Future getAllProdutos(){
    return select(produtos).get();
  }

  // construtores p/retornar dados
  Future getAllClientes(){
    return select(clientes).get();
  }



  @override
  int get schemaVersion => 1; 
}