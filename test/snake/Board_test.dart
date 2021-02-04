import 'package:flutter_snake/snake/Board.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  group('Board', () {
    test('can be created', () {
      expect(() => Board(width: 10, height: 10), returnsNormally);
    });

    test('can generate food', () {
      final board = Board(width: 10, height: 10);
      expect(board.foodAmount, 0);
      board.generateFood(count: 10);
      expect(board.foodAmount, 10);
    });

    test('can detect food', () {
      final board = Board(width: 1, height: 1);
      expect(board.isFoodHere(x: 0, y: 0), false);
      board.generateFood(count: 1);
      expect(board.isFoodHere(x: 0, y: 0), true);
    });
  });
}
