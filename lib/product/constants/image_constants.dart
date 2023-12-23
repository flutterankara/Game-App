// ignore_for_file: unused_element

class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    _instace ??= ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  final lottieAssets = _Lottie();
  final svgAssets = _SVG();

  final String flutterDash = 'png/flutter_dash'.toPNG;
  //final String example = 'png/example'.toPNG;
}

class _SVG {
  //final String example = 'svg/example'.toSVG;
}

class _Lottie {
  // final String example = 'lottie/example'.toJSON;
}

extension _ImageConstantsExtension on String {
  String get toPNG => 'assets/$this.png';
  String get toJPEG => 'assets/$this.jpeg';
  String get toJSON => 'assets/$this.json';
  String get toSVG => 'assets/$this.svg';
  String get toJPG => 'assets/$this.jpg';
}
