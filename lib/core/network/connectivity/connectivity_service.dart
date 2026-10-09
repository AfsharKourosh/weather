import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class ConnectivityService {
  Future<bool> get isConnected;
}

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity connectivity;

  ConnectivityServiceImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final results = await connectivity.checkConnectivity();

    return results.any((result) => result != ConnectivityResult.none);
  }
}
