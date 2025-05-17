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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
