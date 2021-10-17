// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_url_shortener/flutter_url_shortener.dart';

void main() {
  /// Setup token key before using
  FShort.instance.setup(token: 'a5xxx7a59eb1115b2dfdd3f0caa76d8cc592257d');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _shortenURL = '';
  String _customURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'https://www.google.com.vn',
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_shortenURL),
              height: 60,
            ),
            FlatButton(
              color: Colors.blue,
              child: Text('Shorten a link'),
              onPressed: () => _genShortenUrl,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_customURL),
              height: 60,
            ),
            FlatButton(
              color: Colors.blue,
              child: Text('Create a Bitlink'),
              onPressed: () => _createBitLink,
            ),
          ],
        ),
      ),
    );
  }

  void _genShortenUrl() {
    try {
      FShort.instance
          .generateShortenURL(longUrl: 'https://www.google.com.vn/')
          .then((value) {
        setState(() {
          _shortenURL = value.link!;
        });
      });
    } on BitlyException catch (_) {
      //
    } on Exception catch (_) {
      //
    }
  }

  void _createBitLink() {
    try {
      FShort.instance
          .createBitLink(
              params: BitlyParams(
        longUrl: "https://dev.bitly.com",
        domain: 'bit.ly',
        tags: ['ver1.1', 'ver1.2'],
        deeplinks: [
          DeeplinkParams(
            appId: 'com.hades.test',
            appUriPath: '/store?id=123456',
            installUrl:
                'https://play.google.com/store/apps/details?id=com.hades.test&hl=en_US',
            installType: 'promote_install',
          ),
        ],
      ))
          .then((value) {
        setState(() {
          _customURL = value.link!;
        });
      });
    } on BitlyException catch (_) {
      //
    } on Exception catch (_) {
      //
    }
  }
}
