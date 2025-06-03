// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TicketsTable extends Tickets with TableInfo<$TicketsTable, Ticket> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TicketsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _boughtCountMeta = const VerificationMeta(
    'boughtCount',
  );
  @override
  late final GeneratedColumn<int> boughtCount = GeneratedColumn<int>(
    'bought_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, boughtCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tickets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ticket> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bought_count')) {
      context.handle(
        _boughtCountMeta,
        boughtCount.isAcceptableOrUnknown(
          data['bought_count']!,
          _boughtCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ticket map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ticket(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      boughtCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}bought_count'],
          )!,
    );
  }

  @override
  $TicketsTable createAlias(String alias) {
    return $TicketsTable(attachedDatabase, alias);
  }
}

class Ticket extends DataClass implements Insertable<Ticket> {
  final int id;
  final int boughtCount;
  const Ticket({required this.id, required this.boughtCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bought_count'] = Variable<int>(boughtCount);
    return map;
  }

  TicketsCompanion toCompanion(bool nullToAbsent) {
    return TicketsCompanion(id: Value(id), boughtCount: Value(boughtCount));
  }

  factory Ticket.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ticket(
      id: serializer.fromJson<int>(json['id']),
      boughtCount: serializer.fromJson<int>(json['boughtCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'boughtCount': serializer.toJson<int>(boughtCount),
    };
  }

  Ticket copyWith({int? id, int? boughtCount}) =>
      Ticket(id: id ?? this.id, boughtCount: boughtCount ?? this.boughtCount);
  Ticket copyWithCompanion(TicketsCompanion data) {
    return Ticket(
      id: data.id.present ? data.id.value : this.id,
      boughtCount:
          data.boughtCount.present ? data.boughtCount.value : this.boughtCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ticket(')
          ..write('id: $id, ')
          ..write('boughtCount: $boughtCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, boughtCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ticket &&
          other.id == this.id &&
          other.boughtCount == this.boughtCount);
}

class TicketsCompanion extends UpdateCompanion<Ticket> {
  final Value<int> id;
  final Value<int> boughtCount;
  const TicketsCompanion({
    this.id = const Value.absent(),
    this.boughtCount = const Value.absent(),
  });
  TicketsCompanion.insert({
    this.id = const Value.absent(),
    this.boughtCount = const Value.absent(),
  });
  static Insertable<Ticket> custom({
    Expression<int>? id,
    Expression<int>? boughtCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (boughtCount != null) 'bought_count': boughtCount,
    });
  }

  TicketsCompanion copyWith({Value<int>? id, Value<int>? boughtCount}) {
    return TicketsCompanion(
      id: id ?? this.id,
      boughtCount: boughtCount ?? this.boughtCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (boughtCount.present) {
      map['bought_count'] = Variable<int>(boughtCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketsCompanion(')
          ..write('id: $id, ')
          ..write('boughtCount: $boughtCount')
          ..write(')'))
        .toString();
  }
}

class $TicketInfoTable extends TicketInfo
    with TableInfo<$TicketInfoTable, TicketInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TicketInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<int> cityId = GeneratedColumn<int>(
    'city_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleTypeIdMeta = const VerificationMeta(
    'vehicleTypeId',
  );
  @override
  late final GeneratedColumn<int> vehicleTypeId = GeneratedColumn<int>(
    'vehicle_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<int> variantId = GeneratedColumn<int>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesMeta = const VerificationMeta(
    'minutes',
  );
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
    'minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cityId,
    vehicleTypeId,
    variantId,
    name,
    minutes,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ticket_info';
  @override
  VerificationContext validateIntegrity(
    Insertable<TicketInfoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('vehicle_type_id')) {
      context.handle(
        _vehicleTypeIdMeta,
        vehicleTypeId.isAcceptableOrUnknown(
          data['vehicle_type_id']!,
          _vehicleTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleTypeIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('minutes')) {
      context.handle(
        _minutesMeta,
        minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta),
      );
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TicketInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TicketInfoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      cityId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}city_id'],
          )!,
      vehicleTypeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}vehicle_type_id'],
          )!,
      variantId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}variant_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      minutes:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}minutes'],
          )!,
      price:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}price'],
          )!,
    );
  }

  @override
  $TicketInfoTable createAlias(String alias) {
    return $TicketInfoTable(attachedDatabase, alias);
  }
}

