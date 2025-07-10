import 'package:connectivity_plus/connectivity_plus.dart';

extension CheckConnection on Connectivity {
  Future<bool> hasConnection() async {
    final connections = await checkConnectivity();

    return !connections.contains(
      ConnectivityResult.none,
    );
  }
}
