import 'package:flutter/widgets.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/language_selection/language_selection_page.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/profile-settings/framework_category_selection_screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection/user_type_selection.dart';

final Map<String, WidgetBuilder> routes = {
  LanguageSelectionPage.routeName: (context) => LanguageSelectionPage(),
  UserTypeSelectionPage.routeName: (context) => UserTypeSelectionPage(),
  FrameworkCategorySelectionScreen.routeName: (context) => FrameworkCategorySelectionScreen()
};
