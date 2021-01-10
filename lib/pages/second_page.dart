import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/widgets/black_button.dart';
import 'package:checoloresono/widgets/limit_container.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key key,
    @required int selectedRegion,
    @required Map<String, List<Region>> regions,
    @required Animation<Offset> animationWaiting,
    @required Function onPressedRadio,
    @required Function onPressedButton,
    @required bool toggleOpacity,
  })  : _selectedRegion = selectedRegion,
        _regions = regions,
        _animationWaiting = animationWaiting,
        _onPressedRadio = onPressedRadio,
        _onPressedButton = onPressedButton,
        _toggleOpacity = toggleOpacity,
        super(key: key);

  final int _selectedRegion;
  final Map<String, List<Region>> _regions;
  final Animation<Offset> _animationWaiting;
  final Function _onPressedRadio;
  final Function _onPressedButton;
  final bool _toggleOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kDuration,
      opacity: _toggleOpacity ? 1.0 : 0.0,
      child: LimitContainer(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) => RadioListTile(
                  value: index,
                  groupValue: _selectedRegion,
                  onChanged: (region) => _onPressedRadio(region),
                  activeColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: kBorderRadius,
                  ),
                  title: Text(
                    _regions.keys.elementAt(index),
                    style: TextStyle(
                      fontFamily: 'Plex',
                    ),
                  ),
                ),
                itemCount: _regions.length,
              ),
            ),
            Positioned(
              left: 0,
              bottom: kSpaceM,
              right: 0,
              child: SlideTransition(
                position: _animationWaiting,
                child: BlackButton(
                  iconData: Icons.place_rounded,
                  onPressed: () => _onPressedButton(),
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedRegion != -1
                            ? 'Prosegui con: ${_regions.keys.elementAt(_selectedRegion)}'
                                .toUpperCase()
                            : '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.9,
                          fontFamily: 'Plex',
                        ),
                      ),
                      Text(
                        DateTime.now().toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Plex',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
