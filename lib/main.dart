import 'package:checoloresono/common/constants.dart';
import 'package:flutter/material.dart';

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

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();

  final List<String> _regions = [
    'Abruzzo',
    'Basilicata',
    'Calabria',
    'Campania',
    'Emilia Romagna',
    'Friuli Venezia Giulia',
    'Lazio',
    'Liguria',
    'Lombardia',
    'Marche',
    'Molise',
    'Piemonte',
    'Puglia',
    'Sardegna',
    'Sicilia',
    'Toscana',
    'Trentino Alto Adige',
    'Umbria',
    'Valle d\'Aosta',
    'Veneto',
  ];

  int _selectedRegion = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              FirstPage(
                controller: _controller,
              ),
              Center(
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
                            onChanged: (region) {
                              setState(() {
                                _selectedRegion = region;
                              });
                            },
                            activeColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: kBorderRadius,
                            ),
                            title: Text(
                              _regions[index],
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
                        child: BlackButton(
                          onPressed: () {},
                          text: 'Bella zio',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
    this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kSpaceS),
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
              text: 'Seleziona la tua regione',
              onPressed: () {
                controller.nextPage(duration: kDuration, curve: kCurve);
              },
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
    this.text,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadius,
      ),
      color: Colors.black,
      icon: Icon(
        Icons.flag_rounded,
        color: Colors.white,
      ),
      label: Padding(
        padding: const EdgeInsets.all(kSpaceM),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.9,
            fontFamily: 'Plex',
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
