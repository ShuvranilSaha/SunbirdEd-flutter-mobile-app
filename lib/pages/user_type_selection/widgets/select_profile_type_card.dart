import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/framework_category_selection_screen/framework_category_selection_screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/custom_elevation.dart';

class SelectProfileTypeCard extends StatelessWidget {
  final BuildContext context;
  final List<String> profileType;

  SelectProfileTypeCard(this.context, this.profileType);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              child: CustomElevation(
                radius: 20,
                color: Colors.white,
                child: Container(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).translate(profileType[index]),
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(FrameworkCategorySelectionScreen.routeName);
              },
            ),
          );
        }, childCount: 3),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 24.0,
        ),
      ),
    );
  }
}
