// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketRepositoryHash() => r'be61ada814dd2affb10cf538ee143389eb8c9085';

/// See also [ticketRepository].
@ProviderFor(ticketRepository)
final ticketRepositoryProvider = AutoDisposeProvider<TicketRepository>.internal(
  ticketRepository,
  name: r'ticketRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$ticketRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TicketRepositoryRef = AutoDisposeProviderRef<TicketRepository>;
String _$getTicketHash() => r'1304f68295d035e7f69f385b728f83b74d794850';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getTicket].
@ProviderFor(getTicket)
const getTicketProvider = GetTicketFamily();

/// See also [getTicket].
class GetTicketFamily extends Family<AsyncValue<TicketM?>> {
  /// See also [getTicket].
  const GetTicketFamily();

  /// See also [getTicket].
  GetTicketProvider call({required dynamic ticketId}) {
    return GetTicketProvider(ticketId: ticketId);
  }

  @override
  GetTicketProvider getProviderOverride(covariant GetTicketProvider provider) {
    return call(ticketId: provider.ticketId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTicketProvider';
}

/// See also [getTicket].
class GetTicketProvider extends AutoDisposeFutureProvider<TicketM?> {
  /// See also [getTicket].
  GetTicketProvider({required dynamic ticketId})
    : this._internal(
        (ref) => getTicket(ref as GetTicketRef, ticketId: ticketId),
        from: getTicketProvider,
        name: r'getTicketProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getTicketHash,
        dependencies: GetTicketFamily._dependencies,
        allTransitiveDependencies: GetTicketFamily._allTransitiveDependencies,
        ticketId: ticketId,
      );

  GetTicketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ticketId,
  }) : super.internal();

  final dynamic ticketId;

