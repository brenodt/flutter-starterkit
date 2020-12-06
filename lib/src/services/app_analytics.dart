import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AppAnalytics {
  FirebaseAnalytics _analytics;
  FirebaseAnalyticsObserver _observer;

  AppAnalytics() {
    _analytics = FirebaseAnalytics();
    _observer = FirebaseAnalyticsObserver(analytics: _analytics);
    _analytics.logAppOpen();
  }

  FirebaseAnalytics get instance => _analytics;
  FirebaseAnalyticsObserver get observer => _observer;
}
