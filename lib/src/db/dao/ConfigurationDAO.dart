import 'package:moor_flutter/moor_flutter.dart';
import '../my_database.dart';

part 'ConfigurationDAO.g.dart';

@UseDao(tables:[Configurations])
class ConfigurationDAO extends DatabaseAccessor<MyDatabase> with _$ConfigurationDAOMixin{
  ConfigurationDAO(MyDatabase db) : super(db);
}