class TicketInfoData extends DataClass implements Insertable<TicketInfoData> {
  final int id;
  final int cityId;
  final int vehicleTypeId;
  final int variantId;
  final String name;
  final int minutes;
  final double price;
  const TicketInfoData({
    required this.id,
    required this.cityId,
    required this.vehicleTypeId,
    required this.variantId,
    required this.name,
    required this.minutes,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['city_id'] = Variable<int>(cityId);
    map['vehicle_type_id'] = Variable<int>(vehicleTypeId);
    map['variant_id'] = Variable<int>(variantId);
    map['name'] = Variable<String>(name);
    map['minutes'] = Variable<int>(minutes);
    map['price'] = Variable<double>(price);
    return map;
  }

  TicketInfoCompanion toCompanion(bool nullToAbsent) {
    return TicketInfoCompanion(
      id: Value(id),
      cityId: Value(cityId),
      vehicleTypeId: Value(vehicleTypeId),
      variantId: Value(variantId),
      name: Value(name),
      minutes: Value(minutes),
      price: Value(price),
    );
  }

  factory TicketInfoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TicketInfoData(
      id: serializer.fromJson<int>(json['id']),
      cityId: serializer.fromJson<int>(json['cityId']),
      vehicleTypeId: serializer.fromJson<int>(json['vehicleTypeId']),
      variantId: serializer.fromJson<int>(json['variantId']),
      name: serializer.fromJson<String>(json['name']),
      minutes: serializer.fromJson<int>(json['minutes']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cityId': serializer.toJson<int>(cityId),
      'vehicleTypeId': serializer.toJson<int>(vehicleTypeId),
      'variantId': serializer.toJson<int>(variantId),
      'name': serializer.toJson<String>(name),
      'minutes': serializer.toJson<int>(minutes),
      'price': serializer.toJson<double>(price),
    };
  }

  TicketInfoData copyWith({
    int? id,
    int? cityId,
    int? vehicleTypeId,
    int? variantId,
    String? name,
    int? minutes,
    double? price,
  }) => TicketInfoData(
    id: id ?? this.id,
    cityId: cityId ?? this.cityId,
    vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
    variantId: variantId ?? this.variantId,
    name: name ?? this.name,
    minutes: minutes ?? this.minutes,
    price: price ?? this.price,
  );
  TicketInfoData copyWithCompanion(TicketInfoCompanion data) {
    return TicketInfoData(
      id: data.id.present ? data.id.value : this.id,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      vehicleTypeId:
          data.vehicleTypeId.present
              ? data.vehicleTypeId.value
              : this.vehicleTypeId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      name: data.name.present ? data.name.value : this.name,
      minutes: data.minutes.present ? data.minutes.value : this.minutes,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TicketInfoData(')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('variantId: $variantId, ')
          ..write('name: $name, ')
          ..write('minutes: $minutes, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, cityId, vehicleTypeId, variantId, name, minutes, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TicketInfoData &&
          other.id == this.id &&
          other.cityId == this.cityId &&
          other.vehicleTypeId == this.vehicleTypeId &&
          other.variantId == this.variantId &&
          other.name == this.name &&
          other.minutes == this.minutes &&
          other.price == this.price);
}

class TicketInfoCompanion extends UpdateCompanion<TicketInfoData> {
  final Value<int> id;
  final Value<int> cityId;
  final Value<int> vehicleTypeId;
  final Value<int> variantId;
  final Value<String> name;
  final Value<int> minutes;
  final Value<double> price;
  const TicketInfoCompanion({
    this.id = const Value.absent(),
    this.cityId = const Value.absent(),
    this.vehicleTypeId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.name = const Value.absent(),
    this.minutes = const Value.absent(),
    this.price = const Value.absent(),
  });
  TicketInfoCompanion.insert({
    this.id = const Value.absent(),
    required int cityId,
    required int vehicleTypeId,
    required int variantId,
    required String name,
    required int minutes,
    required double price,
  }) : cityId = Value(cityId),
       vehicleTypeId = Value(vehicleTypeId),
       variantId = Value(variantId),
       name = Value(name),
       minutes = Value(minutes),
       price = Value(price);
  static Insertable<TicketInfoData> custom({
    Expression<int>? id,
    Expression<int>? cityId,
    Expression<int>? vehicleTypeId,
    Expression<int>? variantId,
    Expression<String>? name,
    Expression<int>? minutes,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cityId != null) 'city_id': cityId,
      if (vehicleTypeId != null) 'vehicle_type_id': vehicleTypeId,
      if (variantId != null) 'variant_id': variantId,
      if (name != null) 'name': name,
      if (minutes != null) 'minutes': minutes,
      if (price != null) 'price': price,
    });
  }

  TicketInfoCompanion copyWith({
    Value<int>? id,
    Value<int>? cityId,
    Value<int>? vehicleTypeId,
    Value<int>? variantId,
    Value<String>? name,
    Value<int>? minutes,
    Value<double>? price,
  }) {
    return TicketInfoCompanion(
      id: id ?? this.id,
      cityId: cityId ?? this.cityId,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      variantId: variantId ?? this.variantId,
      name: name ?? this.name,
      minutes: minutes ?? this.minutes,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<int>(cityId.value);
    }
    if (vehicleTypeId.present) {
      map['vehicle_type_id'] = Variable<int>(vehicleTypeId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<int>(variantId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketInfoCompanion(')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('vehicleTypeId: $vehicleTypeId, ')
          ..write('variantId: $variantId, ')
          ..write('name: $name, ')
          ..write('minutes: $minutes, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ActivatedTicketsTable extends ActivatedTickets
    with TableInfo<$ActivatedTicketsTable, ActivatedTicket> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivatedTicketsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _ticketIdMeta = const VerificationMeta(
    'ticketId',
  );
  @override
  late final GeneratedColumn<int> ticketId = GeneratedColumn<int>(
    'ticket_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ticket_info (id)',
    ),
  );
  static const VerificationMeta _vehicleNumberMeta = const VerificationMeta(
    'vehicleNumber',
  );
  @override
  late final GeneratedColumn<String> vehicleNumber = GeneratedColumn<String>(
    'vehicle_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activatedAtMeta = const VerificationMeta(
    'activatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> activatedAt = GeneratedColumn<DateTime>(
    'activated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalPriceMeta = const VerificationMeta(
    'totalPrice',
  );
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
    'total_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ticketId,
    vehicleNumber,
    activatedAt,
    expiresAt,
    transactionId,
    amount,
    totalPrice,
    token,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activated_tickets';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivatedTicket> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ticket_id')) {
      context.handle(
        _ticketIdMeta,
        ticketId.isAcceptableOrUnknown(data['ticket_id']!, _ticketIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ticketIdMeta);
    }
    if (data.containsKey('vehicle_number')) {
      context.handle(
        _vehicleNumberMeta,
        vehicleNumber.isAcceptableOrUnknown(
          data['vehicle_number']!,
          _vehicleNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleNumberMeta);
    }
    if (data.containsKey('activated_at')) {
      context.handle(
        _activatedAtMeta,
        activatedAt.isAcceptableOrUnknown(
          data['activated_at']!,
          _activatedAtMeta,
        ),
      );
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
        _totalPriceMeta,
        totalPrice.isAcceptableOrUnknown(data['total_price']!, _totalPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivatedTicket map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivatedTicket(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      ticketId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ticket_id'],
          )!,
      vehicleNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}vehicle_number'],
          )!,
      activatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}activated_at'],
      ),
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      transactionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}transaction_id'],
          )!,
      amount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}amount'],
          )!,
      totalPrice:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}total_price'],
          )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      ),
    );
  }

  @override
  $ActivatedTicketsTable createAlias(String alias) {
    return $ActivatedTicketsTable(attachedDatabase, alias);
  }
}

