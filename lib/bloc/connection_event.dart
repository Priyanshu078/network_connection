import 'package:equatable/equatable.dart';

abstract class ConnectionEvent extends Equatable {
  const ConnectionEvent();
  @override
  List<Object?> get props => [];
}

class NoConnectionEvent extends ConnectionEvent {
  const NoConnectionEvent();
}

class WifiConnectionEvent extends ConnectionEvent {
  const WifiConnectionEvent();
}

class MobileConnectionEvent extends ConnectionEvent {
  const MobileConnectionEvent();
}
