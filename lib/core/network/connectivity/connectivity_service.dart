import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class ConnectivityService {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity connectivity;
  bool _lastConnectivityStatus = false;

  ConnectivityServiceImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final results = await connectivity.checkConnectivity();

    return results.any((result) => result != ConnectivityResult.none);
  }

  @override
  Stream<bool> get onConnectivityChanged async* {
    final initialStatus = await isConnected;

    _lastConnectivityStatus = initialStatus;
    
    // Yield the initial connectivity state
    yield initialStatus;

    await for (final results in connectivity.onConnectivityChanged) {
      final isConnected = results.any(
        (result) => result != ConnectivityResult.none,
      );

      if (isConnected != _lastConnectivityStatus) {
        _lastConnectivityStatus = isConnected;
        yield isConnected;
      }
    }
  }
}