class ActivatedTicket extends DataClass implements Insertable<ActivatedTicket> {
  final int id;
  final int ticketId;
  final String vehicleNumber;
  final DateTime? activatedAt;
  final DateTime? expiresAt;
  final String transactionId;
  final int amount;
  final double totalPrice;
  final String? token;
  const ActivatedTicket({
    required this.id,
    required this.ticketId,
    required this.vehicleNumber,
    this.activatedAt,
    this.expiresAt,
    required this.transactionId,
    required this.amount,
    required this.totalPrice,
    this.token,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ticket_id'] = Variable<int>(ticketId);
    map['vehicle_number'] = Variable<String>(vehicleNumber);
    if (!nullToAbsent || activatedAt != null) {
      map['activated_at'] = Variable<DateTime>(activatedAt);
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['transaction_id'] = Variable<String>(transactionId);
    map['amount'] = Variable<int>(amount);
    map['total_price'] = Variable<double>(totalPrice);
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    return map;
  }

  ActivatedTicketsCompanion toCompanion(bool nullToAbsent) {
    return ActivatedTicketsCompanion(
      id: Value(id),
      ticketId: Value(ticketId),
      vehicleNumber: Value(vehicleNumber),
      activatedAt:
          activatedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(activatedAt),
      expiresAt:
          expiresAt == null && nullToAbsent
              ? const Value.absent()
              : Value(expiresAt),
      transactionId: Value(transactionId),
      amount: Value(amount),
      totalPrice: Value(totalPrice),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
    );
  }

  factory ActivatedTicket.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivatedTicket(
      id: serializer.fromJson<int>(json['id']),
      ticketId: serializer.fromJson<int>(json['ticketId']),
      vehicleNumber: serializer.fromJson<String>(json['vehicleNumber']),
      activatedAt: serializer.fromJson<DateTime?>(json['activatedAt']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      amount: serializer.fromJson<int>(json['amount']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      token: serializer.fromJson<String?>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ticketId': serializer.toJson<int>(ticketId),
      'vehicleNumber': serializer.toJson<String>(vehicleNumber),
      'activatedAt': serializer.toJson<DateTime?>(activatedAt),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'transactionId': serializer.toJson<String>(transactionId),
      'amount': serializer.toJson<int>(amount),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'token': serializer.toJson<String?>(token),
    };
  }

  ActivatedTicket copyWith({
    int? id,
    int? ticketId,
    String? vehicleNumber,
    Value<DateTime?> activatedAt = const Value.absent(),
    Value<DateTime?> expiresAt = const Value.absent(),
    String? transactionId,
    int? amount,
    double? totalPrice,
    Value<String?> token = const Value.absent(),
  }) => ActivatedTicket(
    id: id ?? this.id,
    ticketId: ticketId ?? this.ticketId,
    vehicleNumber: vehicleNumber ?? this.vehicleNumber,
    activatedAt: activatedAt.present ? activatedAt.value : this.activatedAt,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    transactionId: transactionId ?? this.transactionId,
    amount: amount ?? this.amount,
    totalPrice: totalPrice ?? this.totalPrice,
    token: token.present ? token.value : this.token,
  );
  ActivatedTicket copyWithCompanion(ActivatedTicketsCompanion data) {
    return ActivatedTicket(
      id: data.id.present ? data.id.value : this.id,
      ticketId: data.ticketId.present ? data.ticketId.value : this.ticketId,
      vehicleNumber:
          data.vehicleNumber.present
              ? data.vehicleNumber.value
              : this.vehicleNumber,
      activatedAt:
          data.activatedAt.present ? data.activatedAt.value : this.activatedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      transactionId:
          data.transactionId.present
              ? data.transactionId.value
              : this.transactionId,
      amount: data.amount.present ? data.amount.value : this.amount,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      token: data.token.present ? data.token.value : this.token,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivatedTicket(')
          ..write('id: $id, ')
          ..write('ticketId: $ticketId, ')
          ..write('vehicleNumber: $vehicleNumber, ')
          ..write('activatedAt: $activatedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('transactionId: $transactionId, ')
          ..write('amount: $amount, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ticketId,
    vehicleNumber,
    activatedAt,
    expiresAt,
    transactionId,
    amount,
    totalPrice,
    token,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivatedTicket &&
          other.id == this.id &&
          other.ticketId == this.ticketId &&
          other.vehicleNumber == this.vehicleNumber &&
          other.activatedAt == this.activatedAt &&
          other.expiresAt == this.expiresAt &&
          other.transactionId == this.transactionId &&
          other.amount == this.amount &&
          other.totalPrice == this.totalPrice &&
          other.token == this.token);
}

class ActivatedTicketsCompanion extends UpdateCompanion<ActivatedTicket> {
  final Value<int> id;
  final Value<int> ticketId;
  final Value<String> vehicleNumber;
  final Value<DateTime?> activatedAt;
  final Value<DateTime?> expiresAt;
  final Value<String> transactionId;
  final Value<int> amount;
  final Value<double> totalPrice;
  final Value<String?> token;
  const ActivatedTicketsCompanion({
    this.id = const Value.absent(),
    this.ticketId = const Value.absent(),
    this.vehicleNumber = const Value.absent(),
    this.activatedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.amount = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.token = const Value.absent(),
  });
  ActivatedTicketsCompanion.insert({
    this.id = const Value.absent(),
    required int ticketId,
    required String vehicleNumber,
    this.activatedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    required String transactionId,
    required int amount,
    required double totalPrice,
    this.token = const Value.absent(),
  }) : ticketId = Value(ticketId),
       vehicleNumber = Value(vehicleNumber),
       transactionId = Value(transactionId),
       amount = Value(amount),
       totalPrice = Value(totalPrice);
  static Insertable<ActivatedTicket> custom({
    Expression<int>? id,
    Expression<int>? ticketId,
    Expression<String>? vehicleNumber,
    Expression<DateTime>? activatedAt,
    Expression<DateTime>? expiresAt,
    Expression<String>? transactionId,
    Expression<int>? amount,
    Expression<double>? totalPrice,
    Expression<String>? token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ticketId != null) 'ticket_id': ticketId,
      if (vehicleNumber != null) 'vehicle_number': vehicleNumber,
      if (activatedAt != null) 'activated_at': activatedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (transactionId != null) 'transaction_id': transactionId,
      if (amount != null) 'amount': amount,
      if (totalPrice != null) 'total_price': totalPrice,
      if (token != null) 'token': token,
    });
  }

  ActivatedTicketsCompanion copyWith({
    Value<int>? id,
    Value<int>? ticketId,
    Value<String>? vehicleNumber,
    Value<DateTime?>? activatedAt,
    Value<DateTime?>? expiresAt,
    Value<String>? transactionId,
    Value<int>? amount,
    Value<double>? totalPrice,
    Value<String?>? token,
  }) {
    return ActivatedTicketsCompanion(
      id: id ?? this.id,
      ticketId: ticketId ?? this.ticketId,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      activatedAt: activatedAt ?? this.activatedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      transactionId: transactionId ?? this.transactionId,
      amount: amount ?? this.amount,
      totalPrice: totalPrice ?? this.totalPrice,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ticketId.present) {
      map['ticket_id'] = Variable<int>(ticketId.value);
    }
    if (vehicleNumber.present) {
      map['vehicle_number'] = Variable<String>(vehicleNumber.value);
    }
    if (activatedAt.present) {
      map['activated_at'] = Variable<DateTime>(activatedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivatedTicketsCompanion(')
          ..write('id: $id, ')
          ..write('ticketId: $ticketId, ')
          ..write('vehicleNumber: $vehicleNumber, ')
          ..write('activatedAt: $activatedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('transactionId: $transactionId, ')
          ..write('amount: $amount, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TicketsTable tickets = $TicketsTable(this);
  late final $TicketInfoTable ticketInfo = $TicketInfoTable(this);
  late final $ActivatedTicketsTable activatedTickets = $ActivatedTicketsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tickets,
    ticketInfo,
    activatedTickets,
  ];
}

typedef $$TicketsTableCreateCompanionBuilder =
    TicketsCompanion Function({Value<int> id, Value<int> boughtCount});
typedef $$TicketsTableUpdateCompanionBuilder =
    TicketsCompanion Function({Value<int> id, Value<int> boughtCount});

class $$TicketsTableFilterComposer
    extends Composer<_$AppDatabase, $TicketsTable> {
  $$TicketsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get boughtCount => $composableBuilder(
    column: $table.boughtCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TicketsTableOrderingComposer
    extends Composer<_$AppDatabase, $TicketsTable> {
  $$TicketsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get boughtCount => $composableBuilder(
    column: $table.boughtCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TicketsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TicketsTable> {
  $$TicketsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get boughtCount => $composableBuilder(
    column: $table.boughtCount,
    builder: (column) => column,
  );
}

class $$TicketsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TicketsTable,
          Ticket,
          $$TicketsTableFilterComposer,
          $$TicketsTableOrderingComposer,
          $$TicketsTableAnnotationComposer,
          $$TicketsTableCreateCompanionBuilder,
          $$TicketsTableUpdateCompanionBuilder,
          (Ticket, BaseReferences<_$AppDatabase, $TicketsTable, Ticket>),
          Ticket,
          PrefetchHooks Function()
        > {
  $$TicketsTableTableManager(_$AppDatabase db, $TicketsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TicketsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TicketsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TicketsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> boughtCount = const Value.absent(),
              }) => TicketsCompanion(id: id, boughtCount: boughtCount),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> boughtCount = const Value.absent(),
              }) => TicketsCompanion.insert(id: id, boughtCount: boughtCount),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TicketsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TicketsTable,
      Ticket,
      $$TicketsTableFilterComposer,
      $$TicketsTableOrderingComposer,
      $$TicketsTableAnnotationComposer,
      $$TicketsTableCreateCompanionBuilder,
      $$TicketsTableUpdateCompanionBuilder,
      (Ticket, BaseReferences<_$AppDatabase, $TicketsTable, Ticket>),
      Ticket,
      PrefetchHooks Function()
    >;
typedef $$TicketInfoTableCreateCompanionBuilder =
    TicketInfoCompanion Function({
      Value<int> id,
      required int cityId,
      required int vehicleTypeId,
      required int variantId,
      required String name,
      required int minutes,
      required double price,
    });
typedef $$TicketInfoTableUpdateCompanionBuilder =
    TicketInfoCompanion Function({
      Value<int> id,
      Value<int> cityId,
      Value<int> vehicleTypeId,
      Value<int> variantId,
      Value<String> name,
      Value<int> minutes,
      Value<double> price,
    });

final class $$TicketInfoTableReferences
    extends BaseReferences<_$AppDatabase, $TicketInfoTable, TicketInfoData> {
  $$TicketInfoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ActivatedTicketsTable, List<ActivatedTicket>>
  _activatedTicketsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.activatedTickets,
    aliasName: $_aliasNameGenerator(
      db.ticketInfo.id,
      db.activatedTickets.ticketId,
    ),
  );

  $$ActivatedTicketsTableProcessedTableManager get activatedTicketsRefs {
    final manager = $$ActivatedTicketsTableTableManager(
      $_db,
      $_db.activatedTickets,
    ).filter((f) => f.ticketId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _activatedTicketsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TicketInfoTableFilterComposer
    extends Composer<_$AppDatabase, $TicketInfoTable> {
  $$TicketInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleTypeId => $composableBuilder(
    column: $table.vehicleTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> activatedTicketsRefs(
    Expression<bool> Function($$ActivatedTicketsTableFilterComposer f) f,
  ) {
    final $$ActivatedTicketsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.activatedTickets,
      getReferencedColumn: (t) => t.ticketId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivatedTicketsTableFilterComposer(
            $db: $db,
            $table: $db.activatedTickets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TicketInfoTableOrderingComposer
    extends Composer<_$AppDatabase, $TicketInfoTable> {
  $$TicketInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleTypeId => $composableBuilder(
    column: $table.vehicleTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutes => $composableBuilder(
    column: $table.minutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TicketInfoTableAnnotationComposer
    extends Composer<_$AppDatabase, $TicketInfoTable> {
  $$TicketInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<int> get vehicleTypeId => $composableBuilder(
    column: $table.vehicleTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get minutes =>
      $composableBuilder(column: $table.minutes, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  Expression<T> activatedTicketsRefs<T extends Object>(
    Expression<T> Function($$ActivatedTicketsTableAnnotationComposer a) f,
  ) {
    final $$ActivatedTicketsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.activatedTickets,
      getReferencedColumn: (t) => t.ticketId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivatedTicketsTableAnnotationComposer(
            $db: $db,
            $table: $db.activatedTickets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TicketInfoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TicketInfoTable,
          TicketInfoData,
          $$TicketInfoTableFilterComposer,
          $$TicketInfoTableOrderingComposer,
          $$TicketInfoTableAnnotationComposer,
          $$TicketInfoTableCreateCompanionBuilder,
          $$TicketInfoTableUpdateCompanionBuilder,
          (TicketInfoData, $$TicketInfoTableReferences),
          TicketInfoData,
          PrefetchHooks Function({bool activatedTicketsRefs})
        > {
  $$TicketInfoTableTableManager(_$AppDatabase db, $TicketInfoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TicketInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TicketInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TicketInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cityId = const Value.absent(),
                Value<int> vehicleTypeId = const Value.absent(),
                Value<int> variantId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> minutes = const Value.absent(),
                Value<double> price = const Value.absent(),
              }) => TicketInfoCompanion(
                id: id,
                cityId: cityId,
                vehicleTypeId: vehicleTypeId,
                variantId: variantId,
                name: name,
                minutes: minutes,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cityId,
                required int vehicleTypeId,
                required int variantId,
                required String name,
                required int minutes,
                required double price,
              }) => TicketInfoCompanion.insert(
                id: id,
                cityId: cityId,
                vehicleTypeId: vehicleTypeId,
                variantId: variantId,
                name: name,
                minutes: minutes,
                price: price,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TicketInfoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({activatedTicketsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (activatedTicketsRefs) db.activatedTickets,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (activatedTicketsRefs)
                    await $_getPrefetchedData<
                      TicketInfoData,
                      $TicketInfoTable,
                      ActivatedTicket
                    >(
                      currentTable: table,
                      referencedTable: $$TicketInfoTableReferences
                          ._activatedTicketsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TicketInfoTableReferences(
                                db,
                                table,
                                p0,
                              ).activatedTicketsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.ticketId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TicketInfoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TicketInfoTable,
      TicketInfoData,
      $$TicketInfoTableFilterComposer,
      $$TicketInfoTableOrderingComposer,
      $$TicketInfoTableAnnotationComposer,
      $$TicketInfoTableCreateCompanionBuilder,
      $$TicketInfoTableUpdateCompanionBuilder,
      (TicketInfoData, $$TicketInfoTableReferences),
      TicketInfoData,
      PrefetchHooks Function({bool activatedTicketsRefs})
    >;
typedef $$ActivatedTicketsTableCreateCompanionBuilder =
    ActivatedTicketsCompanion Function({
      Value<int> id,
      required int ticketId,
      required String vehicleNumber,
      Value<DateTime?> activatedAt,
      Value<DateTime?> expiresAt,
      required String transactionId,
      required int amount,
      required double totalPrice,
      Value<String?> token,
    });
typedef $$ActivatedTicketsTableUpdateCompanionBuilder =
    ActivatedTicketsCompanion Function({
      Value<int> id,
      Value<int> ticketId,
      Value<String> vehicleNumber,
      Value<DateTime?> activatedAt,
      Value<DateTime?> expiresAt,
      Value<String> transactionId,
      Value<int> amount,
      Value<double> totalPrice,
      Value<String?> token,
    });

final class $$ActivatedTicketsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ActivatedTicketsTable, ActivatedTicket> {
  $$ActivatedTicketsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TicketInfoTable _ticketIdTable(_$AppDatabase db) =>
      db.ticketInfo.createAlias(
        $_aliasNameGenerator(db.activatedTickets.ticketId, db.ticketInfo.id),
      );

  $$TicketInfoTableProcessedTableManager get ticketId {
    final $_column = $_itemColumn<int>('ticket_id')!;

    final manager = $$TicketInfoTableTableManager(
      $_db,
      $_db.ticketInfo,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ticketIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActivatedTicketsTableFilterComposer
    extends Composer<_$AppDatabase, $ActivatedTicketsTable> {
  $$ActivatedTicketsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vehicleNumber => $composableBuilder(
    column: $table.vehicleNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get activatedAt => $composableBuilder(
    column: $table.activatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  $$TicketInfoTableFilterComposer get ticketId {
    final $$TicketInfoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ticketId,
      referencedTable: $db.ticketInfo,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TicketInfoTableFilterComposer(
            $db: $db,
            $table: $db.ticketInfo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivatedTicketsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivatedTicketsTable> {
  $$ActivatedTicketsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vehicleNumber => $composableBuilder(
    column: $table.vehicleNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get activatedAt => $composableBuilder(
    column: $table.activatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  $$TicketInfoTableOrderingComposer get ticketId {
    final $$TicketInfoTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ticketId,
      referencedTable: $db.ticketInfo,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TicketInfoTableOrderingComposer(
            $db: $db,
            $table: $db.ticketInfo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivatedTicketsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivatedTicketsTable> {
  $$ActivatedTicketsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vehicleNumber => $composableBuilder(
    column: $table.vehicleNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get activatedAt => $composableBuilder(
    column: $table.activatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  $$TicketInfoTableAnnotationComposer get ticketId {
    final $$TicketInfoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ticketId,
      referencedTable: $db.ticketInfo,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TicketInfoTableAnnotationComposer(
            $db: $db,
            $table: $db.ticketInfo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivatedTicketsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivatedTicketsTable,
          ActivatedTicket,
          $$ActivatedTicketsTableFilterComposer,
          $$ActivatedTicketsTableOrderingComposer,
          $$ActivatedTicketsTableAnnotationComposer,
          $$ActivatedTicketsTableCreateCompanionBuilder,
          $$ActivatedTicketsTableUpdateCompanionBuilder,
          (ActivatedTicket, $$ActivatedTicketsTableReferences),
          ActivatedTicket,
          PrefetchHooks Function({bool ticketId})
        > {
  $$ActivatedTicketsTableTableManager(
    _$AppDatabase db,
    $ActivatedTicketsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$ActivatedTicketsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ActivatedTicketsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ActivatedTicketsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ticketId = const Value.absent(),
                Value<String> vehicleNumber = const Value.absent(),
                Value<DateTime?> activatedAt = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<String> transactionId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<double> totalPrice = const Value.absent(),
                Value<String?> token = const Value.absent(),
              }) => ActivatedTicketsCompanion(
                id: id,
                ticketId: ticketId,
                vehicleNumber: vehicleNumber,
                activatedAt: activatedAt,
                expiresAt: expiresAt,
                transactionId: transactionId,
                amount: amount,
                totalPrice: totalPrice,
                token: token,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ticketId,
                required String vehicleNumber,
                Value<DateTime?> activatedAt = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                required String transactionId,
                required int amount,
                required double totalPrice,
                Value<String?> token = const Value.absent(),
              }) => ActivatedTicketsCompanion.insert(
                id: id,
                ticketId: ticketId,
                vehicleNumber: vehicleNumber,
                activatedAt: activatedAt,
                expiresAt: expiresAt,
                transactionId: transactionId,
                amount: amount,
                totalPrice: totalPrice,
                token: token,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ActivatedTicketsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({ticketId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (ticketId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.ticketId,
                            referencedTable: $$ActivatedTicketsTableReferences
                                ._ticketIdTable(db),
                            referencedColumn:
                                $$ActivatedTicketsTableReferences
                                    ._ticketIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActivatedTicketsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivatedTicketsTable,
      ActivatedTicket,
      $$ActivatedTicketsTableFilterComposer,
      $$ActivatedTicketsTableOrderingComposer,
      $$ActivatedTicketsTableAnnotationComposer,
      $$ActivatedTicketsTableCreateCompanionBuilder,
      $$ActivatedTicketsTableUpdateCompanionBuilder,
      (ActivatedTicket, $$ActivatedTicketsTableReferences),
      ActivatedTicket,
      PrefetchHooks Function({bool ticketId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TicketsTableTableManager get tickets =>
      $$TicketsTableTableManager(_db, _db.tickets);
  $$TicketInfoTableTableManager get ticketInfo =>
      $$TicketInfoTableTableManager(_db, _db.ticketInfo);
  $$ActivatedTicketsTableTableManager get activatedTickets =>
      $$ActivatedTicketsTableTableManager(_db, _db.activatedTickets);
}
