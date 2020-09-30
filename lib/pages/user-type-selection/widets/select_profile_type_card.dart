import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/profile-settings/profile-settings-screen.dart';


class SelectProfileTypeCard extends StatelessWidget {
  final BuildContext context;
  final List<String> profileType;

  SelectProfileTypeCard(this.context, this.profileType);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context).translate(profileType[index]),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ProfileSettingsScreen.routeName);
            },
          ),
        );
      }, childCount: 3),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
