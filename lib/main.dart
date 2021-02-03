import 'package:flutter/material.dart';

void main() {
  runApp(SnakeApp());
}

class SnakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snakey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameScreenWidget(title: 'Snakey'),
    );
  }
}

class GameScreenWidget extends StatefulWidget {
  GameScreenWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GameScreenWidgetState createState() => _GameScreenWidgetState();
}



class _GameScreenWidgetState extends State<GameScreenWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _gridView(BuildContext context) {
    return GridView.count(
        crossAxisCount: 10,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: List.generate(100, (index) {
          final odd = index % 2 == 0;
          final color = odd ? Colors.purple : Colors.amber;
          return _makeCell(index, context, color);
      }),
    );
  }

  Widget _makeCell(int index, BuildContext context, MaterialColor color) {
    return Container(
      width: 10,
      height: 10,
      color: color,
      child: Center(
        child: Text(
          '$index',
          style: Theme.of(context).textTheme.headline5,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            child: _gridView(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
