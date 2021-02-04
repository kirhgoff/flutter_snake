import 'package:flutter_snake/snake/Snake.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  group('Snake', () {
    test('can be created', () {
      final snake = Snake(x: 5, y: 5);
      expect(snake.length, 1);
    });

    test('can be created only with horizontal or vertical speed', () {
      expect(() => Snake(x: 5, y: 5, speedX: 1, speedY: 1), throwsException);
      expect(() => Snake(x: 5, y: 5, speedX: 1, speedY: -1), throwsException);
      expect(() => Snake(x: 5, y: 5, speedX: 1, speedY: 0), returnsNormally);
      expect(() => Snake(x: 5, y: 5, speedX: 0, speedY: 1), returnsNormally);
    });

    test('can be created only with speed equal to 1', () {
      expect(() => Snake(x: 5, y: 5, speedX: 2, speedY: 0), throwsException);
      expect(() => Snake(x: 5, y: 5, speedX: 0, speedY: -2), throwsException);
      expect(() => Snake(x: 5, y: 5, speedX: 3, speedY: -2), throwsException);
    });

    test('has head', () {
      final snake = Snake(x: 5, y: 5);
      expect(snake.head(), Point(5, 5));
    });

    test('can grow', () {
      final snake = Snake(x: 5, y: 5);
      snake.grow(x: 4, y: 5);
      expect(snake.length, 2);
    });

    test('can\'t grow in wrong direction', () {
      final snake = Snake(x: 5, y: 5);
      expect(() => snake.grow(x: 4, y: 4), throwsException);
    });

    test('can test if point belongs to body', () {
      final snake = Snake(x: 5, y: 5);
      snake.grow(x: 4, y: 5);
      snake.grow(x: 4, y: 6);
      expect(snake.belongs(x: 4, y: 6), true);
      expect(snake.belongs(x: 4, y: 5), true);
      expect(snake.belongs(x: 5, y: 5), true);
      expect(snake.belongs(x: 6, y: 6), false);
    });

    test('can move', () {
      final snake = Snake(x: 5, y: 5);
      snake.grow(x: 5, y: 4);
      snake.move();
      expect(snake.belongs(x: 5, y: 3), true);
      expect(snake.belongs(x: 5, y: 4), true);
      expect(snake.belongs(x: 5, y: 5), false);
    });

    group('goLeft', () {
      test('from looking up', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 5, y: 4);
        snake.goLeft();
        snake.move();
        expect(snake.belongs(x: 4, y: 4), true);
        expect(snake.belongs(x: 5, y: 4), true);
        expect(snake.belongs(x: 5, y: 5), false);
        expect(snake.isAlive, true);
      });

      test('from looking down', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 5, y: 6);
        snake.goLeft();
        snake.move();
        expect(snake.belongs(x: 4, y: 6), true);
        expect(snake.belongs(x: 5, y: 6), true);
        expect(snake.belongs(x: 5, y: 5), false);
        expect(snake.isAlive, true);
      });

      test('from looking left', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 4, y: 5);
        snake.goLeft();
        snake.move();
        expect(snake.belongs(x: 3, y: 5), true);
        expect(snake.belongs(x: 4, y: 5), true);
        expect(snake.belongs(x: 5, y: 5), false);
        expect(snake.isAlive, true);
      });

      test('from looking right', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 6, y: 5);
        snake.goLeft();
        snake.move();
        expect(snake.isAlive, false);
      });
    });

    group('goRight', () {
      test('from looking up', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 5, y: 4);
        snake.goRight();
        snake.move();
        expect(snake.belongs(x: 6, y: 4), true);
        expect(snake.belongs(x: 6, y: 4), true);
        expect(snake.belongs(x: 5, y: 5), false);
        expect(snake.isAlive, true);
      });

      test('from looking down', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 5, y: 6);
        snake.goRight();
        snake.move();
        expect(snake.belongs(x: 6, y: 6), true);
        expect(snake.belongs(x: 5, y: 6), true);
        expect(snake.belongs(x: 5, y: 5), false);
        expect(snake.isAlive, true);
      });

      test('from looking left', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 4, y: 5);
        snake.goRight();
        snake.move();
        expect(snake.isAlive, false);
      });

      test('from looking right', () {
        final snake = Snake(x: 5, y: 5);
        snake.grow(x: 6, y: 5);
        snake.goRight();
        snake.move();
        expect(snake.belongs(x: 7, y: 5), true);
        expect(snake.belongs(x: 6, y: 5), true);
        expect(snake.belongs(x: 5, y: 5), false);
        expect(snake.isAlive, true);
      });
    });
  });
}