import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class sayac extends StatelessWidget {
  const sayac({
    super.key,
    required CountDownController controller,
    required this.controllerswiper,
  }) : _controller = controller;

  final CountDownController _controller;
  final CardSwiperController controllerswiper;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        height: 100,
        color: const Color.fromARGB(0, 0, 0, 0),
        child: CircularCountDownTimer(
          duration: 10,
          initialDuration: 0,
          controller: _controller,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: const Color.fromARGB(255, 240, 240, 240),
          fillGradient: null,
          backgroundColor: const Color.fromARGB(90, 155, 39, 176),
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: const TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: false,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
            _controller.start();
            controllerswiper.swipe(CardSwiperDirection.left);
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            return Function.apply(defaultFormatterFunction, [duration]);
          },
        ),
      ),
    );
  }
}
