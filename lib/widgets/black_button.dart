import 'package:checoloresono/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../common/constants.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    Key key,
    @required this.onPressed,
    @required this.widget,
    @required this.iconData,
    this.color = Colors.black,
    this.visibility = true,
    this.border,
  }) : super(key: key);

  final Widget widget;
  final IconData iconData;
  final Function onPressed;
  final Color color;
  final bool visibility;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(kSpaceM),
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: color ?? Colors.black,
            border: border ?? null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: visibility,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      iconData,
                      color: color ?? Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: widget,
              ),
              Visibility(
                visible: visibility,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.lens,
                    size: 12,
                    color: Colors.white38,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
