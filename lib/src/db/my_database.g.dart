// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Produto extends DataClass implements Insertable<Produto> {
  final String codigo;
  final String descricao;
  final DateTime datahora;
  Produto(
      {@required this.codigo,
      @required this.descricao,
      @required this.datahora});
  factory Produto.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Produto(
      codigo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}codigo']),
      descricao: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao']),
      datahora: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}datahora']),
    );
  }
  factory Produto.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Produto(
      codigo: serializer.fromJson<String>(json['codigo']),
      descricao: serializer.fromJson<String>(json['descricao']),
      datahora: serializer.fromJson<DateTime>(json['datahora']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'codigo': serializer.toJson<String>(codigo),
      'descricao': serializer.toJson<String>(descricao),
      'datahora': serializer.toJson<DateTime>(datahora),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Produto>>(bool nullToAbsent) {
    return ProdutosCompanion(
      codigo:
          codigo == null && nullToAbsent ? const Value.absent() : Value(codigo),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      datahora: datahora == null && nullToAbsent
          ? const Value.absent()
          : Value(datahora),
    ) as T;
  }

  Produto copyWith({String codigo, String descricao, DateTime datahora}) =>
      Produto(
        codigo: codigo ?? this.codigo,
        descricao: descricao ?? this.descricao,
        datahora: datahora ?? this.datahora,
      );
  @override
  String toString() {
    return (StringBuffer('Produto(')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write('datahora: $datahora')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(codigo.hashCode, $mrjc(descricao.hashCode, datahora.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Produto &&
          other.codigo == this.codigo &&
          other.descricao == this.descricao &&
          other.datahora == this.datahora);
}

class ProdutosCompanion extends UpdateCompanion<Produto> {
  final Value<String> codigo;
  final Value<String> descricao;
  final Value<DateTime> datahora;
  const ProdutosCompanion({
    this.codigo = const Value.absent(),
    this.descricao = const Value.absent(),
    this.datahora = const Value.absent(),
  });
  ProdutosCompanion.insert({
    @required String codigo,
    @required String descricao,
    @required DateTime datahora,
  })  : codigo = Value(codigo),
        descricao = Value(descricao),
        datahora = Value(datahora);
  ProdutosCompanion copyWith(
      {Value<String> codigo,
      Value<String> descricao,
      Value<DateTime> datahora}) {
    return ProdutosCompanion(
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      datahora: datahora ?? this.datahora,
    );
  }
}

class $ProdutosTable extends Produtos with TableInfo<$ProdutosTable, Produto> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProdutosTable(this._db, [this._alias]);
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  GeneratedTextColumn _codigo;
  @override
  GeneratedTextColumn get codigo => _codigo ??= _constructCodigo();
  GeneratedTextColumn _constructCodigo() {
    return GeneratedTextColumn(
      'codigo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  GeneratedTextColumn _descricao;
  @override
  GeneratedTextColumn get descricao => _descricao ??= _constructDescricao();
  GeneratedTextColumn _constructDescricao() {
    return GeneratedTextColumn('descricao', $tableName, false,
        minTextLength: 2, maxTextLength: 40);
  }

  final VerificationMeta _datahoraMeta = const VerificationMeta('datahora');
  GeneratedDateTimeColumn _datahora;
  @override
  GeneratedDateTimeColumn get datahora => _datahora ??= _constructDatahora();
  GeneratedDateTimeColumn _constructDatahora() {
    return GeneratedDateTimeColumn(
      'datahora',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [codigo, descricao, datahora];
  @override
  $ProdutosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'produtos';
  @override
  final String actualTableName = 'produtos';
  @override
  VerificationContext validateIntegrity(ProdutosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.codigo.present) {
      context.handle(
          _codigoMeta, codigo.isAcceptableValue(d.codigo.value, _codigoMeta));
    } else if (codigo.isRequired && isInserting) {
      context.missing(_codigoMeta);
    }
    if (d.descricao.present) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableValue(d.descricao.value, _descricaoMeta));
    } else if (descricao.isRequired && isInserting) {
      context.missing(_descricaoMeta);
    }
    if (d.datahora.present) {
      context.handle(_datahoraMeta,
          datahora.isAcceptableValue(d.datahora.value, _datahoraMeta));
    } else if (datahora.isRequired && isInserting) {
      context.missing(_datahoraMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Produto map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Produto.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ProdutosCompanion d) {
    final map = <String, Variable>{};
    if (d.codigo.present) {
      map['codigo'] = Variable<String, StringType>(d.codigo.value);
    }
    if (d.descricao.present) {
      map['descricao'] = Variable<String, StringType>(d.descricao.value);
    }
    if (d.datahora.present) {
      map['datahora'] = Variable<DateTime, DateTimeType>(d.datahora.value);
    }
    return map;
  }

  @override
  $ProdutosTable createAlias(String alias) {
    return $ProdutosTable(_db, alias);
  }
}

class Cliente extends DataClass implements Insertable<Cliente> {
  final int id;
  final String nome;
  Cliente({@required this.id, @required this.nome});
  factory Cliente.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Cliente(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
    );
  }
  factory Cliente.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Cliente(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Cliente>>(bool nullToAbsent) {
    return ClientesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
    ) as T;
  }

  Cliente copyWith({int id, String nome}) => Cliente(
        id: id ?? this.id,
        nome: nome ?? this.nome,
      );
  @override
  String toString() {
    return (StringBuffer('Cliente(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, nome.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Cliente && other.id == this.id && other.nome == this.nome);
}

class ClientesCompanion extends UpdateCompanion<Cliente> {
  final Value<int> id;
  final Value<String> nome;
  const ClientesCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  ClientesCompanion.insert({
    this.id = const Value.absent(),
    @required String nome,
  }) : nome = Value(nome);
  ClientesCompanion copyWith({Value<int> id, Value<String> nome}) {
    return ClientesCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }
}

class $ClientesTable extends Clientes with TableInfo<$ClientesTable, Cliente> {
  final GeneratedDatabase _db;
  final String _alias;
  $ClientesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn('nome', $tableName, false,
        minTextLength: 2, maxTextLength: 40);
  }

  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  $ClientesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'clientes';
  @override
  final String actualTableName = 'clientes';
  @override
  VerificationContext validateIntegrity(ClientesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.nome.present) {
      context.handle(
          _nomeMeta, nome.isAcceptableValue(d.nome.value, _nomeMeta));
    } else if (nome.isRequired && isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cliente map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Cliente.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ClientesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.nome.present) {
      map['nome'] = Variable<String, StringType>(d.nome.value);
    }
    return map;
  }

  @override
  $ClientesTable createAlias(String alias) {
    return $ClientesTable(_db, alias);
  }
}

class Configuration extends DataClass implements Insertable<Configuration> {
  final String email;
  final DateTime lastSincro;
  final bool lastSincroStt;
  Configuration(
      {@required this.email,
      @required this.lastSincro,
      @required this.lastSincroStt});
  factory Configuration.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Configuration(
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      lastSincro: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_sincro']),
      lastSincroStt: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_sincro_stt']),
    );
  }
  factory Configuration.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Configuration(
      email: serializer.fromJson<String>(json['email']),
      lastSincro: serializer.fromJson<DateTime>(json['lastSincro']),
      lastSincroStt: serializer.fromJson<bool>(json['lastSincroStt']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'email': serializer.toJson<String>(email),
      'lastSincro': serializer.toJson<DateTime>(lastSincro),
      'lastSincroStt': serializer.toJson<bool>(lastSincroStt),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Configuration>>(
      bool nullToAbsent) {
    return ConfigurationsCompanion(
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      lastSincro: lastSincro == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSincro),
      lastSincroStt: lastSincroStt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSincroStt),
    ) as T;
  }

  Configuration copyWith(
          {String email, DateTime lastSincro, bool lastSincroStt}) =>
      Configuration(
        email: email ?? this.email,
        lastSincro: lastSincro ?? this.lastSincro,
        lastSincroStt: lastSincroStt ?? this.lastSincroStt,
      );
  @override
  String toString() {
    return (StringBuffer('Configuration(')
          ..write('email: $email, ')
          ..write('lastSincro: $lastSincro, ')
          ..write('lastSincroStt: $lastSincroStt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      email.hashCode, $mrjc(lastSincro.hashCode, lastSincroStt.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Configuration &&
          other.email == this.email &&
          other.lastSincro == this.lastSincro &&
          other.lastSincroStt == this.lastSincroStt);
}

class ConfigurationsCompanion extends UpdateCompanion<Configuration> {
  final Value<String> email;
  final Value<DateTime> lastSincro;
  final Value<bool> lastSincroStt;
  const ConfigurationsCompanion({
    this.email = const Value.absent(),
    this.lastSincro = const Value.absent(),
    this.lastSincroStt = const Value.absent(),
  });
  ConfigurationsCompanion.insert({
    @required String email,
    @required DateTime lastSincro,
    @required bool lastSincroStt,
  })  : email = Value(email),
        lastSincro = Value(lastSincro),
        lastSincroStt = Value(lastSincroStt);
  ConfigurationsCompanion copyWith(
      {Value<String> email,
      Value<DateTime> lastSincro,
      Value<bool> lastSincroStt}) {
    return ConfigurationsCompanion(
      email: email ?? this.email,
      lastSincro: lastSincro ?? this.lastSincro,
      lastSincroStt: lastSincroStt ?? this.lastSincroStt,
    );
  }
}

class $ConfigurationsTable extends Configurations
    with TableInfo<$ConfigurationsTable, Configuration> {
  final GeneratedDatabase _db;
  final String _alias;
  $ConfigurationsTable(this._db, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastSincroMeta = const VerificationMeta('lastSincro');
  GeneratedDateTimeColumn _lastSincro;
  @override
  GeneratedDateTimeColumn get lastSincro =>
      _lastSincro ??= _constructLastSincro();
  GeneratedDateTimeColumn _constructLastSincro() {
    return GeneratedDateTimeColumn(
      'last_sincro',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastSincroSttMeta =
      const VerificationMeta('lastSincroStt');
  GeneratedBoolColumn _lastSincroStt;
  @override
  GeneratedBoolColumn get lastSincroStt =>
      _lastSincroStt ??= _constructLastSincroStt();
  GeneratedBoolColumn _constructLastSincroStt() {
    return GeneratedBoolColumn(
      'last_sincro_stt',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [email, lastSincro, lastSincroStt];
  @override
  $ConfigurationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'configurations';
  @override
  final String actualTableName = 'configurations';
  @override
  VerificationContext validateIntegrity(ConfigurationsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.lastSincro.present) {
      context.handle(_lastSincroMeta,
          lastSincro.isAcceptableValue(d.lastSincro.value, _lastSincroMeta));
    } else if (lastSincro.isRequired && isInserting) {
      context.missing(_lastSincroMeta);
    }
    if (d.lastSincroStt.present) {
      context.handle(
          _lastSincroSttMeta,
          lastSincroStt.isAcceptableValue(
              d.lastSincroStt.value, _lastSincroSttMeta));
    } else if (lastSincroStt.isRequired && isInserting) {
      context.missing(_lastSincroSttMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Configuration map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Configuration.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ConfigurationsCompanion d) {
    final map = <String, Variable>{};
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.lastSincro.present) {
      map['last_sincro'] = Variable<DateTime, DateTimeType>(d.lastSincro.value);
    }
    if (d.lastSincroStt.present) {
      map['last_sincro_stt'] = Variable<bool, BoolType>(d.lastSincroStt.value);
    }
    return map;
  }

  @override
  $ConfigurationsTable createAlias(String alias) {
    return $ConfigurationsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $ProdutosTable _produtos;
  $ProdutosTable get produtos => _produtos ??= $ProdutosTable(this);
  $ClientesTable _clientes;
  $ClientesTable get clientes => _clientes ??= $ClientesTable(this);
  $ConfigurationsTable _configurations;
  $ConfigurationsTable get configurations =>
      _configurations ??= $ConfigurationsTable(this);
  @override
  List<TableInfo> get allTables => [produtos, clientes, configurations];
}
