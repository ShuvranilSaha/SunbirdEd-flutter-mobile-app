import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection_screen/widgets/header.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/user_type_selection_screen/widgets/select_profile_type_grid.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

class ProfileTypeData {
  String label;
  String image;

  ProfileTypeData(this.label, this.image);
}

class UserTypeSelectionScreen extends StatefulWidget {
  static const routeName = "/user-type-selection";

  @override
  _UserTypeSelectionScreenState createState() =>
      _UserTypeSelectionScreenState();
}

class _UserTypeSelectionScreenState extends State<UserTypeSelectionScreen> {
  final List<ProfileTypeData> profileTypes = [
    ProfileTypeData('USER_TYPE_1', 'assets/images/profile_type_teacher.png'),
    ProfileTypeData('USER_TYPE_2', 'assets/images/profile_type_student.png'),
    ProfileTypeData('USER_TYPE_3', 'assets/images/profile_type_other.png'),
  ];

  ScrollController bodyScrollController = new ScrollController();
  double verticalScrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: DynamicTopBar(
                  minExtentHeight: 0.0,
                  maxExtentHeight: (200.0 - verticalScrollOffset)
                      .clamp(0.0, double.infinity),
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
              Header(context),
              SelectProfileTypeGrid(context, profileTypes),
            ],
          )
        ],
      ),
    );
  }
}
