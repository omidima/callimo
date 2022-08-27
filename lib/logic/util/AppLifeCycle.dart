import 'dart:ui';

import 'package:flutter/material.dart';

import 'logger.dart';

class AppLifeCycle with WidgetsBindingObserver {


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state.index) {
      case 0:
        onAppResumed(state);
        break;

      case 2:
        onAppPaused(state);
        break;

      case 3:
        onAppDetached(state);
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  onAppStarted(AppLifecycleState state) {
    Logger.info("app state", state.name);
  }

  onAppPaused(AppLifecycleState state) {
    Logger.info("app state", state.name);
  }

  onAppResumed(AppLifecycleState state) {
    Logger.info("app state", state.name);
  }

  onAppDetached(AppLifecycleState state) {
    Logger.info("app state", state.name);
  }
}
