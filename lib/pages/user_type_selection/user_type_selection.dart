import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection/widgets/build_header.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection/widgets/select_profile_type_card.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

class UserTypeSelectionPage extends StatefulWidget {
  static const routeName = "/user-type-selection";

  @override
  _UserTypeSelectionPageState createState() => _UserTypeSelectionPageState();
}

class _UserTypeSelectionPageState extends State<UserTypeSelectionPage> {
  final profileType = ['USER_TYPE_1', 'USER_TYPE_2', 'USER_TYPE_3'];

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
                 maxExtentHeight: (200.0 - verticalScrollOffset).clamp(0.0, double.infinity),
               ),
             ),
           ],
         ),
          CustomScrollView(
            controller: bodyScrollController,
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                  child: SizedBox(),
                ),
              ),
              BuildHeader(context),
              SelectProfileTypeCard(context, profileType),
            ],
          )
        ],
      ),
    );
  }
}
