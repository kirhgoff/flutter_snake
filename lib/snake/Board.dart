import 'dart:math';

class Board {
  int _width;
  int _height;
  int get width => _width;
  int get height => _height;

  List<Point<int>> _food;
  int get foodAmount => _food.length;

  Board({int width, int height}) {
    _width = width;
    _height = height;
    _food = [];
  }

  bool isFoodHere({ int x, int y }) {
    return _food.contains(Point(x, y));
  }

  void generateFood({ int count }) {
    if (count > _width * _height) {
      throw Exception('Cannot create $count food pieces - too much');
    }

    var counter = 0;
    final random = new Random();
    while(this.foodAmount < count) {
      if (counter > 666) {
        throw Exception('Breaking infinite loop');
      }

      final x = random.nextInt(_width);
      final y = random.nextInt(_height);
      final point = Point(x, y);
      if (!_food.contains(point)) {
        _food.add(point);
      }
    }
  }
}