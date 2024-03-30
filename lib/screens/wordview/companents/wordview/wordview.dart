import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/wordview/companents/wordview/insideofwordview.dart';

class Wordview extends StatefulWidget {
  const Wordview(
      {super.key,
      required this.arguments,
      required this.controllerswiper,
      required this.controllercountdown});

  final List arguments;
  final CardSwiperController controllerswiper;
  final CountDownController controllercountdown;

  @override
  State<Wordview> createState() => _WordviewState();
}

class _WordviewState extends State<Wordview> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Data().getwords(widget.arguments[0], widget.arguments[1], widget.arguments[2]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<WordModel> words = [];
          for (var i in snapshot.data!) {
            words
                .add(WordModel(name: i["name"], description: i["description"]));
          }
          return Insideofwordview(
            words: words,
            controllerswiper: widget.controllerswiper,
            controllercountdown: widget.controllercountdown,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
