import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/network/get_region.dart';
import 'package:checoloresono/pages/first_page.dart';
import 'package:checoloresono/pages/second_page.dart';
import 'package:checoloresono/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:http/http.dart' as http;

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

  bool _toggleOpacityFirstPage = true;
  bool _toggleOpacitySecondPage = true;

  _buildRegion() {
    Map<String, List<Region>> _fromInternet =
        SortedMap.from(fetchRegion(http.Client()));

    setState(() {
      _regions = _fromInternet;
    });
  }

  Color _colorRegion(Region region) {
    switch (region) {
      case Region.ROSSO:
        return Colors.red;
      case Region.ARANCIONE:
        return Colors.orange;
      case Region.GIALLO:
        return Colors.yellow[600];
      default:
        return Colors.transparent;
    }
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
                toggleOpacity: _toggleOpacityFirstPage,
                onPressed: () {
                  setState(() {
                    _toggleOpacityFirstPage = !_toggleOpacityFirstPage;
                  });
                  _controller.nextPage(duration: kDuration, curve: kCurve);
                },
              ),
              SecondPage(
                selectedRegion: _selectedRegion,
                regions: _regions,
                animationWaiting: _animationWaiting,
                toggleOpacity: _toggleOpacitySecondPage,
                onPressedButton: () {
                  setState(() {
                    _toggleOpacitySecondPage = !_toggleOpacitySecondPage;
                    _backgroundColor = _colorRegion(
                        _regions.values.elementAt(_selectedRegion).first);
                  });
                  _controller.nextPage(duration: kDuration, curve: kCurve);
                },
                onPressedRadio: (reg) {
                  setState(() {
                    _selectedRegion = reg;
                  });
                },
              ),
              ThirdPage(
                colorRegion: _selectedRegion != -1
                    ? _regions.values.elementAt(_selectedRegion)[0].toString()
                    : '',
                nameRegion: _selectedRegion != -1
                    ? _regions.keys.elementAt(_selectedRegion)
                    : '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
