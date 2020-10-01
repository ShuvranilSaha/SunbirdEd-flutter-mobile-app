import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/framework_category_selection_screen/framework_category_selection_screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/custom_elevation.dart';

import '../user_type_selection.dart';

class SelectProfileTypeGrid extends StatelessWidget {
  final BuildContext context;
  final List<ProfileTypeData> profileType;

  SelectProfileTypeGrid(this.context, this.profileType);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              child: CustomElevation(
                radius: 20,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Wrap(
                      children: [
                        Image.asset(profileType[index].image),
                        Center(
                          child: Text(
                            AppLocalizations.of(context).translate(profileType[index].label),
                            style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).textTheme.bodyText1.color,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
          childAspectRatio: 1 / 1.3,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
      ),
    );
  }
}
