/*
core/
└── storage/
    ├── local_storage.dart
    └── local_storage_impl.dart


abstract interface class LocalStorage {
  Future<void> write<T>(
    String key,
    T value,
  );

  T? read<T>(String key);

  Future<void> delete(String key);

  Future<void> clear();
}
----------------------------------------------
class LocalStorageImpl implements LocalStorage {
  final SharedPreferences preferences;

  LocalStorageImpl(this.preferences);

  @override
  Future<void> write<T>(
    String key,
    T value,
  ) async {
    // implementation
  }

  @override
  T? read<T>(String key) {
    // implementation
  }

  @override
  Future<void> delete(String key) async {
    await preferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await preferences.clear();
  }
}

*/