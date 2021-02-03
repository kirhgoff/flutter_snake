import 'dart:math';

class Snake {
  int _speedX = 0;
  int _speedY = 0;
  List<Point<int>> _body;

  int get length => _body.length;

  // Snake by default moves up
  Snake({int x, int y, int speedX = 0, int speedY = -1}) {
    if (speedX.abs() + speedY.abs() > 1) {
      throw Exception('Illegal speed: ($speedX, $speedY)');
    }

    _speedX = speedX;
    _speedY = speedY;
    _body = [Point(x, y)];
  }

  Point head() => _body.first;

  void grow({int x, int y}) {
    final head = this.head();
    if ((head.x - x).abs() + (head.y - y).abs() > 1) {
      throw Exception('Inappropriate growth cell ($x, $y) to grow from $head');
    }

    this._body.insert(0, Point(x, y));
  }

  bool belongs({int x, int y}) => _body.contains(Point(x, y));

  void move() {
    final newHead = Point(_body.first.x + _speedX, _body.first.y + _speedY);
    _body.insert(0, newHead);
    _body.removeLast();
  }

  @override
  String toString() {
    return 'Snake: speed=($_speedX, $_speedY), body: $_body';
  }

  // 0, -1  => -1, 0
  // 0, 1   => 1, 0
  // 1, 0   => 0, -1
  // -1, 0  => 0, 1
  void turnLeft() {
    if (_speedX == 0) {
      this._speedX = _speedY;
      this._speedY = 0;
    } else {
      this._speedY = - _speedX;
      this._speedX = 0;
    }
  }

  void turnRight() {
    if (_speedX == 0) {
      this._speedX = - _speedY;
      this._speedY = 0;
    } else {
      this._speedY = _speedX;
      this._speedX = 0;
    }
  }

}