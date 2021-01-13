import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/network/get_region.dart';
import 'package:checoloresono/pages/first_page.dart';
import 'package:checoloresono/pages/second_page.dart';
import 'package:checoloresono/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sortedmap/sortedmap.dart';

import 'models/region.dart';

void main() async {
  await initializeDateFormatting('it');
  runApp(CheColoreSono());
}

class CheColoreSono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Che colore sono?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Computer Modern',
      ),
      locale: Locale('it'),
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

  Color _defaultBackgroundColor = Colors.grey[200];
  Color _backgroundColor;

  String _selectedRegion;
  int _selectedIndex = 0;

  bool _toggleOpacityFirstPage = true;
  bool _toggleOpacitySecondPage = true;
  bool _toggleOpacityThirdPage = false;

  Future<Map<String, List<Region>>> _listRegions;

  Future<Map<String, List<Region>>> _buildRegion() async {
    return SortedMap.from(await fetchRegion());
  }

  DateTime _now() => DateTime.now();
  String _formattedDate() => DateFormat.yMMMMEEEEd('it').format(_now());

  @override
  void initState() {
    super.initState();

    _backgroundColor = _defaultBackgroundColor;
    _listRegions = _buildRegion();
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
          child: FutureBuilder<Map<String, List<Region>>>(
            future: _listRegions,
            builder: (context, snapshot) {
              Widget _child;

              if (snapshot.hasError) {
                _child = Text(snapshot.error);
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                _child = SpinKitPulse(
                  color: Colors.black,
                );
              } else {
                _child = PageView(
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

                        _controller.nextPage(
                            duration: kDuration, curve: kCurve);
                      },
                    ),
                    SecondPage(
                      regions: snapshot.data,
                      toggleOpacity: _toggleOpacitySecondPage,
                      onPressedButton: (index) {
                        setState(() {
                          _toggleOpacitySecondPage = !_toggleOpacitySecondPage;

                          _selectedIndex = index;
                          _selectedRegion =
                              snapshot.data.keys.elementAt(_selectedIndex);

                          _toggleOpacityThirdPage = !_toggleOpacityThirdPage;
                          _backgroundColor = snapshot.data.values
                              .elementAt(_selectedIndex)
                              .first
                              .color;
                        });

                        _controller.nextPage(
                            duration: kDuration, curve: kCurve);
                      },
                    ),
                    ThirdPage(
                      onPressed: () {
                        setState(() {
                          _toggleOpacitySecondPage = !_toggleOpacitySecondPage;
                          _toggleOpacityThirdPage = !_toggleOpacityThirdPage;
                          _backgroundColor = _defaultBackgroundColor;
                        });

                        _controller.previousPage(
                          duration: kDuration,
                          curve: kCurve,
                        );
                      },
                      toggleOpacity: _toggleOpacityThirdPage,
                      date: _formattedDate(),
                      region:
                          snapshot.data.values.elementAt(_selectedIndex).first,
                      nameRegion: _selectedRegion,
                    ),
                  ],
                );
              }

              return AnimatedSwitcher(
                child: _child,
                duration: kDuration,
              );
            },
          ),
        ),
      ),
    );
  }
}
