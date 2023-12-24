
import 'package:flutter/material.dart';

class StoreBar extends StatelessWidget {
  const StoreBar({
    super.key,
    this.name,
    this.price,
    this.image,
  });
  final String? image;
  final int? price;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: (){},
          child: Container(
            height: 175,
            width: double.infinity,
            //color: Colors.amber[500],
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black38,
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
                      style: TextStyle(fontSize: 35,fontFamily: "PixelFont",color: Colors.white),
                    ),
                    Center(
                      child: Text("${price.toString()}",
                          style: TextStyle(fontSize: 35,fontFamily: "PixelFont",color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
