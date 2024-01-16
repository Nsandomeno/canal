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

String _$accountsFutureHash() => r'fde70e35c8a02eba38f54151c50a92bf1f079463';

/// See also [accountsFuture].
@ProviderFor(accountsFuture)
const accountsFutureProvider = AccountsFutureFamily();

/// See also [accountsFuture].
class AccountsFutureFamily extends Family<AsyncValue<List<Account?>>> {
  /// See also [accountsFuture].
  const AccountsFutureFamily();

  /// See also [accountsFuture].
  AccountsFutureProvider call(
    String userUid,
  ) {
    return AccountsFutureProvider(
      userUid,
    );
  }

  @override
  AccountsFutureProvider getProviderOverride(
    covariant AccountsFutureProvider provider,
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
  String? get name => r'accountsFutureProvider';
}

/// See also [accountsFuture].
class AccountsFutureProvider extends AutoDisposeFutureProvider<List<Account?>> {
  /// See also [accountsFuture].
  AccountsFutureProvider(
    String userUid,
  ) : this._internal(
          (ref) => accountsFuture(
            ref as AccountsFutureRef,
            userUid,
          ),
          from: accountsFutureProvider,
          name: r'accountsFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountsFutureHash,
          dependencies: AccountsFutureFamily._dependencies,
          allTransitiveDependencies:
              AccountsFutureFamily._allTransitiveDependencies,
          userUid: userUid,
        );

  AccountsFutureProvider._internal(
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
    FutureOr<List<Account?>> Function(AccountsFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountsFutureProvider._internal(
        (ref) => create(ref as AccountsFutureRef),
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
  AutoDisposeFutureProviderElement<List<Account?>> createElement() {
    return _AccountsFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountsFutureProvider && other.userUid == userUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountsFutureRef on AutoDisposeFutureProviderRef<List<Account?>> {
  /// The parameter `userUid` of this provider.
  String get userUid;
}

class _AccountsFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<Account?>>
    with AccountsFutureRef {
  _AccountsFutureProviderElement(super.provider);

  @override
  String get userUid => (origin as AccountsFutureProvider).userUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
