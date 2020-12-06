import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'localization.dart';
import 'navigation.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: Routes.onGenerateRoute,
      builder: (final context, final navigator) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, navigator),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      supportedLocales: [
        const Locale('en', null),
        const Locale('pt', null),
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          Intl.defaultLocale = supportedLocales.first.toLanguageTag();
          return supportedLocales.first;
        }
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            Intl.defaultLocale = supportedLocale.toLanguageTag();
            return supportedLocale;
          }
        }
        Intl.defaultLocale = supportedLocales.first.toLanguageTag();
        return supportedLocales.first;
      },
    );
  }
}
