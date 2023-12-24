

class ProductConstants {
  static ProductConstants? _instace;
  static ProductConstants get instance {
    _instace ??= ProductConstants._init();
    return _instace!;
  }

  ProductConstants._init();

  final String appName = 'AppName';
  final String apiUrl = '';
  final  String backgroundSound = 'sounds/flp.mp3';
  final String jumpSound = 'sounds/jump.mp3';

}
