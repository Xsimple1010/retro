// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $RetroCoreTable extends RetroCore
    with TableInfo<$RetroCoreTable, RetroCoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $RetroCoreTable(this.attachedDatabase, [this._alias]);

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
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _licenseMeta =
      const VerificationMeta('license');
  @override
  late final GeneratedColumn<String> license = GeneratedColumn<String>(
      'license', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _extensionsMeta =
      const VerificationMeta('extensions');
  @override
  late final GeneratedColumn<String> extensions = GeneratedColumn<String>(
      'extensions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
      'metadata', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, displayName, license, path, extensions, metadata];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'retro_core';

  @override
  VerificationContext validateIntegrity(Insertable<RetroCoreData> instance,
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
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('license')) {
      context.handle(_licenseMeta,
          license.isAcceptableOrUnknown(data['license']!, _licenseMeta));
    } else if (isInserting) {
      context.missing(_licenseMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('extensions')) {
      context.handle(
          _extensionsMeta,
          extensions.isAcceptableOrUnknown(
              data['extensions']!, _extensionsMeta));
    } else if (isInserting) {
      context.missing(_extensionsMeta);
    }
    if (data.containsKey('metadata')) {
      context.handle(_metadataMeta,
          metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta));
    } else if (isInserting) {
      context.missing(_metadataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  RetroCoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RetroCoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      license: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}license'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      extensions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extensions'])!,
      metadata: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata'])!,
    );
  }

  @override
  $RetroCoreTable createAlias(String alias) {
    return $RetroCoreTable(attachedDatabase, alias);
  }
}

class RetroCoreData extends DataClass implements Insertable<RetroCoreData> {
  final int id;
  final String name;
  final String displayName;
  final String license;
  final String path;
  final String extensions;
  final String metadata;

