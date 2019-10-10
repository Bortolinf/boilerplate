import 'package:moor_flutter/moor_flutter.dart';
import '../my_database.dart';

part 'ClienteDAO.g.dart';

@UseDao(tables:[Clientes])
class ClienteDAO extends DatabaseAccessor<MyDatabase> with _$ClienteDAOMixin{

 Stream<List<Cliente>> listAll(){
   return (select(clientes)).watch();
 }

 Future addCliente(Cliente entity) {
   return into(clientes).insert(entity);
 }

 Future removeCliente(id) {
  // return (delete(clientes)..where((cli) => cli.id.equals(id)) ).go();
    var query = delete(clientes);
    query.where((cliente) => cliente.id.equals(id));
    return query.go();
  }



 Future updateCliente(Cliente entity) {
   return update(clientes).replace(entity);
 }


  ClienteDAO(MyDatabase db) : super(db);
}
