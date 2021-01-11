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

  Map<String, List<Region>> _regions;
  String _selectedRegion;
  int _selectedIndex = 0;

  bool _toggleOpacityFirstPage = true;
  bool _toggleOpacitySecondPage = true;

  _buildRegion() {
    Map<String, List<Region>> _fromInternet =
        SortedMap.from(fetchRegion(http.Client()));

    setState(() {
      _regions = _fromInternet;
    });
  }

  @override
  void initState() {
    super.initState();
    _buildRegion();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        duration: kDuration,
        color: _backgroundColor,
        child: Center(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
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
                regions: _regions,
                toggleOpacity: _toggleOpacitySecondPage,
                onPressedButton: (index) {
                  setState(() {
                    _toggleOpacitySecondPage = !_toggleOpacitySecondPage;
                    _selectedIndex = index;
                    _selectedRegion = _regions.keys.elementAt(_selectedIndex);
                    _backgroundColor =
                        _regions.values.elementAt(_selectedIndex).first.color;
                  });
                  _controller.nextPage(duration: kDuration, curve: kCurve);
                },
              ),
              ThirdPage(
                colorRegion: _regions.values.elementAt(_selectedIndex).first,
                nameRegion: _selectedRegion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
