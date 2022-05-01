import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zodiac demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  get onWillAccept => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Draggable(
              data: 85,
              child: Container(
                width: 100.0,
                height: 100.0,
                child: const Center(
                  child: Text(
                    "5",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                color: Colors.pink,
              ),
              feedback: Container(
                width: 100.0,
                height: 100.0,
                child: const Center(
                  child: Text(
                    '?',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                color: Colors.pink,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                  child: DragTarget(
                    builder: (context, condidate, rejected) {
                      return Center(
                          child: Text(
                        "$_counter",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ));
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (int data) {
                      setState(() {
                        _counter++;
                      });
                    },
                  ),
                ),
                Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.deepPurple,
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        return const Center(
                            child: Text(
                          "Odd",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ));
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (int data) {},
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
