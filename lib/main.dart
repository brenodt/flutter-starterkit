import 'package:flutter/material.dart';
import 'package:project_base/src/views/home_page.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: (settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.home:
              return WillPopScope(
                onWillPop: () async => false,
                child: HomePage(),
              );
            default:
              return null;
          }
        });
      },
    );
  }
}
