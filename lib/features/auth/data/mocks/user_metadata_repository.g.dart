// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_metadata_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userMetadataRepositoryHash() =>
    r'0a3891e22cadecc8deb0ec8e8c5c1c4cdfb3c809';

/// See also [userMetadataRepository].
@ProviderFor(userMetadataRepository)
final userMetadataRepositoryProvider =
    Provider<UserMetadataRepository>.internal(
  userMetadataRepository,
  name: r'userMetadataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userMetadataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserMetadataRepositoryRef = ProviderRef<UserMetadataRepository>;
String _$userMetadataRefreshTimeHash() =>
    r'76468ec73128c6e2a59f4dba28fd1c644ccac55c';

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

/// See also [userMetadataRefreshTime].
@ProviderFor(userMetadataRefreshTime)
const userMetadataRefreshTimeProvider = UserMetadataRefreshTimeFamily();

/// See also [userMetadataRefreshTime].
class UserMetadataRefreshTimeFamily extends Family<AsyncValue<DateTime?>> {
  /// See also [userMetadataRefreshTime].
  const UserMetadataRefreshTimeFamily();

  /// See also [userMetadataRefreshTime].
  UserMetadataRefreshTimeProvider call(
    String uid,
  ) {
    return UserMetadataRefreshTimeProvider(
      uid,
    );
  }

  @override
  UserMetadataRefreshTimeProvider getProviderOverride(
    covariant UserMetadataRefreshTimeProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'userMetadataRefreshTimeProvider';
}

/// See also [userMetadataRefreshTime].
class UserMetadataRefreshTimeProvider extends StreamProvider<DateTime?> {
  /// See also [userMetadataRefreshTime].
  UserMetadataRefreshTimeProvider(
    String uid,
  ) : this._internal(
          (ref) => userMetadataRefreshTime(
            ref as UserMetadataRefreshTimeRef,
            uid,
          ),
          from: userMetadataRefreshTimeProvider,
          name: r'userMetadataRefreshTimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userMetadataRefreshTimeHash,
          dependencies: UserMetadataRefreshTimeFamily._dependencies,
          allTransitiveDependencies:
              UserMetadataRefreshTimeFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserMetadataRefreshTimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<DateTime?> Function(UserMetadataRefreshTimeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserMetadataRefreshTimeProvider._internal(
        (ref) => create(ref as UserMetadataRefreshTimeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  StreamProviderElement<DateTime?> createElement() {
    return _UserMetadataRefreshTimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserMetadataRefreshTimeProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserMetadataRefreshTimeRef on StreamProviderRef<DateTime?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserMetadataRefreshTimeProviderElement
    extends StreamProviderElement<DateTime?> with UserMetadataRefreshTimeRef {
  _UserMetadataRefreshTimeProviderElement(super.provider);

  @override
  String get uid => (origin as UserMetadataRefreshTimeProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
