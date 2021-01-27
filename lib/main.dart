import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/common/session_manager.dart';
import 'package:checoloresono/models/saved_region.dart';
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
import 'package:url_strategy/url_strategy.dart';

import 'models/region.dart';

void main() async {
  await initializeDateFormatting('it');
  setPathUrlStrategy();
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
  Color _defaultBackgroundColor = Colors.grey[200];
  Color _backgroundColor;

  String _selectedRegion;
  int _selectedIndex = 0;

  bool _toggleOpacityFirstPage = true;
  bool _toggleOpacitySecondPage = true;
  bool _toggleOpacityThirdPage = false;

  Future<Map<String, List<Region>>> _buildRegion() async {
    return SortedMap.from(await fetchRegion());
  }

  Future<SavedRegion> _thereIsARegionSaved() async {
    return SavedRegion(
      isSaved: await SessionManager().getFavoriteRegion(),
      index: await SessionManager().getIndexRegion(),
      name: await SessionManager().getNameRegion(),
    );
  }

  Future<List<dynamic>> _buildFuture() async {
    return await Future.wait([
      _buildRegion(),
      _thereIsARegionSaved(),
    ]);
  }

  Future _future;

  DateTime _now() => DateTime.now();
  String _formattedDate() => DateFormat.yMMMMEEEEd('it').format(_now());

  @override
  void initState() {
    super.initState();
    _backgroundColor = _defaultBackgroundColor;

    _future = _buildFuture();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: _future,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            Widget _child;

            if (snapshot.hasError) {
              _child = Text(snapshot.error);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              _child = SpinKitPulse(
                color: Colors.black,
              );
            } else {
              Map<String, List<Region>> _listRegions = snapshot.data[0];
              SavedRegion _thereIsARegionSaved = snapshot.data[1];

              final PageController _controller = PageController(
                initialPage: 0,
              );

              if (_thereIsARegionSaved.isSaved) {
                _toggleOpacityThirdPage = true;
                _backgroundColor = _listRegions.values
                    .elementAt(_thereIsARegionSaved.index)
                    .first
                    .color;
              }

              _child = AnimatedContainer(
                duration: kDuration,
                color: _backgroundColor,
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

                        _controller.nextPage(
                          duration: kDuration,
                          curve: kCurve,
                        );
                      },
                    ),
                    SecondPage(
                      toggleOpacity: _toggleOpacitySecondPage,
                      regions: _listRegions,
                      onPressedButton: (index) {
                        setState(() {
                          _toggleOpacitySecondPage = !_toggleOpacitySecondPage;

                          _selectedIndex = index;
                          _selectedRegion =
                              _listRegions.keys.elementAt(_selectedIndex);

                          _toggleOpacityThirdPage = !_toggleOpacityThirdPage;

                          _backgroundColor = _listRegions.values
                              .elementAt(_selectedIndex)
                              .first
                              .color;
                        });

                        _controller.nextPage(
                          duration: kDuration,
                          curve: kCurve,
                        );
                      },
                    ),
                    ThirdPage(
                      toggleOpacity: _toggleOpacityThirdPage,
                      onPressed: () async {
                        setState(() {
                          _backgroundColor = _defaultBackgroundColor;
                          _toggleOpacitySecondPage = !_toggleOpacitySecondPage;
                          _toggleOpacityThirdPage = !_toggleOpacityThirdPage;
                        });

                        _controller.previousPage(
                          duration: kDuration,
                          curve: kCurve,
                        );
                      },
                      date: _formattedDate(),
                      region:
                          _listRegions.values.elementAt(_selectedIndex).first,
                      nameRegion: _selectedRegion,
                    ),
                  ],
                ),
              );
            }

            return AnimatedSwitcher(
              child: _child,
              duration: kDuration,
            );
          },
        ),
      ),
    );
  }
}
