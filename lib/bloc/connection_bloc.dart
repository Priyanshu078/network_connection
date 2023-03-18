import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connection_event.dart';
import 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionStates> {
  ConnectionBloc() : super(const NoConnectionState()) {
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectionResult) {
      if (connectionResult == ConnectivityResult.wifi) {
        add(const WifiConnectionEvent());
      } else if (connectionResult == ConnectivityResult.mobile) {
        add(const MobileConnectionEvent());
      } else if (connectionResult == ConnectivityResult.none) {
        add(const NoConnectionEvent());
      }
    });
    on<NoConnectionEvent>((event, emit) => emit(const NoConnectionState()));
    on<WifiConnectionEvent>((event, emit) => emit(const WifiConnectionState()));
    on<MobileConnectionEvent>(
        (event, emit) => emit(const MobileConnectionState()));
  }

  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
