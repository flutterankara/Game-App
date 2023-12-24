enum DashType {
  dancer('DancerFlutBirdG.png', 16),
  evil('EvilFlutBirdG.png', 16),
  retro('RetroFlutBirdG.png', 155),
  tw('TwilightBirdG.png', 16),
  white('WhitePrensBirdG.png', 16);

  const DashType(this.asset, this.size);
  final String? asset;
  final num size;
}
