import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/network/get_region.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:sortedmap/sortedmap.dart';

import 'models/region.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Che colore sono?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Computer Modern',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();

  Color _backgroundColor = Colors.grey[200];

  Animation<Offset> _animationWaiting;
  AnimationController _animationControllerWaiting;

  int _selectedRegion = -1;

  Map<String, List<Region>> _regions;

  _buildRegion() {
    Map<String, List<Region>> _fromInternet = SortedMap.from(fetchRegion());

    setState(() {
      _regions = _fromInternet;
    });
  }

  @override
  void initState() {
    super.initState();

    _buildRegion();

    _animationControllerWaiting = AnimationController(
      vsync: this,
      duration: kDuration,
    );

    _animationWaiting = Tween<Offset>(
      begin: Offset(0.0, 2.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationControllerWaiting,
        curve: kCurve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationControllerWaiting.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedRegion != -1) _animationControllerWaiting.forward();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        duration: kDuration,
        color: _backgroundColor,
        child: Center(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: [
              FirstPage(
                onPressed: () =>
                    _controller.nextPage(duration: kDuration, curve: kCurve),
              ),
              SecondPage(
                selectedRegion: _selectedRegion,
                regions: _regions,
                animationWaiting: _animationWaiting,
                controller: _controller,
                onPressed: (reg) {
                  setState(() {
                    _selectedRegion = reg;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key key,
    @required int selectedRegion,
    @required Map<String, List<Region>> regions,
    @required Animation<Offset> animationWaiting,
    @required PageController controller,
    @required this.onPressed,
  })  : _selectedRegion = selectedRegion,
        _regions = regions,
        _animationWaiting = animationWaiting,
        _controller = controller,
        super(key: key);

  final int _selectedRegion;
  final Map<String, List<Region>> _regions;
  final Animation<Offset> _animationWaiting;
  final PageController _controller;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kSpaceS),
        constraints: BoxConstraints(maxWidth: kMaxWid),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: ListView.builder(
                itemBuilder: (_, index) => RadioListTile(
                  value: index,
                  groupValue: _selectedRegion,
                  onChanged: (region) => onPressed(region),
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
                  onPressed: () {
                    print(_regions.keys.elementAt(_selectedRegion));
                    _controller.nextPage(duration: kDuration, curve: kCurve);
                    // setState(() {
                    //   _backgroundColor = Colors.red;
                    // });
                  },
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

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kSpaceM),
        constraints: BoxConstraints(maxWidth: kMaxWid),
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
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: kSpaceXS,
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
              onPressed: onPressed,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(kSpaceM),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Made with love by ',
                  style: TextStyle(
                    fontFamily: 'Plex',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400].withOpacity(0.4),
                  ),
                  children: [
                    TextSpan(
                      text: 'beFair',
                      style: TextStyle(
                        fontFamily: 'Plex',
                        fontWeight: FontWeight.bold,
                        color: Colors.green[400].withOpacity(0.4),
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
