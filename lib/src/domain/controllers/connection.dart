import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'connection.g.dart';

@Riverpod(keepAlive: true)
class Connection extends _$Connection {
  @override
  FutureOr<bool> build() async {
    final connectivity = Connectivity();

    final initialState = await connectivity.checkConnectivity();

    final connectionSub = connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      final hasConnection = result.contains(ConnectivityResult.none);

      state = AsyncData(hasConnection);
    });

    ref.onDispose(
      () async => connectionSub.cancel(),
    );

    return initialState.contains(ConnectivityResult.none);
  }
}
