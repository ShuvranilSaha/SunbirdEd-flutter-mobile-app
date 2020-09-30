import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

class ProfileSettingsScreen extends StatefulWidget {
  static const routeName = "/profile-settings";
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  ScrollController bodyScrollController = new ScrollController();
  double verticalScrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: DynamicTopBar(
                  minExtentHeight: 0.0,
                  maxExtentHeight: (200 - verticalScrollOffset).clamp(0.0, double.infinity)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
