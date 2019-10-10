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


class Configurations extends Table {
  TextColumn get email => text()();
  DateTimeColumn get lastSincro => dateTime()();
  BoolColumn get lastSincroStt => boolean()();
}



// o Jacob fez algumas alteracoes aqui nesta classe para que ela fique em singleton
@UseMoor(tables: [Produtos, Clientes, Configurations])
class MyDatabase extends _$MyDatabase {

  static final MyDatabase instance = MyDatabase._internal();

  MyDatabase._internal() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  // construtores p/retornar dados
  Future getAllProdutos(){
    return select(produtos).get();
  }

  // construtores p/retornar dados - estatico
  //Future getAllClientes(){
  //  return select(clientes).get();
  //}
 // construtores p/retornar dados - reativo
  Stream getAllClientes(){
    return select(clientes).watch();
  }
 
  // inclusao de registro
  Future addCliente(Cliente cliente){
    return into(clientes).insert(cliente);
  }

  Future updateCliente(Cliente cliente) {
    return update(clientes).replace(cliente);
  }

  // exclusao de dados
  Future deleteCliente(id) {
    // METODO 1
    // return (delete(clientes)..where((cliente) => cliente._id.equals(id))).go();
    // METODO 2
    var query = delete(clientes);
    query.where((cliente) => cliente._id.equals(id));
    return query.go();
  }




  // 

  @override
  int get schemaVersion => 1; 
}