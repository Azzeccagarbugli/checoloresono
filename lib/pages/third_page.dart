import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/widgets/limit_container.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key key,
    @required String nameRegion,
    @required Region colorRegion,
  })  : _nameRegion = nameRegion,
        _colorRegion = colorRegion,
        super(key: key);

  final String _nameRegion;
  final Region _colorRegion;

  @override
  Widget build(BuildContext context) {
    return LimitContainer(
      child: Container(
        padding: const EdgeInsets.all(kSpaceM),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kBorderRadius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _nameRegion,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey[800],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: kSpaceS),
              height: kSpaceXS,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: kBorderRadius,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'La seguente regione è di ',
                style: TextStyle(
                  fontFamily: 'Computer Modern',
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  height: 1.4,
                  color: Colors.grey[700],
                ),
                children: [
                  TextSpan(
                    text: 'colore ${_colorRegion.name}',
                    style: TextStyle(
                      fontFamily: 'Computer Modern',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: _colorRegion.color,
                    ),
                  ),
                  TextSpan(
                    text:
                        ', si prega di rispettare le norme vigenti per questo determinato colore',
                    style: TextStyle(
                      fontFamily: 'Computer Modern',
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
