import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/widgets/black_button.dart';
import 'package:checoloresono/widgets/limit_container.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
    @required Function onPressed,
    @required bool toggleOpacity,
  })  : _onPressed = onPressed,
        _toggleOpacity = toggleOpacity,
        super(key: key);

  final Function _onPressed;
  final bool _toggleOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kDuration,
      opacity: _toggleOpacity ? 1.0 : 0.0,
      child: LimitContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Text(
              'Che colore sono?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 0.9,
                color: Colors.grey[800],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: kSpaceS),
              height: kSpaceXS,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: kBorderRadius,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Attraverso la seguente piattaforma potrai ',
                style: TextStyle(
                  fontFamily: 'Computer Modern',
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  height: 1.4,
                  color: Colors.grey[700],
                ),
                children: [
                  TextSpan(
                    text:
                        'selezionare la tua regione per scoprire immediatemente a quale zona appartiene, e di conseguenza, quali sono le indicazioni che sei ',
                    style: TextStyle(
                      fontFamily: 'Computer Modern',
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[700],
                    ),
                  ),
                  TextSpan(
                    text: 'tenuto ',
                    style: TextStyle(
                      fontFamily: 'Computer Modern',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: Colors.grey[700],
                    ),
                  ),
                  TextSpan(
                    text: 'a rispettare',
                    style: TextStyle(
                      fontFamily: 'Computer Modern',
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kSpaceM,
            ),
            BlackButton(
              iconData: Icons.flag_rounded,
              widget: Text(
                'Seleziona la tua regione'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.9,
                  fontFamily: 'Plex',
                ),
              ),
              onPressed: _onPressed,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(kSpaceM),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Made with love by ',
                  style: TextStyle(
                    fontFamily: 'Computer Modern',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400],
                  ),
                  children: [
                    TextSpan(
                      text: 'Francesco Coppola',
                      style: TextStyle(
                        fontFamily: 'Computer Modern',
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
