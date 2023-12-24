import 'package:flutter/material.dart';
import 'package:gameapp/feature/store/StoreBar.dart';
import 'package:gameapp/product/enums/dash_type.dart';
import 'package:gameapp/product/utils/google_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class StoreMainWidget extends StatefulWidget {
  const StoreMainWidget({super.key});

  @override
  State<StoreMainWidget> createState() => _StoreMainWidgetState();
}

class _StoreMainWidgetState extends State<StoreMainWidget> {
  GoogleAds googleAds = GoogleAds();
  bool ilkKez = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[500],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("STORE",
            style: TextStyle(color: Colors.white, fontFamily: "PixelFont",fontSize: 60)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          if (googleAds.bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child :SafeArea(child: SizedBox(
                width: 320.0,
                height: 50,
                child: AdWidget(ad: googleAds.bannerAd!),
              ),
              ),
            ),
            Row(children: [const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
          child: Image(image: AssetImage("assets/png/store/flutcoin.png"),width: 75)),
          const Text("300",style: TextStyle(fontSize: 50,color: Colors.white,fontFamily: "PixelFont"),),
          Padding(
            padding: const EdgeInsets.only(left:80.0),
            child: TextButton(onPressed:(){
                if(ilkKez){
                  googleAds.loadRewardedAd();
                  googleAds.showRewardedAd();
                  ilkKez = false;
                }else if(!ilkKez){
                  Duration otuzsaniye = const Duration(seconds: 30);
                  Future.delayed(otuzsaniye,(){
                    ilkKez = true;
                  });

                }


            },child: const Text("Ad", style: TextStyle(fontFamily: "PixelFont",color: Colors.white,fontSize: 50),)),
          )

        ],),
          const StoreBar(image: "ClassicFlutBird.png",name: "Classic\nFlutBird",price: 500),
          const StoreBar(image: "RetroFlutBird.png",name: "Retro\nFlutBird",price: 500, dashType: DashType.retro,),
          const StoreBar(image: "DancerFlutBird.png",name: "Dancer\nFlutBird",price: 500, dashType: DashType.dancer,),
          const StoreBar(image: "WhitePrensFlutBird.png",name: "Soul\nFlutBird",price: 750, dashType: DashType.white,),
          const StoreBar(image: "TwilightFlutBird.png",name: "Twilight\nFlutBird",price: 750, dashType: DashType.tw,),
          const StoreBar(image: "EvilFlutBird.png",name: "Evil\nFlutBird",price: 1000, dashType: DashType.evil,),


        ]),
      ) ,
    );
  }
}
