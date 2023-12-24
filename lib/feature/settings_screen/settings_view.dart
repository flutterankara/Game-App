import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/layout_constants.dart';
import 'settings_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  AudioPlayer audioPlayer = AudioPlayer();
  String backgroundSound = 'sounds/flp.mp3';
  String jumpSound = 'sounds/jump.mp3';
  bool isPlaying = true;
  bool isClickedSound = true;
  Color textColor = Colors.white;
  Color buttonColor = Colors.white;
  Color buttonTextColor = Colors.blue;
  Color containerColor = Colors.blue;
  Color activeButtonColor = Colors.white;
  Color inactiveButtonColor = Colors.grey;

  final Uri _url = Uri.parse('https://google.com');

  @override
  void initState() {
    super.initState();
    initBackgroundMusic();
  }

  Future initBackgroundMusic() async {
    await audioPlayer.setSourceAsset(backgroundSound);
    await audioPlayer.play(AssetSource(backgroundSound));
    await audioPlayer.setReleaseMode(ReleaseMode.loop);
    setState(() {});
  }

  Future initJumpMusic() async {
    await audioPlayer.setSourceAsset(jumpSound);
    await audioPlayer.play(AssetSource(jumpSound));
    setState(() {});
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Sayfayı Bulamadım $_url');
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(), builder: builder);
  }

  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.width / 1.4,
            height: context.height / 1.4,
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  LayoutConstants.midEmptyHeight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'AYARLAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.cancel_presentation_outlined,
                          color: Colors.white,
                          size: 45,
                        ),
                        onPressed: viewModel.returnBack,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.transit_enterexit_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                        hintText: 'Oyuncu',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                isPlaying
                                    ? Icons.music_note_outlined
                                    : Icons.music_off,
                                color: isPlaying
                                    ? activeButtonColor
                                    : inactiveButtonColor,
                                size: 60,
                              ),
                              onPressed: () async {
                                setState(() {
                                  if (isPlaying) {
                                    isPlaying = false;
                                    // audioPlayer.dispose();
                                    audioPlayer.pause();
                                  } else {
                                    isPlaying = true;
                                    audioPlayer
                                        .play(AssetSource(backgroundSound));

                                    initBackgroundMusic();
                                  }
                                });
                              },
                            ),
                            Text(
                              'Müzik',
                              style: TextStyle(
                                fontSize: 25,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                isClickedSound
                                    ? Icons.volume_up_outlined
                                    : Icons.volume_off_outlined,
                                color: isClickedSound
                                    ? activeButtonColor
                                    : inactiveButtonColor,
                                size: 60,
                              ),
                              onPressed: () async {
                                setState(() {
                                  if (isClickedSound) {
                                    isClickedSound = false;

                                    // audioPlayer.pause();
                                  } else {
                                    isClickedSound = true;
                                    // audioPlayer.play(AssetSource(jumpSound));
                                    // initJumpMusic();
                                  }
                                });
                              },
                            ),
                            Text(
                              'Sesi Aç',
                              style: TextStyle(
                                fontSize: 25,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => buttonColor,
                      ),
                    ),
                    onPressed: _launchUrl,
                    child: Text(
                      'Gizlilik Politikası',
                      style: TextStyle(
                        color: buttonTextColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => buttonColor,
                      ),
                    ),
                    onPressed: _launchUrl,
                    child: Text(
                      'Destek',
                      style: TextStyle(
                        color: buttonTextColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
  #benim paketler
  audioplayers: ^5.2.1
  url_launcher: ^6.2.2
    - assets/sounds/flp.mp3
*/
