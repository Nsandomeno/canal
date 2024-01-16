// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_document_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kycDocumentRepositoryHash() =>
    r'5723591a0651613093fa14ad8f6c493cc5fee7e1';

/// See also [kycDocumentRepository].
@ProviderFor(kycDocumentRepository)
final kycDocumentRepositoryProvider = Provider<KycDocumentRepository>.internal(
  kycDocumentRepository,
  name: r'kycDocumentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kycDocumentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycDocumentRepositoryRef = ProviderRef<KycDocumentRepository>;
String _$kycDocumentListFutureHash() =>
    r'fe5dd96e297b8c3830b0eaa4938cdbf43d0fa486';

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

/// See also [kycDocumentListFuture].
@ProviderFor(kycDocumentListFuture)
const kycDocumentListFutureProvider = KycDocumentListFutureFamily();

/// See also [kycDocumentListFuture].
class KycDocumentListFutureFamily
    extends Family<AsyncValue<List<KycDocument?>>> {
  /// See also [kycDocumentListFuture].
  const KycDocumentListFutureFamily();

  /// See also [kycDocumentListFuture].
  KycDocumentListFutureProvider call(
    String userUid,
  ) {
    return KycDocumentListFutureProvider(
      userUid,
    );
  }

  @override
  KycDocumentListFutureProvider getProviderOverride(
    covariant KycDocumentListFutureProvider provider,
  ) {
    return call(
      provider.userUid,
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
  String? get name => r'kycDocumentListFutureProvider';
}

/// See also [kycDocumentListFuture].
class KycDocumentListFutureProvider
    extends AutoDisposeFutureProvider<List<KycDocument?>> {
  /// See also [kycDocumentListFuture].
  KycDocumentListFutureProvider(
    String userUid,
  ) : this._internal(
          (ref) => kycDocumentListFuture(
            ref as KycDocumentListFutureRef,
            userUid,
          ),
          from: kycDocumentListFutureProvider,
          name: r'kycDocumentListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kycDocumentListFutureHash,
          dependencies: KycDocumentListFutureFamily._dependencies,
          allTransitiveDependencies:
              KycDocumentListFutureFamily._allTransitiveDependencies,
          userUid: userUid,
        );

  KycDocumentListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userUid,
  }) : super.internal();

  final String userUid;

  @override
  Override overrideWith(
    FutureOr<List<KycDocument?>> Function(KycDocumentListFutureRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KycDocumentListFutureProvider._internal(
        (ref) => create(ref as KycDocumentListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userUid: userUid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<KycDocument?>> createElement() {
    return _KycDocumentListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KycDocumentListFutureProvider && other.userUid == userUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KycDocumentListFutureRef
    on AutoDisposeFutureProviderRef<List<KycDocument?>> {
  /// The parameter `userUid` of this provider.
  String get userUid;
}

class _KycDocumentListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<KycDocument?>>
    with KycDocumentListFutureRef {
  _KycDocumentListFutureProviderElement(super.provider);

  @override
  String get userUid => (origin as KycDocumentListFutureProvider).userUid;
}

String _$kycDocumentFutureHash() => r'128d8f5dcae5bfa40540353233a5fcba1eca5a01';

/// See also [kycDocumentFuture].
@ProviderFor(kycDocumentFuture)
const kycDocumentFutureProvider = KycDocumentFutureFamily();

/// See also [kycDocumentFuture].
class KycDocumentFutureFamily extends Family<AsyncValue<KycDocument?>> {
  /// See also [kycDocumentFuture].
  const KycDocumentFutureFamily();

  /// See also [kycDocumentFuture].
  KycDocumentFutureProvider call(
    String docId,
  ) {
    return KycDocumentFutureProvider(
      docId,
    );
  }

  @override
  KycDocumentFutureProvider getProviderOverride(
    covariant KycDocumentFutureProvider provider,
  ) {
    return call(
      provider.docId,
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
  String? get name => r'kycDocumentFutureProvider';
}

/// See also [kycDocumentFuture].
class KycDocumentFutureProvider
    extends AutoDisposeFutureProvider<KycDocument?> {
  /// See also [kycDocumentFuture].
  KycDocumentFutureProvider(
    String docId,
  ) : this._internal(
          (ref) => kycDocumentFuture(
            ref as KycDocumentFutureRef,
            docId,
          ),
          from: kycDocumentFutureProvider,
          name: r'kycDocumentFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kycDocumentFutureHash,
          dependencies: KycDocumentFutureFamily._dependencies,
          allTransitiveDependencies:
              KycDocumentFutureFamily._allTransitiveDependencies,
          docId: docId,
        );

  KycDocumentFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.docId,
  }) : super.internal();

  final String docId;

  @override
  Override overrideWith(
    FutureOr<KycDocument?> Function(KycDocumentFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KycDocumentFutureProvider._internal(
        (ref) => create(ref as KycDocumentFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        docId: docId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<KycDocument?> createElement() {
    return _KycDocumentFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KycDocumentFutureProvider && other.docId == docId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, docId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KycDocumentFutureRef on AutoDisposeFutureProviderRef<KycDocument?> {
  /// The parameter `docId` of this provider.
  String get docId;
}

class _KycDocumentFutureProviderElement
    extends AutoDisposeFutureProviderElement<KycDocument?>
    with KycDocumentFutureRef {
  _KycDocumentFutureProviderElement(super.provider);

  @override
  String get docId => (origin as KycDocumentFutureProvider).docId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
