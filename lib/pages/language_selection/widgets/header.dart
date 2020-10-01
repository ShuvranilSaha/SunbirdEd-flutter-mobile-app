import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';

class Header extends StatelessWidget {
  final BuildContext context;

  Header(this.context);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).translate("APP_TITLE", arg: "Diksha"),
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            AppLocalizations.of(context).translate("CHOOSE_LANGUAGE"),
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
