// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'8366fba5ac0d6b90c6a637882d24c5e759a5a92f';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$sendOtpHash() => r'b10c1f73fa977ccc55a660cc438bfc6681285fee';

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

/// See also [sendOtp].
@ProviderFor(sendOtp)
const sendOtpProvider = SendOtpFamily();

/// See also [sendOtp].
class SendOtpFamily extends Family<AsyncValue<bool>> {
  /// See also [sendOtp].
  const SendOtpFamily();

  /// See also [sendOtp].
  SendOtpProvider call({required String phoneNumber}) {
    return SendOtpProvider(phoneNumber: phoneNumber);
  }

  @override
  SendOtpProvider getProviderOverride(covariant SendOtpProvider provider) {
    return call(phoneNumber: provider.phoneNumber);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sendOtpProvider';
}

/// See also [sendOtp].
class SendOtpProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [sendOtp].
  SendOtpProvider({required String phoneNumber})
    : this._internal(
        (ref) => sendOtp(ref as SendOtpRef, phoneNumber: phoneNumber),
        from: sendOtpProvider,
        name: r'sendOtpProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$sendOtpHash,
        dependencies: SendOtpFamily._dependencies,
        allTransitiveDependencies: SendOtpFamily._allTransitiveDependencies,
        phoneNumber: phoneNumber,
      );

  SendOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phoneNumber,
  }) : super.internal();

  final String phoneNumber;

  @override
  Override overrideWith(FutureOr<bool> Function(SendOtpRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SendOtpProvider._internal(
        (ref) => create(ref as SendOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phoneNumber: phoneNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SendOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOtpProvider && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SendOtpRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;
}

class _SendOtpProviderElement extends AutoDisposeFutureProviderElement<bool>
    with SendOtpRef {
  _SendOtpProviderElement(super.provider);

  @override
  String get phoneNumber => (origin as SendOtpProvider).phoneNumber;
}

String _$verifyOtpHash() => r'd8bd1a98f3099406975b1ecf90580f2b52164978';

/// See also [verifyOtp].
@ProviderFor(verifyOtp)
const verifyOtpProvider = VerifyOtpFamily();

/// See also [verifyOtp].
class VerifyOtpFamily extends Family<AsyncValue<OtpResult>> {
  /// See also [verifyOtp].
  const VerifyOtpFamily();

  /// See also [verifyOtp].
  VerifyOtpProvider call({required String phoneNumber, required String token}) {
    return VerifyOtpProvider(phoneNumber: phoneNumber, token: token);
  }

  @override
  VerifyOtpProvider getProviderOverride(covariant VerifyOtpProvider provider) {
    return call(phoneNumber: provider.phoneNumber, token: provider.token);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verifyOtpProvider';
}

/// See also [verifyOtp].
class VerifyOtpProvider extends AutoDisposeFutureProvider<OtpResult> {
  /// See also [verifyOtp].
  VerifyOtpProvider({required String phoneNumber, required String token})
    : this._internal(
        (ref) => verifyOtp(
          ref as VerifyOtpRef,
          phoneNumber: phoneNumber,
          token: token,
        ),
        from: verifyOtpProvider,
        name: r'verifyOtpProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$verifyOtpHash,
        dependencies: VerifyOtpFamily._dependencies,
        allTransitiveDependencies: VerifyOtpFamily._allTransitiveDependencies,
        phoneNumber: phoneNumber,
        token: token,
      );

  VerifyOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phoneNumber,
    required this.token,
  }) : super.internal();

  final String phoneNumber;
  final String token;

  @override
  Override overrideWith(
    FutureOr<OtpResult> Function(VerifyOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOtpProvider._internal(
        (ref) => create(ref as VerifyOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phoneNumber: phoneNumber,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OtpResult> createElement() {
    return _VerifyOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOtpProvider &&
        other.phoneNumber == phoneNumber &&
        other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VerifyOtpRef on AutoDisposeFutureProviderRef<OtpResult> {
  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;

  /// The parameter `token` of this provider.
  String get token;
}

class _VerifyOtpProviderElement
    extends AutoDisposeFutureProviderElement<OtpResult>
    with VerifyOtpRef {
  _VerifyOtpProviderElement(super.provider);

  @override
  String get phoneNumber => (origin as VerifyOtpProvider).phoneNumber;
  @override
  String get token => (origin as VerifyOtpProvider).token;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
