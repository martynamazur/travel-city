import 'package:drift/drift.dart';

class Tickets extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get boughtCount => integer().withDefault(const Constant(0))();
}