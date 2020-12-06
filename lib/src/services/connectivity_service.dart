import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectionStatus extends ChangeNotifier {
  StreamSubscription<ConnectivityResult> _subscription;
  bool _connected;

  ConnectionStatus() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _connected = result != ConnectivityResult.none;
    });
  }

  @mustCallSuper
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  bool get connected => _connected;
}
