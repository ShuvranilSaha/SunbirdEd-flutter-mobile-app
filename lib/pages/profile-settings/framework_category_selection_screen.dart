import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

class FrameworkCategorySelectionScreen extends StatefulWidget {
  static const routeName = "/profile-settings";
  @override
  _FrameworkCategorySelectionScreenState createState() => _FrameworkCategorySelectionScreenState();
}

class _FrameworkCategorySelectionScreenState extends State<FrameworkCategorySelectionScreen> {
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
