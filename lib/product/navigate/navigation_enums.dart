enum NavEnums {
  init,
  menu,
  gameplay;

  String get rawValue => switch (this) { _ => '/$name' };
}

extension StringExtension on String {
  NavEnums get navValue {
    if (this == '/') return NavEnums.init;
    return NavEnums.values.firstWhere(
      (element) => element.name == split('/').last,
      orElse: () => NavEnums.init,
    );
  }
}
