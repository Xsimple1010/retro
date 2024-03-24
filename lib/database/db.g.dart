// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $GameTable extends Game with TableInfo<$GameTable, GameData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imgMeta = const VerificationMeta('img');
  @override
  late final GeneratedColumn<String> img = GeneratedColumn<String>(
      'img', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bgMeta = const VerificationMeta('bg');
  @override
  late final GeneratedColumn<String> bg = GeneratedColumn<String>(
      'bg', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, path, img, bg];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game';
  @override
  VerificationContext validateIntegrity(Insertable<GameData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('img')) {
      context.handle(
          _imgMeta, img.isAcceptableOrUnknown(data['img']!, _imgMeta));
    }
    if (data.containsKey('bg')) {
      context.handle(_bgMeta, bg.isAcceptableOrUnknown(data['bg']!, _bgMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      img: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}img']),
      bg: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bg']),
    );
  }

  @override
  $GameTable createAlias(String alias) {
    return $GameTable(attachedDatabase, alias);
  }
}

class GameData extends DataClass implements Insertable<GameData> {
  final int id;
  final String name;
  final String path;
  final String? img;
  final String? bg;
  const GameData(
      {required this.id,
      required this.name,
      required this.path,
      this.img,
      this.bg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || img != null) {
      map['img'] = Variable<String>(img);
    }
    if (!nullToAbsent || bg != null) {
      map['bg'] = Variable<String>(bg);
    }
    return map;
  }

  GameCompanion toCompanion(bool nullToAbsent) {
    return GameCompanion(
      id: Value(id),
      name: Value(name),
      path: Value(path),
      img: img == null && nullToAbsent ? const Value.absent() : Value(img),
      bg: bg == null && nullToAbsent ? const Value.absent() : Value(bg),
    );
  }

  factory GameData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      path: serializer.fromJson<String>(json['path']),
      img: serializer.fromJson<String?>(json['img']),
      bg: serializer.fromJson<String?>(json['bg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'path': serializer.toJson<String>(path),
      'img': serializer.toJson<String?>(img),
      'bg': serializer.toJson<String?>(bg),
    };
  }

  GameData copyWith(
          {int? id,
          String? name,
          String? path,
          Value<String?> img = const Value.absent(),
          Value<String?> bg = const Value.absent()}) =>
      GameData(
        id: id ?? this.id,
        name: name ?? this.name,
        path: path ?? this.path,
        img: img.present ? img.value : this.img,
        bg: bg.present ? bg.value : this.bg,
      );
  @override
  String toString() {
    return (StringBuffer('GameData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('img: $img, ')
          ..write('bg: $bg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, path, img, bg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameData &&
          other.id == this.id &&
          other.name == this.name &&
          other.path == this.path &&
          other.img == this.img &&
          other.bg == this.bg);
}

class GameCompanion extends UpdateCompanion<GameData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> path;
  final Value<String?> img;
  final Value<String?> bg;
  const GameCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.path = const Value.absent(),
    this.img = const Value.absent(),
    this.bg = const Value.absent(),
  });
  GameCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String path,
    this.img = const Value.absent(),
    this.bg = const Value.absent(),
  })  : name = Value(name),
        path = Value(path);
  static Insertable<GameData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? path,
    Expression<String>? img,
    Expression<String>? bg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (img != null) 'img': img,
      if (bg != null) 'bg': bg,
    });
  }

  GameCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? path,
      Value<String?>? img,
      Value<String?>? bg}) {
    return GameCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      img: img ?? this.img,
      bg: bg ?? this.bg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (img.present) {
      map['img'] = Variable<String>(img.value);
    }
    if (bg.present) {
      map['bg'] = Variable<String>(bg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('img: $img, ')
          ..write('bg: $bg')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $GameTable game = $GameTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [game];
}
