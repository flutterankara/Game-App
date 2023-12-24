import 'package:flutter/material.dart';
import 'package:gameapp/product/enums/dash_type.dart';
import 'package:gameapp/product/providers/general_provider.dart';
import 'package:provider/provider.dart';

class StoreBar extends StatelessWidget {
  const StoreBar({
    super.key,
    this.name,
    this.price,
    this.image,
    this.dashType,
  });
  final String? image;
  final int? price;
  final String? name;
  final DashType? dashType;

  @override
  Widget build(BuildContext context) {
    var currentDashType = context.read<GeneralProvider>().dashType;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            context.read<GeneralProvider>().dashType = dashType;
            print('change dash type');
          },
          child: Container(
            height: 175,
            width: double.infinity,
            //color: Colors.amber[500],
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: context.watch<GeneralProvider>().dashType == dashType ? Colors.red : Colors.black38,
                  width: 5,
                ),
                color: Colors.amber[400]),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      image: AssetImage(
                        "assets/png/store/$image",
                      ),
                      width: 150),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$name",
                      style: const TextStyle(fontSize: 35, fontFamily: "PixelFont", color: Colors.white),
                    ),
                    Center(
                      child: Text(price.toString(),
                          style: const TextStyle(fontSize: 35, fontFamily: "PixelFont", color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
