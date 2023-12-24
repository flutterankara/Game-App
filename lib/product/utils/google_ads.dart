

import 'dart:ui';

import 'package:gameapp/core/constants/string_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds{
  bool isInterstitialShown = false;
  int skor = 0;
  InterstitialAd? intelstitialAd;    // reklamı bu değişkene saklayacak
  BannerAd? bannerAd;
  RewardedAd? rewardedAd;
  void loadIntersititialAd({bool showAfterLoad = false}) { //showAfterLoad true olursa reklam yüklenir yüklenmez gösterilir
    InterstitialAd.load(
        adUnitId: AdStrings.interstitalAd1, //reklamların idsi
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) { //reklam yüklendiğinde
            intelstitialAd = ad;
            if(showAfterLoad){
              showInterstitialAd();//eğer bu değer true ise fonksiyonu çağır

            }
          },
          onAdFailedToLoad: (LoadAdError error) {//reklam yüklenemediğinde

          },
        ));
  }

  void showInterstitialAd(){//eğer reklam varsa null değerinde değilse direkt göstersin
    if(intelstitialAd != null){
      intelstitialAd!.show();

    }

  }

  void loadBannerAd({required VoidCallback adLoaded}) {
    bannerAd = BannerAd(
      adUnitId: AdStrings.bannerAd1,
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd; // ad değişkenini BannerAd olarak değiştir
          adLoaded();

        },
        onAdFailedToLoad: (ad, err) {

          ad.dispose();
        },
      ),
    )..load();
  }



  void loadRewardAd({bool showAfterLoad = false}) {
    RewardedAd.load(
        adUnitId: AdStrings.rewardedAd1,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            if(showAfterLoad){
              showRewardedAd();
            }

            rewardedAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
          },
        ));
  }

  void loadRewardedAd(){
    RewardedAd.load(
        adUnitId: AdStrings.rewardedAd1,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
              rewardedAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error){
              //loadRewardedAd();

            }
        )
    );
  }

  void showRewardedAd(){
    rewardedAd!.show( //ödüllendirilmiş reklamı göstermeye yarayan şey
      onUserEarnedReward: (AdWithoutView ad, RewardItem rpoint) { //ödül  kazanılması durumunda çalışacak olan kısım
        print("Kullanıcı puan kazandı ${rpoint.amount}");
      },
    );

    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad){//Tam ekran reklam içeriği gösterildiğinde çağrılan fonksiyon.

        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad,AdError error){ //Tam ekran reklam içeriğinin gösterilememesi durumunda çağrılan fonksiyon. Burada reklam nesnesi dispose edilerek temizleniyor.
          ad.dispose();
        },
        onAdDismissedFullScreenContent: (RewardedAd ad){ //Tam ekran reklam içeriği kapatıldığında çağrılan fonksiyon. Yine reklam nesnesi dispose edilerek temizleniyor.
          ad.dispose();
        },
        onAdImpression: (RewardedAd ad) => print("$ad izlendi.") //Reklamın izlenme durumuyla ilgili olarak çağrılan fonksiyon.
    );

  }
}