import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: numbers.map((i) {
              return Expanded(
                child: SoundButton(
                  number: i,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  final int number;
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  SoundButton({this.number});

  void _playSound() {
    final player = AudioCache();
    player.play('note${this.number}.wav');
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: colors[this.number - 1],
      onPressed: () => this._playSound()
    );
  }
}
