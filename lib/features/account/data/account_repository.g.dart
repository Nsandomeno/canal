// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountRepositoryHash() => r'2249709d67b76b52ff47ed676823eecbce048c9a';

/// See also [accountRepository].
@ProviderFor(accountRepository)
final accountRepositoryProvider = Provider<AccountRepository>.internal(
  accountRepository,
  name: r'accountRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountRepositoryRef = ProviderRef<AccountRepository>;
String _$accountStreamHash() => r'91fbcc869b93939fadf692a3b7412d8cf71e1bc3';

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

/// See also [accountStream].
@ProviderFor(accountStream)
const accountStreamProvider = AccountStreamFamily();

/// See also [accountStream].
class AccountStreamFamily extends Family<AsyncValue<Account?>> {
  /// See also [accountStream].
  const AccountStreamFamily();

  /// See also [accountStream].
  AccountStreamProvider call(
    String userUid,
  ) {
    return AccountStreamProvider(
      userUid,
    );
  }

  @override
  AccountStreamProvider getProviderOverride(
    covariant AccountStreamProvider provider,
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
  String? get name => r'accountStreamProvider';
}

/// See also [accountStream].
class AccountStreamProvider extends AutoDisposeStreamProvider<Account?> {
  /// See also [accountStream].
  AccountStreamProvider(
    String userUid,
  ) : this._internal(
          (ref) => accountStream(
            ref as AccountStreamRef,
            userUid,
          ),
          from: accountStreamProvider,
          name: r'accountStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountStreamHash,
          dependencies: AccountStreamFamily._dependencies,
          allTransitiveDependencies:
              AccountStreamFamily._allTransitiveDependencies,
          userUid: userUid,
        );

  AccountStreamProvider._internal(
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
    Stream<Account?> Function(AccountStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountStreamProvider._internal(
        (ref) => create(ref as AccountStreamRef),
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
  AutoDisposeStreamProviderElement<Account?> createElement() {
    return _AccountStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountStreamProvider && other.userUid == userUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountStreamRef on AutoDisposeStreamProviderRef<Account?> {
  /// The parameter `userUid` of this provider.
  String get userUid;
}

class _AccountStreamProviderElement
    extends AutoDisposeStreamProviderElement<Account?> with AccountStreamRef {
  _AccountStreamProviderElement(super.provider);

  @override
  String get userUid => (origin as AccountStreamProvider).userUid;
}

String _$accountFutureHash() => r'5f88337f00b748595aa1d91626e49da15760e6d5';

/// See also [accountFuture].
@ProviderFor(accountFuture)
const accountFutureProvider = AccountFutureFamily();

/// See also [accountFuture].
class AccountFutureFamily extends Family<AsyncValue<Account?>> {
  /// See also [accountFuture].
  const AccountFutureFamily();

  /// See also [accountFuture].
  AccountFutureProvider call(
    String userUid,
  ) {
    return AccountFutureProvider(
      userUid,
    );
  }

  @override
  AccountFutureProvider getProviderOverride(
    covariant AccountFutureProvider provider,
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
  String? get name => r'accountFutureProvider';
}

/// See also [accountFuture].
class AccountFutureProvider extends AutoDisposeFutureProvider<Account?> {
  /// See also [accountFuture].
  AccountFutureProvider(
    String userUid,
  ) : this._internal(
          (ref) => accountFuture(
            ref as AccountFutureRef,
            userUid,
          ),
          from: accountFutureProvider,
          name: r'accountFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountFutureHash,
          dependencies: AccountFutureFamily._dependencies,
          allTransitiveDependencies:
              AccountFutureFamily._allTransitiveDependencies,
          userUid: userUid,
        );

  AccountFutureProvider._internal(
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
    FutureOr<Account?> Function(AccountFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountFutureProvider._internal(
        (ref) => create(ref as AccountFutureRef),
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
  AutoDisposeFutureProviderElement<Account?> createElement() {
    return _AccountFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountFutureProvider && other.userUid == userUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountFutureRef on AutoDisposeFutureProviderRef<Account?> {
  /// The parameter `userUid` of this provider.
  String get userUid;
}

class _AccountFutureProviderElement
    extends AutoDisposeFutureProviderElement<Account?> with AccountFutureRef {
  _AccountFutureProviderElement(super.provider);

  @override
  String get userUid => (origin as AccountFutureProvider).userUid;
}

String _$kycDocumentListStreamHash() =>
    r'89693555c1c5b9234fa78df6cbc6fe2cebd942f0';

/// See also [kycDocumentListStream].
@ProviderFor(kycDocumentListStream)
const kycDocumentListStreamProvider = KycDocumentListStreamFamily();

/// See also [kycDocumentListStream].
class KycDocumentListStreamFamily
    extends Family<AsyncValue<List<KycDocument?>>> {
  /// See also [kycDocumentListStream].
  const KycDocumentListStreamFamily();

  /// See also [kycDocumentListStream].
  KycDocumentListStreamProvider call(
    String userUid,
  ) {
    return KycDocumentListStreamProvider(
      userUid,
    );
  }

  @override
  KycDocumentListStreamProvider getProviderOverride(
    covariant KycDocumentListStreamProvider provider,
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
  String? get name => r'kycDocumentListStreamProvider';
}

/// See also [kycDocumentListStream].
class KycDocumentListStreamProvider
    extends AutoDisposeStreamProvider<List<KycDocument?>> {
  /// See also [kycDocumentListStream].
  KycDocumentListStreamProvider(
    String userUid,
  ) : this._internal(
          (ref) => kycDocumentListStream(
            ref as KycDocumentListStreamRef,
            userUid,
          ),
          from: kycDocumentListStreamProvider,
          name: r'kycDocumentListStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kycDocumentListStreamHash,
          dependencies: KycDocumentListStreamFamily._dependencies,
          allTransitiveDependencies:
              KycDocumentListStreamFamily._allTransitiveDependencies,
          userUid: userUid,
        );

  KycDocumentListStreamProvider._internal(
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
    Stream<List<KycDocument?>> Function(KycDocumentListStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KycDocumentListStreamProvider._internal(
        (ref) => create(ref as KycDocumentListStreamRef),
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
  AutoDisposeStreamProviderElement<List<KycDocument?>> createElement() {
    return _KycDocumentListStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KycDocumentListStreamProvider && other.userUid == userUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KycDocumentListStreamRef
    on AutoDisposeStreamProviderRef<List<KycDocument?>> {
  /// The parameter `userUid` of this provider.
  String get userUid;
}

class _KycDocumentListStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<KycDocument?>>
    with KycDocumentListStreamRef {
  _KycDocumentListStreamProviderElement(super.provider);

  @override
  String get userUid => (origin as KycDocumentListStreamProvider).userUid;
}

String _$kycDocumentListFutureHash() =>
    r'5919d293d851eee04a3ea5997003314e89663e72';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
