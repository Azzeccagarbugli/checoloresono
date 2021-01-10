import 'package:checoloresono/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    Key key,
    @required this.onPressed,
    @required this.widget,
    @required this.iconData,
  }) : super(key: key);

  final Widget widget;
  final IconData iconData;
  final Function onPressed;

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
            color: Colors.black,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    iconData,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: widget,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.lens,
                  size: 12,
                  color: Colors.white38,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
