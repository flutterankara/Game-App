import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'game.dart';

class Box extends SpriteComponent with HasGameRef<FlappyEmberGame> {
  Box({required Vector2 position})
      : super(position: position, size: initialSize);

  static Vector2 initialSize = Vector2.all(50);

  @override
  Future<void> onLoad() async {
    final boxImage = await Flame.images.load('boxes/box_blue.png');
    sprite = Sprite(boxImage);
    add(RectangleHitbox());
  }
}
