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
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: 512),
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
                height: 4,
              ),
              RichText(
                text: TextSpan(
                  text: 'Attraverso la seguente piattaforma potrai ',
                  style: TextStyle(
                    fontFamily: 'Computer Modern',
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  children: [
                    TextSpan(
                      text:
                          'selezionare la tua regione per scoprire immediatemente a quale zona appartiene, e di conseguenza, quali sono le indicazioni che sei ',
                      style: TextStyle(
                        fontFamily: 'Computer Modern',
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    TextSpan(
                      text: 'tenuto ',
                      style: TextStyle(
                        fontFamily: 'Computer Modern',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.8,
                        color: Colors.grey[700],
                      ),
                    ),
                    TextSpan(
                      text: 'a rispettare',
                      style: TextStyle(
                        fontFamily: 'Computer Modern',
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.black,
                icon: Icon(
                  Icons.flag_rounded,
                  color: Colors.white,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Seleziona la regione'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.9,
                      fontFamily: 'Plex',
                    ),
                  ),
                ),
                onPressed: () {},
              ),
              Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Made with love by ',
                  style: TextStyle(
                    fontFamily: 'Plex',
                    fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
