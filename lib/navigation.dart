import 'package:flutter/material.dart';

import 'src/views/home_page.dart';

class Routes {
  static const String home = '/';

  static Route<T> _buildRoute<T>(
          final RouteSettings settings, final WidgetBuilder page) =>
      MaterialPageRoute(builder: page, settings: settings);

  static Route<dynamic> onGenerateRoute(final RouteSettings _settings) =>
      _buildRoute<Widget>(
        _settings,
        (final context) {
          switch (_settings.name) {
            case home:
              return WillPopScope(
                onWillPop: () async => false,
                child: HomePage(),
              );
            default:
              return null;
          }
        },
      );
}
