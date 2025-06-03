// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

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
String _$paymentRepositoryImplHash() =>
    r'2644d6003f1c370aaaaf5467d5050c587731232a';

/// See also [paymentRepositoryImpl].
@ProviderFor(paymentRepositoryImpl)
final paymentRepositoryImplProvider =
    AutoDisposeProvider<PaymentRepository>.internal(
      paymentRepositoryImpl,
      name: r'paymentRepositoryImplProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$paymentRepositoryImplHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentRepositoryImplRef = AutoDisposeProviderRef<PaymentRepository>;
String _$paymentServiceHash() => r'f92f518fc642e3f7c6174cecef045863850ab936';

/// See also [paymentService].
@ProviderFor(paymentService)
final paymentServiceProvider = AutoDisposeProvider<PaymentService>.internal(
  paymentService,
  name: r'paymentServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentServiceRef = AutoDisposeProviderRef<PaymentService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
