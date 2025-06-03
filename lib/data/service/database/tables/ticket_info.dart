import 'package:drift/drift.dart';

class TicketInfo extends Table {
  IntColumn get id => integer()();
  IntColumn get cityId => integer().named('city_id')();
  IntColumn get vehicleTypeId => integer().named('vehicle_type_id')();
  IntColumn get variantId => integer().named('variant_id')();
  TextColumn get name => text()();
  IntColumn get minutes => integer()();
  RealColumn get price => real()();

  @override
  Set<Column> get primaryKey => {id};
}
