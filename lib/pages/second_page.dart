import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/common/remove_glow.dart';
import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/widgets/limit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key key,
    @required Map<String, List<Region>> regions,
    @required Function onPressedButton,
    @required bool toggleOpacity,
  })  : _regions = regions,
        _onPressedButton = onPressedButton,
        _toggleOpacity = toggleOpacity,
        super(key: key);

  final Map<String, List<Region>> _regions;
  final Function _onPressedButton;
  final bool _toggleOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kDuration,
      opacity: _toggleOpacity ? 1.0 : 0.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ScrollConfiguration(
              behavior: RemoveGlow(),
              child: ListView.builder(
                itemBuilder: (_, index) => LimitContainer(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _onPressedButton(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: kSpaceS),
                        padding: const EdgeInsets.all(kSpaceS),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kBorderRadius,
                        ),
                        child: ListTile(
                          hoverColor: Colors.black,
                          mouseCursor: SystemMouseCursors.click,
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text(
                              _regions.keys.elementAt(index)[0].toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Plex',
                              ),
                            ),
                          ),
                          trailing: Icon(
                            Icons.lens,
                            color: _regions.values.elementAt(index)[0].color,
                            size: 12,
                          ),
                          title: Row(
                            children: [
                              Text(
                                _regions.keys.elementAt(index),
                                style: TextStyle(
                                  fontFamily: 'Plex',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: _regions.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
