import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              createKey(Colors.red, 1),
              createKey(Colors.orange, 2),
              createKey(Colors.yellow, 3),
              createKey(Colors.green, 4),
              createKey(Colors.teal, 5),
              createKey(Colors.blue, 6),
              createKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}

playSound(int soundNumber) {
  final player = AudioPlayer();
  player.setVolume(1);
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await player.play(AssetSource('note$soundNumber.wav'));
  });

}

Widget createKey(color, int soundNumber) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: () {
        playSound(soundNumber);
      },
      child: const Text(' '),
    ),
  );
}

