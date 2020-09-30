import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/main.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user-type-selection/user-type-selection.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/radial_box.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/radial_button.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

import '../../app_localizations.dart';

class LanguageSelectionPage extends StatefulWidget {
  static const String routeName = "/language-settings-page";
  LanguageSelectionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
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
                      minExtentHeight: 0.0, maxExtentHeight: (200.0 - verticalScrollOffset).clamp(0.0, double.infinity)),
                )
              ],
            ),
            CustomScrollView(
              controller: bodyScrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: SizedBox(
                      height: 32.0,
                    ),
                  ),
                ),
                _buildHeader(context),
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
                child: RadialButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('CONTINUE')
                          .toUpperCase(),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        UserTypeSelectionPage.routeName,
                        arguments: selectedLocale);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesGrid(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              selectedLocale = appLocales[index];

              SunbirdApp.setLocale(context, appLocales[index].locale);
            },
            child: RadialBox(
              child: Center(
                child: Text(
                  appLocales[index].label,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: selectedLocale == appLocales[index]
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyText1.color,
                      ),
                ),
              ),
              color: selectedLocale == appLocales[index]
                  ? Theme.of(context).accentColor
                  : Colors.white,
            ),
          ),
        );
      }, childCount: appLocales.length),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).translate("APP_TITLE", arg: "Diksha"),
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Theme.of(context).accentColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context).translate("CHOOSE_LANGUAGE"),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
