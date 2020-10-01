import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/framework_category_selection_screen/widgets/top_section.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

import 'widgets/bottom_section.dart';
import 'widgets/top_section.dart';

class FrameworkCategorySelectionScreen extends StatefulWidget {
  static const routeName = "/profile-settings";

  @override
  _FrameworkCategorySelectionScreenState createState() =>
      _FrameworkCategorySelectionScreenState();
}

class _FrameworkCategorySelectionScreenState
    extends State<FrameworkCategorySelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(top: 0, child: TopBar(150)),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TopSection(),
        SizedBox(
          height: 64,
        ),
        BottomSection(),
      ],
    );
  }
}
