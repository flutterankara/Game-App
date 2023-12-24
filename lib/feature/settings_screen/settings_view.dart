import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/core/extension/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/layout_constants.dart';
import '../../core/services/navigation_service.dart';
import '../../product/constants/product_constants.dart';
import '../../product/providers/general_provider.dart';
import 'settings_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Sayfayı Bulamadım $_url');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(viewModelBuilder: () => SettingsViewModel(), builder: builder);
  }

  Widget builder(BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return Center(
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    readOnly: true,
                    enabled: false,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.transit_enterexit_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      hintText: context.read<GeneralProvider>().user?.username ?? 'username',
                      hintStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      labelStyle: const TextStyle(
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
                              isPlaying ? Icons.music_note_outlined : Icons.music_off,
                              color: isPlaying ? activeButtonColor : inactiveButtonColor,
                              size: 60,
                            ),
                            onPressed: () async {
                              setState(() {
                                if (isPlaying) {
                                  isPlaying = false;
                                  // audioPlayer.dispose();
                                  ns.context.read<GeneralProvider>().audioPlayer.pause();
                                } else {
                                  isPlaying = true;
                                  ns.context
                                      .read<GeneralProvider>()
                                      .audioPlayer
                                      .play(AssetSource(ProductConstants.instance.backgroundSound));

                                  // initBackgroundMusic();
                                }
                              });
                            },
                          ),
                          LayoutConstants.midEmptyHeight,
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
                              isClickedSound ? Icons.volume_up_outlined : Icons.volume_off_outlined,
                              color: isClickedSound ? activeButtonColor : inactiveButtonColor,
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
                          LayoutConstants.midEmptyHeight,
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
    );
  }
}

/*
  #benim paketler
  audioplayers: ^5.2.1
  url_launcher: ^6.2.2
    - assets/sounds/flp.mp3
*/
