import 'package:checoloresono/common/constants.dart';
import 'package:flutter/material.dart';

class LimitContainer extends StatelessWidget {
  const LimitContainer({
    Key key,
    @required Widget child,
  })  : _child = child,
        super(key: key);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kSpaceM),
        constraints: const BoxConstraints(maxWidth: kMaxWid),
        child: _child,
      ),
    );
  }
}
