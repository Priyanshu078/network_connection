import 'package:equatable/equatable.dart';

abstract class ConnectionStates extends Equatable {
  const ConnectionStates();
  @override
  List<Object?> get props => [];
}

class NoConnectionState extends ConnectionStates {
  const NoConnectionState();
}

class WifiConnectionState extends ConnectionStates {
  const WifiConnectionState();
}

class MobileConnectionState extends ConnectionStates {
  const MobileConnectionState();
}
