import 'package:drift/drift.dart';

class Listings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get imagePath => text()();
  RealColumn get price => real()();
  TextColumn get location => text()();
  TextColumn get category => text()();
  TextColumn get contact => text()();
  BoolColumn get delivery => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