  const RetroCoreData(
      {required this.id,
      required this.name,
      required this.displayName,
      required this.license,
      required this.path,
      required this.extensions,
      required this.metadata});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['display_name'] = Variable<String>(displayName);
    map['license'] = Variable<String>(license);
    map['path'] = Variable<String>(path);
    map['extensions'] = Variable<String>(extensions);
    map['metadata'] = Variable<String>(metadata);
    return map;
  }

  RetroCoreCompanion toCompanion(bool nullToAbsent) {
    return RetroCoreCompanion(
      id: Value(id),
      name: Value(name),
      displayName: Value(displayName),
      license: Value(license),
      path: Value(path),
      extensions: Value(extensions),
      metadata: Value(metadata),
    );
  }

  factory RetroCoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RetroCoreData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      displayName: serializer.fromJson<String>(json['displayName']),
      license: serializer.fromJson<String>(json['license']),
      path: serializer.fromJson<String>(json['path']),
      extensions: serializer.fromJson<String>(json['extensions']),
      metadata: serializer.fromJson<String>(json['metadata']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'displayName': serializer.toJson<String>(displayName),
      'license': serializer.toJson<String>(license),
      'path': serializer.toJson<String>(path),
      'extensions': serializer.toJson<String>(extensions),
      'metadata': serializer.toJson<String>(metadata),
    };
  }

  RetroCoreData copyWith(
          {int? id,
          String? name,
          String? displayName,
          String? license,
          String? path,
          String? extensions,
          String? metadata}) =>
      RetroCoreData(
        id: id ?? this.id,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        license: license ?? this.license,
        path: path ?? this.path,
        extensions: extensions ?? this.extensions,
        metadata: metadata ?? this.metadata,
      );

  @override
  String toString() {
    return (StringBuffer('RetroCoreData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('license: $license, ')
          ..write('path: $path, ')
          ..write('extensions: $extensions, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, displayName, license, path, extensions, metadata);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RetroCoreData &&
          other.id == this.id &&
          other.name == this.name &&
          other.displayName == this.displayName &&
          other.license == this.license &&
          other.path == this.path &&
          other.extensions == this.extensions &&
          other.metadata == this.metadata);
}

class RetroCoreCompanion extends UpdateCompanion<RetroCoreData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> displayName;
  final Value<String> license;
  final Value<String> path;
  final Value<String> extensions;
  final Value<String> metadata;

  const RetroCoreCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.displayName = const Value.absent(),
    this.license = const Value.absent(),
    this.path = const Value.absent(),
    this.extensions = const Value.absent(),
    this.metadata = const Value.absent(),
  });

  RetroCoreCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String displayName,
    required String license,
    required String path,
    required String extensions,
    required String metadata,
  })  : name = Value(name),
        displayName = Value(displayName),
        license = Value(license),
        path = Value(path),
        extensions = Value(extensions),
        metadata = Value(metadata);

  static Insertable<RetroCoreData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? displayName,
    Expression<String>? license,
    Expression<String>? path,
    Expression<String>? extensions,
    Expression<String>? metadata,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (displayName != null) 'display_name': displayName,
      if (license != null) 'license': license,
      if (path != null) 'path': path,
      if (extensions != null) 'extensions': extensions,
      if (metadata != null) 'metadata': metadata,
    });
  }

  RetroCoreCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? displayName,
      Value<String>? license,
      Value<String>? path,
      Value<String>? extensions,
      Value<String>? metadata}) {
    return RetroCoreCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      license: license ?? this.license,
      path: path ?? this.path,
      extensions: extensions ?? this.extensions,
      metadata: metadata ?? this.metadata,
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
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (license.present) {
      map['license'] = Variable<String>(license.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (extensions.present) {
      map['extensions'] = Variable<String>(extensions.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RetroCoreCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('license: $license, ')
          ..write('path: $path, ')
          ..write('extensions: $extensions, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _coreMeta = const VerificationMeta('core');
  @override
  late final GeneratedColumn<int> core = GeneratedColumn<int>(
      'core', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES retro_core (id)'));

  @override
  List<GeneratedColumn> get $columns => [id, name, path, img, bg, core];

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
    if (data.containsKey('core')) {
      context.handle(
          _coreMeta, core.isAcceptableOrUnknown(data['core']!, _coreMeta));
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
      core: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}core']),
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
  final int? core;

  const GameData(
      {required this.id,
      required this.name,
      required this.path,
      this.img,
      this.bg,
      this.core});

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
    if (!nullToAbsent || core != null) {
      map['core'] = Variable<int>(core);
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
      core: core == null && nullToAbsent ? const Value.absent() : Value(core),
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
      core: serializer.fromJson<int?>(json['core']),
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
      'core': serializer.toJson<int?>(core),
    };
  }

  GameData copyWith(
          {int? id,
          String? name,
          String? path,
          Value<String?> img = const Value.absent(),
          Value<String?> bg = const Value.absent(),
          Value<int?> core = const Value.absent()}) =>
      GameData(
        id: id ?? this.id,
        name: name ?? this.name,
        path: path ?? this.path,
        img: img.present ? img.value : this.img,
        bg: bg.present ? bg.value : this.bg,
        core: core.present ? core.value : this.core,
      );

  @override
  String toString() {
    return (StringBuffer('GameData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('img: $img, ')
          ..write('bg: $bg, ')
          ..write('core: $core')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, path, img, bg, core);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameData &&
          other.id == this.id &&
          other.name == this.name &&
          other.path == this.path &&
          other.img == this.img &&
          other.bg == this.bg &&
          other.core == this.core);
}

class GameCompanion extends UpdateCompanion<GameData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> path;
  final Value<String?> img;
  final Value<String?> bg;
  final Value<int?> core;

  const GameCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.path = const Value.absent(),
    this.img = const Value.absent(),
    this.bg = const Value.absent(),
    this.core = const Value.absent(),
  });

  GameCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String path,
    this.img = const Value.absent(),
    this.bg = const Value.absent(),
    this.core = const Value.absent(),
  })  : name = Value(name),
        path = Value(path);

  static Insertable<GameData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? path,
    Expression<String>? img,
    Expression<String>? bg,
    Expression<int>? core,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (img != null) 'img': img,
      if (bg != null) 'bg': bg,
      if (core != null) 'core': core,
    });
  }

  GameCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? path,
      Value<String?>? img,
      Value<String?>? bg,
      Value<int?>? core}) {
    return GameCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      img: img ?? this.img,
      bg: bg ?? this.bg,
      core: core ?? this.core,
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
    if (core.present) {
      map['core'] = Variable<int>(core.value);
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
          ..write('bg: $bg, ')
          ..write('core: $core')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RetroCoreTable retroCore = $RetroCoreTable(this);
  late final $GameTable game = $GameTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [retroCore, game];
}
