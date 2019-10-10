import 'package:moor_flutter/moor_flutter.dart';
import 'package:prodesys_mobi/src/db/dao/ClienteDAO.dart';

import 'dao/ConfigurationDAO.dart';
import 'dao/ProdutoDAO.dart';
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
  ProdutoDAO produtoDAO;
  ClienteDAO clienteDAO;
  ConfigurationDAO configurationDAO;

  MyDatabase._internal() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite')){
   // instancia o clienteDAO vinculando ele ao MyDatabase, representado aqui pelo 'instante'
   clienteDAO = ClienteDAO(this);
   produtoDAO = ProdutoDAO(this);
   configurationDAO = ConfigurationDAO(this);
  }






  @override
  int get schemaVersion => 1; 
}