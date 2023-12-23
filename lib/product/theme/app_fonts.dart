enum AppFonts { poppins, notosans, mansory, montserrat }

extension AppFontsExtension on AppFonts {
  String get name {
    switch (this) {
      case AppFonts.poppins:
        return 'Poppins';
      case AppFonts.notosans:
        return 'NotoSans';
      case AppFonts.mansory:
        return 'Mansory';
      case AppFonts.montserrat:
        return 'Montserrat';
    }
  }
}
