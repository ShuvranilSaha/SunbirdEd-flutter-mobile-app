import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final double height;

  TopBar(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Color(0x3D000000),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ]),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Image(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/leaves_bottom.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicTopBar extends SliverPersistentHeaderDelegate {
  final double minExtentHeight;
  final double maxExtentHeight;

  DynamicTopBar(
      {@required this.minExtentHeight, @required this.maxExtentHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return TopBar(constraints.maxHeight);
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => maxExtentHeight;

  @override
  double get minExtent => minExtentHeight;
}
