// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'a03da399b44b3740dc4fcfc6716203041d66ff01';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$dioRepositoryHash() => r'87af4fd99fac7e946cb7b5fae363c612f815fa4c';

/// See also [dioRepository].
@ProviderFor(dioRepository)
final dioRepositoryProvider = AutoDisposeProvider<DioRepository>.internal(
  dioRepository,
  name: r'dioRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dioRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRepositoryRef = AutoDisposeProviderRef<DioRepository>;
String _$createTransactionHash() => r'918f8cd88e3581bee1f3ed32130ef0ed9b057604';

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

/// See also [createTransaction].
@ProviderFor(createTransaction)
const createTransactionProvider = CreateTransactionFamily();

/// See also [createTransaction].
class CreateTransactionFamily extends Family<AsyncValue<String?>> {
  /// See also [createTransaction].
  const CreateTransactionFamily();

  /// See also [createTransaction].
  CreateTransactionProvider call({required String blikCode}) {
    return CreateTransactionProvider(blikCode: blikCode);
  }

  @override
  CreateTransactionProvider getProviderOverride(
    covariant CreateTransactionProvider provider,
  ) {
    return call(blikCode: provider.blikCode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createTransactionProvider';
}

/// See also [createTransaction].
class CreateTransactionProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [createTransaction].
  CreateTransactionProvider({required String blikCode})
    : this._internal(
        (ref) =>
            createTransaction(ref as CreateTransactionRef, blikCode: blikCode),
        from: createTransactionProvider,
        name: r'createTransactionProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$createTransactionHash,
        dependencies: CreateTransactionFamily._dependencies,
        allTransitiveDependencies:
            CreateTransactionFamily._allTransitiveDependencies,
        blikCode: blikCode,
      );

  CreateTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.blikCode,
  }) : super.internal();

  final String blikCode;

  @override
  Override overrideWith(
    FutureOr<String?> Function(CreateTransactionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTransactionProvider._internal(
        (ref) => create(ref as CreateTransactionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        blikCode: blikCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _CreateTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTransactionProvider && other.blikCode == blikCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, blikCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateTransactionRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `blikCode` of this provider.
  String get blikCode;
}

class _CreateTransactionProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with CreateTransactionRef {
  _CreateTransactionProviderElement(super.provider);

  @override
  String get blikCode => (origin as CreateTransactionProvider).blikCode;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
