import 'package:checoloresono/common/constants.dart';
import 'package:flutter/material.dart';

class LimitContainer extends StatelessWidget {
  const LimitContainer({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kSpaceM),
        constraints: BoxConstraints(maxWidth: kMaxWid),
        child: child,
      ),
    );
  }
}
