import 'package:drift/drift.dart';
// import 'package:retro/database/models/core_model.dart';

class Game extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get path => text()();

  TextColumn get img => text().nullable()();

  TextColumn get bg => text().nullable()();

  IntColumn get core => integer().nullable().references(RetroCore, #id)();
}

class RetroCore extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get displayName => text()();

  TextColumn get license => text()();

  TextColumn get path => text()();

  TextColumn get extensions => text()();

  TextColumn get metadata => text()();
}
