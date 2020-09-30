import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';

class BuildHeader extends StatelessWidget {
  final BuildContext context;
  BuildHeader(this.context);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context).translate("APP_TITLE", arg: "DIKSHA"),
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Theme.of(context).accentColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context).translate("ROLE_SELECTOR_QUERY"))
        ],
      ),
    );
  }
}
