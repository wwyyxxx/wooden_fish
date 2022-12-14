import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Wooden Fish'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0.0;
  bool _isClick = false;

  void _increment() {
    _isClick = true;
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  void _callBack() {
    if(!_isClick) return;
    _isClick = false;
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(seconds: 1),
                    onEnd: _callBack,
                    child: const Text(
                      '??????+1',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50),
                    ),
                  ),
                  InkWell(
                    onTap: _increment,
                    child: Image.asset('images/woodenfish.jpg',
                        width: 210, height: 210),
                  )
                ],
              ),
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
