import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  AssetImage one = new AssetImage('images/one.png');
  AssetImage two = new AssetImage('images/two.png');
  AssetImage three = new AssetImage('images/three.png');
  AssetImage four = new AssetImage('images/four.png');
  AssetImage five = new AssetImage('images/five.png');
  AssetImage six = new AssetImage('images/six.png');

  AudioCache audioCache = new AudioCache();
  AudioPlayer advancedPlayer = new AudioPlayer();

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("dice.wav");
}
Timer _timer;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  AssetImage homepage1, homepage2;
  @override
  void initstate() {
    super.initState();
    setState(() {
      homepage1 = one;
      homepage2 = one;
    });
  }

  // Method for changing the images
  // ignore: non_constant_identifier_names
  void DiceChanger(){
    _timer = new Timer(const Duration(milliseconds: 1500), () {
    int random=(1+Random().nextInt(6));
    // ignore: non_constant_identifier_names
    int AnotherRandom=(1+Random().nextInt(6));
    AssetImage firstImage,secondImage;
    switch(random){
      case 1: firstImage=one; break;
      case 2: firstImage=two; break;
      case 3: firstImage=three; break;
      case 4: firstImage=four; break;
      case 5: firstImage=five; break;
      case 6: firstImage=six; break;
    }
    switch(AnotherRandom){
      case 1: secondImage=one; break;
      case 2: secondImage=two; break;
      case 3: secondImage=three; break;
      case 4: secondImage=four; break;
      case 5: secondImage=five; break;
      case 6: secondImage=six; break;
    }
  //   DiceChanger() {
    
  //     setState(() {
  //       _logoStyle = FlutterLogoStyle.horizontal;
  //     });
    
  // }
    setState(() {
      homepage1=firstImage;
      homepage2=secondImage;
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5D76E),
      appBar: AppBar(
        title: Text("Dice Roller"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row for the images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      image: homepage1,
                      width: 128,
                      height: 128,
                    )
                  ],
                ),SizedBox(width: 10,),
                Column(
                  children: [
                    Image(
                      image: homepage2,
                      width: 128,
                      height: 128,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Row for the button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Color(0xFFE2B13C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Text("Press me"),
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),onPressed: (){DiceChanger();audioCache.play('dice.wav');},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color(0xFFF5D76E),
  //     appBar: AppBar(
  //       title: Text("Dice Roller"),
  //     ),
  //     body: Container(
  //       margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //       child: ,
  //     )
  //   );
  // }
}
