import 'package:flutter/widgets.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/language_selection/language_selection_page.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/profile-settings/profile-settings-screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user-type-selection/user-type-selection.dart';

final Map<String, WidgetBuilder> routes = {
  LanguageSelectionPage.routeName: (context) => LanguageSelectionPage(),
  UserTypeSelectionPage.routeName: (context) => UserTypeSelectionPage(),
  ProfileSettingsScreen.routeName: (context) => ProfileSettingsScreen()
};
