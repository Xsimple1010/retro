import 'package:drift/drift.dart';

class Game extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get path => text()();
  TextColumn get img => text().nullable()();
  TextColumn get bg => text().nullable()();
}