  @override
  Override overrideWith(
    FutureOr<TicketM?> Function(GetTicketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTicketProvider._internal(
        (ref) => create(ref as GetTicketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ticketId: ticketId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TicketM?> createElement() {
    return _GetTicketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTicketProvider && other.ticketId == ticketId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ticketId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTicketRef on AutoDisposeFutureProviderRef<TicketM?> {
  /// The parameter `ticketId` of this provider.
  dynamic get ticketId;
}

class _GetTicketProviderElement
    extends AutoDisposeFutureProviderElement<TicketM?>
    with GetTicketRef {
  _GetTicketProviderElement(super.provider);

  @override
  dynamic get ticketId => (origin as GetTicketProvider).ticketId;
}

String _$getAvailableTicketsHash() =>
    r'18ccdcd09eaab903c0fb9add461000ff6caed5d2';

/// See also [getAvailableTickets].
@ProviderFor(getAvailableTickets)
const getAvailableTicketsProvider = GetAvailableTicketsFamily();

/// See also [getAvailableTickets].
class GetAvailableTicketsFamily extends Family<AsyncValue<List<TicketM>>> {
  /// See also [getAvailableTickets].
  const GetAvailableTicketsFamily();

  /// See also [getAvailableTickets].
  GetAvailableTicketsProvider call({required int cityId}) {
    return GetAvailableTicketsProvider(cityId: cityId);
  }

  @override
  GetAvailableTicketsProvider getProviderOverride(
    covariant GetAvailableTicketsProvider provider,
  ) {
    return call(cityId: provider.cityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getAvailableTicketsProvider';
}

/// See also [getAvailableTickets].
class GetAvailableTicketsProvider
    extends AutoDisposeFutureProvider<List<TicketM>> {
  /// See also [getAvailableTickets].
  GetAvailableTicketsProvider({required int cityId})
    : this._internal(
        (ref) =>
            getAvailableTickets(ref as GetAvailableTicketsRef, cityId: cityId),
        from: getAvailableTicketsProvider,
        name: r'getAvailableTicketsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getAvailableTicketsHash,
        dependencies: GetAvailableTicketsFamily._dependencies,
        allTransitiveDependencies:
            GetAvailableTicketsFamily._allTransitiveDependencies,
        cityId: cityId,
      );

  GetAvailableTicketsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityId,
  }) : super.internal();

  final int cityId;

  @override
  Override overrideWith(
    FutureOr<List<TicketM>> Function(GetAvailableTicketsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAvailableTicketsProvider._internal(
        (ref) => create(ref as GetAvailableTicketsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityId: cityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TicketM>> createElement() {
    return _GetAvailableTicketsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAvailableTicketsProvider && other.cityId == cityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAvailableTicketsRef on AutoDisposeFutureProviderRef<List<TicketM>> {
  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _GetAvailableTicketsProviderElement
    extends AutoDisposeFutureProviderElement<List<TicketM>>
    with GetAvailableTicketsRef {
  _GetAvailableTicketsProviderElement(super.provider);

  @override
  int get cityId => (origin as GetAvailableTicketsProvider).cityId;
}

String _$getCityListHash() => r'b29722a0e90c583d25527dc9657fe9fde0a364bb';

/// See also [getCityList].
@ProviderFor(getCityList)
final getCityListProvider = AutoDisposeFutureProvider<List<City>>.internal(
  getCityList,
  name: r'getCityListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCityListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCityListRef = AutoDisposeFutureProviderRef<List<City>>;
String _$getVehicleListHash() => r'44ea5f2f38777e7ad1695190c736cac5d8deab25';

/// See also [getVehicleList].
@ProviderFor(getVehicleList)
const getVehicleListProvider = GetVehicleListFamily();

/// See also [getVehicleList].
class GetVehicleListFamily extends Family<AsyncValue<List<VehicleType>>> {
  /// See also [getVehicleList].
  const GetVehicleListFamily();

  /// See also [getVehicleList].
  GetVehicleListProvider call({required int cityId}) {
    return GetVehicleListProvider(cityId: cityId);
  }

  @override
  GetVehicleListProvider getProviderOverride(
    covariant GetVehicleListProvider provider,
  ) {
    return call(cityId: provider.cityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getVehicleListProvider';
}

/// See also [getVehicleList].
class GetVehicleListProvider
    extends AutoDisposeFutureProvider<List<VehicleType>> {
  /// See also [getVehicleList].
  GetVehicleListProvider({required int cityId})
    : this._internal(
        (ref) => getVehicleList(ref as GetVehicleListRef, cityId: cityId),
        from: getVehicleListProvider,
        name: r'getVehicleListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getVehicleListHash,
        dependencies: GetVehicleListFamily._dependencies,
        allTransitiveDependencies:
            GetVehicleListFamily._allTransitiveDependencies,
        cityId: cityId,
      );

  GetVehicleListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityId,
  }) : super.internal();

  final int cityId;

  @override
  Override overrideWith(
    FutureOr<List<VehicleType>> Function(GetVehicleListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVehicleListProvider._internal(
        (ref) => create(ref as GetVehicleListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityId: cityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VehicleType>> createElement() {
    return _GetVehicleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVehicleListProvider && other.cityId == cityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetVehicleListRef on AutoDisposeFutureProviderRef<List<VehicleType>> {
  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _GetVehicleListProviderElement
    extends AutoDisposeFutureProviderElement<List<VehicleType>>
    with GetVehicleListRef {
  _GetVehicleListProviderElement(super.provider);

  @override
  int get cityId => (origin as GetVehicleListProvider).cityId;
}

String _$getTicketVariantsHash() => r'5aa23ed8a6fe14f71309bcab3d2a8f1a0b743f2f';

/// See also [getTicketVariants].
@ProviderFor(getTicketVariants)
const getTicketVariantsProvider = GetTicketVariantsFamily();

/// See also [getTicketVariants].
class GetTicketVariantsFamily extends Family<AsyncValue<List<TicketVariant>>> {
  /// See also [getTicketVariants].
  const GetTicketVariantsFamily();

  /// See also [getTicketVariants].
  GetTicketVariantsProvider call({required int cityId}) {
    return GetTicketVariantsProvider(cityId: cityId);
  }

  @override
  GetTicketVariantsProvider getProviderOverride(
    covariant GetTicketVariantsProvider provider,
  ) {
    return call(cityId: provider.cityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTicketVariantsProvider';
}

/// See also [getTicketVariants].
class GetTicketVariantsProvider
    extends AutoDisposeFutureProvider<List<TicketVariant>> {
  /// See also [getTicketVariants].
  GetTicketVariantsProvider({required int cityId})
    : this._internal(
        (ref) => getTicketVariants(ref as GetTicketVariantsRef, cityId: cityId),
        from: getTicketVariantsProvider,
        name: r'getTicketVariantsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getTicketVariantsHash,
        dependencies: GetTicketVariantsFamily._dependencies,
        allTransitiveDependencies:
            GetTicketVariantsFamily._allTransitiveDependencies,
        cityId: cityId,
      );

  GetTicketVariantsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityId,
  }) : super.internal();

  final int cityId;

  @override
  Override overrideWith(
    FutureOr<List<TicketVariant>> Function(GetTicketVariantsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTicketVariantsProvider._internal(
        (ref) => create(ref as GetTicketVariantsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityId: cityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TicketVariant>> createElement() {
    return _GetTicketVariantsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTicketVariantsProvider && other.cityId == cityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTicketVariantsRef
    on AutoDisposeFutureProviderRef<List<TicketVariant>> {
  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _GetTicketVariantsProviderElement
    extends AutoDisposeFutureProviderElement<List<TicketVariant>>
    with GetTicketVariantsRef {
  _GetTicketVariantsProviderElement(super.provider);

  @override
  int get cityId => (origin as GetTicketVariantsProvider).cityId;
}

String _$getUserTicketsHash() => r'eab0c9c69b7201b30585e52901a9f5ff3708e6b0';

/// See also [getUserTickets].
@ProviderFor(getUserTickets)
final getUserTicketsProvider =
    AutoDisposeFutureProvider<List<UserTicket>>.internal(
      getUserTickets,
      name: r'getUserTicketsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getUserTicketsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUserTicketsRef = AutoDisposeFutureProviderRef<List<UserTicket>>;
String _$getUserMostBoughTicketsHash() =>
    r'9d349b87175f41bf859b46bf63249b3c7d55ca39';

/// See also [getUserMostBoughTickets].
@ProviderFor(getUserMostBoughTickets)
final getUserMostBoughTicketsProvider =
    AutoDisposeFutureProvider<List<TicketM>>.internal(
      getUserMostBoughTickets,
      name: r'getUserMostBoughTicketsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getUserMostBoughTicketsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUserMostBoughTicketsRef =
    AutoDisposeFutureProviderRef<List<TicketM>>;
String _$vehicleExistsHash() => r'a4da6501fc9b9a3aae193132e8a4f63627d2c1a3';

/// See also [vehicleExists].
@ProviderFor(vehicleExists)
const vehicleExistsProvider = VehicleExistsFamily();

/// See also [vehicleExists].
class VehicleExistsFamily extends Family<AsyncValue<ValidationResult>> {
  /// See also [vehicleExists].
  const VehicleExistsFamily();

  /// See also [vehicleExists].
  VehicleExistsProvider call({
    required String vehicleFleetNumber,
    required int cityId,
  }) {
    return VehicleExistsProvider(
      vehicleFleetNumber: vehicleFleetNumber,
      cityId: cityId,
    );
  }

  @override
  VehicleExistsProvider getProviderOverride(
    covariant VehicleExistsProvider provider,
  ) {
    return call(
      vehicleFleetNumber: provider.vehicleFleetNumber,
      cityId: provider.cityId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'vehicleExistsProvider';
}

/// See also [vehicleExists].
class VehicleExistsProvider
    extends AutoDisposeFutureProvider<ValidationResult> {
  /// See also [vehicleExists].
  VehicleExistsProvider({
    required String vehicleFleetNumber,
    required int cityId,
  }) : this._internal(
         (ref) => vehicleExists(
           ref as VehicleExistsRef,
           vehicleFleetNumber: vehicleFleetNumber,
           cityId: cityId,
         ),
         from: vehicleExistsProvider,
         name: r'vehicleExistsProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$vehicleExistsHash,
         dependencies: VehicleExistsFamily._dependencies,
         allTransitiveDependencies:
             VehicleExistsFamily._allTransitiveDependencies,
         vehicleFleetNumber: vehicleFleetNumber,
         cityId: cityId,
       );

  VehicleExistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicleFleetNumber,
    required this.cityId,
  }) : super.internal();

  final String vehicleFleetNumber;
  final int cityId;

  @override
  Override overrideWith(
    FutureOr<ValidationResult> Function(VehicleExistsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VehicleExistsProvider._internal(
        (ref) => create(ref as VehicleExistsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicleFleetNumber: vehicleFleetNumber,
        cityId: cityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ValidationResult> createElement() {
    return _VehicleExistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VehicleExistsProvider &&
        other.vehicleFleetNumber == vehicleFleetNumber &&
        other.cityId == cityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicleFleetNumber.hashCode);
    hash = _SystemHash.combine(hash, cityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VehicleExistsRef on AutoDisposeFutureProviderRef<ValidationResult> {
  /// The parameter `vehicleFleetNumber` of this provider.
  String get vehicleFleetNumber;

  /// The parameter `cityId` of this provider.
  int get cityId;
}

class _VehicleExistsProviderElement
    extends AutoDisposeFutureProviderElement<ValidationResult>
    with VehicleExistsRef {
  _VehicleExistsProviderElement(super.provider);

  @override
  String get vehicleFleetNumber =>
      (origin as VehicleExistsProvider).vehicleFleetNumber;
  @override
  int get cityId => (origin as VehicleExistsProvider).cityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
