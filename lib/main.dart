import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sunbird_ed_flutter_mobile_app/init.dart';

import './routes.dart';
import 'app_localizations.dart';
import 'pages/language_selection_screen/language_selection_page.dart';

void main() {
  runApp(SunbirdApp());
}

class SunbirdApp extends StatefulWidget {
  @override
  _SunbirdAppState createState() => _SunbirdAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _SunbirdAppState state =
        context.findAncestorStateOfType<_SunbirdAppState>();

    state.setState(() {
      state._locale = newLocale;
    });
  }
}

class _SunbirdAppState extends State<SunbirdApp> {
  Locale _locale;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'NotoSans',
            primarySwatch: Colors.blue,
            primaryColor: Color(0xFFFFD954),
            accentColor: Color(0xFF024F9D),
            scaffoldBackgroundColor: Color(0xFFE9E8D9),
            buttonTheme: ButtonThemeData(
              buttonColor: Color(0xFF024F9D),
              textTheme: ButtonTextTheme.primary,
            ),
            appBarTheme: AppBarTheme(shadowColor: Colors.transparent),
            textTheme: TextTheme(
              button: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: _locale ?? Locale('en', ''),
          supportedLocales: appLocales.map((e) => e.locale),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one
            // from the list (English, in this case).
            return supportedLocales.first;
          },
          home: LanguageSelectionScreen(title: 'Flutter Demo Home Page'),
          routes: routes,
        );
      },
    );
  }
}
