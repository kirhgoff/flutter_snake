import 'package:flutter/material.dart';
import 'package:flutter_snake/snake/Snake.dart';

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
  int width = 10;
  int height = 10;
  Snake _snake = Snake(x: 5, y: 5);

  void _leftPressed() => setState(() { _snake.goLeft(); });
  void _rightPressed() => setState(() { _snake.goRight(); });
  void _upPressed() => setState(() { _snake.goUp(); });
  void _downPressed() => setState(() { _snake.goDown(); });
  void _spacePressed() => setState(() { _snake.move(); });

  Widget _gridView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 3.0),
      ),
      child: SizedBox(
        width: 400,
        height: 350,
        child: GridView.count(
            crossAxisCount: 10,
            padding: const EdgeInsets.all(0),
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: _makeCells(context),
        ),
      ),
    );
  }

  List<Widget> _makeCells(BuildContext context) {
    return List.generate(100, (index) => _makeCell(index, context));
  }

  Widget _makeCell(int index, BuildContext context) {
    final x = index % width;
    final y = index ~/ width;

    final snakeBody = _snake.belongs(x: x, y: y);
    final color = snakeBody ? (_snake.isAlive ? Colors.purple : Colors.black) : Colors.amber;

    return Container(color: color);
  }

  Widget _controlView(BuildContext context) {
    return Center(
      child: Row(
        children: [
          _makeButton(Icons.keyboard_arrow_left, _leftPressed),
          Column(
            children: [
              _makeButton(Icons.keyboard_arrow_up, _upPressed),
              _makeButton(Icons.keyboard_arrow_down, _downPressed),
            ]
          ),
          _makeButton(Icons.keyboard_arrow_right, _rightPressed),
          _makeButton(Icons.space_bar, _spacePressed),
        ],
      ),
    );
  }

  Widget _makeButton(IconData data, Function() handler) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 3.0),
            color: Colors.brown,
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
        ),
        child: Center(
            child: IconButton(icon: Icon(data), onPressed: handler)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _gridView(context),
          _controlView(context),
        ],
      ),
    );
  }
}
