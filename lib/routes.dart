import 'package:flutter/widgets.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/framework_category_selection_screen/framework_category_selection_screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/language_selection_screen/language_selection_page.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/qr_scanner_screen/qr_scanner_screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection_screen/user_type_selection.dart';

final Map<String, WidgetBuilder> routes = {
  LanguageSelectionScreen.routeName: (context) => LanguageSelectionScreen(),
  UserTypeSelectionScreen.routeName: (context) => UserTypeSelectionScreen(),
  FrameworkCategorySelectionScreen.routeName: (context) =>
      FrameworkCategorySelectionScreen(),
  QrScannerScreen.routeName: (context) => QrScannerScreen()
};
