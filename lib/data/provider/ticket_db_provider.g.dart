// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_db_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$ticketDbRepositoryHash() =>
    r'039c98104c7be2bc729e540412e77d5e26d433d6';

/// See also [ticketDbRepository].
@ProviderFor(ticketDbRepository)
final ticketDbRepositoryProvider =
    AutoDisposeProvider<TicketDbRepository>.internal(
      ticketDbRepository,
      name: r'ticketDbRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$ticketDbRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TicketDbRepositoryRef = AutoDisposeProviderRef<TicketDbRepository>;
String _$mostBoughtTicketHash() => r'0b36582d1df7d83781d5e300950e93417a70c9e3';

/// See also [mostBoughtTicket].
@ProviderFor(mostBoughtTicket)
final mostBoughtTicketProvider = AutoDisposeFutureProvider<Ticket?>.internal(
  mostBoughtTicket,
  name: r'mostBoughtTicketProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$mostBoughtTicketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MostBoughtTicketRef = AutoDisposeFutureProviderRef<Ticket?>;
String _$addActivatedTicketHash() =>
    r'7da2d2107c49eb54fbd82e7a349b651a64b29d76';

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

/// See also [addActivatedTicket].
@ProviderFor(addActivatedTicket)
const addActivatedTicketProvider = AddActivatedTicketFamily();

/// See also [addActivatedTicket].
class AddActivatedTicketFamily extends Family<AsyncValue<int>> {
  /// See also [addActivatedTicket].
  const AddActivatedTicketFamily();

  /// See also [addActivatedTicket].
  AddActivatedTicketProvider call(ActivatedTicketAppModel activatedTicket) {
    return AddActivatedTicketProvider(activatedTicket);
  }

  @override
  AddActivatedTicketProvider getProviderOverride(
    covariant AddActivatedTicketProvider provider,
  ) {
    return call(provider.activatedTicket);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addActivatedTicketProvider';
}

/// See also [addActivatedTicket].
class AddActivatedTicketProvider extends AutoDisposeFutureProvider<int> {
  /// See also [addActivatedTicket].
  AddActivatedTicketProvider(ActivatedTicketAppModel activatedTicket)
    : this._internal(
        (ref) =>
            addActivatedTicket(ref as AddActivatedTicketRef, activatedTicket),
        from: addActivatedTicketProvider,
        name: r'addActivatedTicketProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$addActivatedTicketHash,
        dependencies: AddActivatedTicketFamily._dependencies,
        allTransitiveDependencies:
            AddActivatedTicketFamily._allTransitiveDependencies,
        activatedTicket: activatedTicket,
      );

  AddActivatedTicketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activatedTicket,
  }) : super.internal();

  final ActivatedTicketAppModel activatedTicket;

  @override
  Override overrideWith(
    FutureOr<int> Function(AddActivatedTicketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddActivatedTicketProvider._internal(
        (ref) => create(ref as AddActivatedTicketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activatedTicket: activatedTicket,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _AddActivatedTicketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddActivatedTicketProvider &&
        other.activatedTicket == activatedTicket;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activatedTicket.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddActivatedTicketRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `activatedTicket` of this provider.
  ActivatedTicketAppModel get activatedTicket;
}

class _AddActivatedTicketProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with AddActivatedTicketRef {
  _AddActivatedTicketProviderElement(super.provider);

  @override
  ActivatedTicketAppModel get activatedTicket =>
      (origin as AddActivatedTicketProvider).activatedTicket;
}

String _$getActiveTicketsHash() => r'14e619084c9047c7363b430ac240e658c63264a8';

/// See also [getActiveTickets].
@ProviderFor(getActiveTickets)
final getActiveTicketsProvider =
    AutoDisposeFutureProvider<List<ActivatedTicket>>.internal(
      getActiveTickets,
      name: r'getActiveTicketsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getActiveTicketsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetActiveTicketsRef =
    AutoDisposeFutureProviderRef<List<ActivatedTicket>>;
String _$watchActiveTicketsHash() =>
    r'4fc20b1d031e5236815d3922f6e9c82cfe4cdaec';

/// See also [watchActiveTickets].
@ProviderFor(watchActiveTickets)
final watchActiveTicketsProvider =
    AutoDisposeStreamProvider<List<ActivatedTicket>>.internal(
      watchActiveTickets,
      name: r'watchActiveTicketsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchActiveTicketsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchActiveTicketsRef =
    AutoDisposeStreamProviderRef<List<ActivatedTicket>>;
String _$watchExpiredTicketsHash() =>
    r'0ddb7b605ffbb8d26fca6c70250213fe0e81140d';

/// See also [watchExpiredTickets].
@ProviderFor(watchExpiredTickets)
final watchExpiredTicketsProvider =
    AutoDisposeStreamProvider<List<ActivatedTicket>>.internal(
      watchExpiredTickets,
      name: r'watchExpiredTicketsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchExpiredTicketsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchExpiredTicketsRef =
    AutoDisposeStreamProviderRef<List<ActivatedTicket>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
