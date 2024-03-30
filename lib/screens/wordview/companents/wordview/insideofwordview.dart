import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hang_man/models/word.dart';

class Insideofwordview extends StatefulWidget {
  const Insideofwordview({
    super.key,
    required this.words,
    required this.controllerswiper,
    required this.controllercountdown,
  });
  final List<WordModel> words;
  final CardSwiperController controllerswiper;
  final CountDownController controllercountdown;
  @override
  State<Insideofwordview> createState() => InsideofwordviewState();
}

class InsideofwordviewState extends State<Insideofwordview> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color.fromARGB(0, 33, 149, 243),
      child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SizedBox(
              height: screenHeight * 0.6,
              child: Column(
                children: [
                  Flexible(
                      child: CardSwiper(
                    controller: widget.controllerswiper,
                    cardsCount: widget.words.length,
                    allowedSwipeDirection:
                        const AllowedSwipeDirection.only(left: true, right: true),
                    isLoop: false,
                    initialIndex: 0,
                    onSwipe: (previousIndex, currentIndex, direction) {
                      widget.controllercountdown.reset();
                      return true;
                    },
                    onEnd: () {
                      Navigator.pushReplacementNamed(context, '/gamepage',
                          arguments: widget.words);
                    },
                    cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) {
                      return Center(
                        child: Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 191, 212, 208),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                widget.words[index].name.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 50, fontFamily: "akayakanadaka"),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  widget.words[index].description.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 30, fontFamily: "akayakanadaka"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ],
              ))),
    );
  }
}
