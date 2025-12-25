import 'package:flutter/material.dart';

/// Global route observer used to detect when screens become visible again.
final RouteObserver<ModalRoute<void>> appRouteObserver =
    RouteObserver<ModalRoute<void>>();
