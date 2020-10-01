import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/main.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/language_selection_screen/widgets/header.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection_screen/user_type_selection.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/custom_elevation.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

import '../../app_localizations.dart';

class LanguageSelectionScreen extends StatefulWidget {
  static const String routeName = "/language-settings-page";

  LanguageSelectionScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  LocaleDetail selectedLocale;

  ScrollController bodyScrollController = new ScrollController();
  double verticalScrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: DynamicTopBar(
                      minExtentHeight: 0.0,
                      maxExtentHeight: (200.0 - verticalScrollOffset)
                          .clamp(0.0, double.infinity)),
                )
              ],
            ),
            CustomScrollView(
              controller: bodyScrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: SizedBox(
                      height: 16.0,
                    ),
                  ),
                ),
                Header(context),
                _buildLanguagesGrid(context),
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: SizedBox(
                      height: 32.0 + 16.0,
                    ),
                  ),
                ),
              ],
            ),
            _buildContinueButton(context),
          ],
        ),
        onNotification: (ScrollNotification scrollInfo) {
          setState(() {
            verticalScrollOffset = bodyScrollController.offset;
          });
        },
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16,
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomElevation(
                  radius: 30,
                  color: Theme.of(context).accentColor,
                  child: FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('CONTINUE')
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          UserTypeSelectionScreen.routeName,
                          arguments: selectedLocale);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesGrid(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 24.0,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {
              selectedLocale = appLocales[index];

              SunbirdApp.setLocale(context, appLocales[index].locale);
            },
            child: CustomElevation(
              radius: 20,
              color: selectedLocale == appLocales[index]
                  ? Theme.of(context).accentColor
                  : Colors.white,
              child: Container(
                child: Center(
                  child: Text(
                    appLocales[index].label,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                          color: selectedLocale == appLocales[index]
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1.color,
                          fontWeight: selectedLocale == appLocales[index]
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                  ),
                ),
              ),
            ),
          );
        }, childCount: appLocales.length),
      ),
    );
  }
}
