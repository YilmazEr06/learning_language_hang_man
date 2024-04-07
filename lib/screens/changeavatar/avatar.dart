import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/screens/settingsscreen/companents/appbar.dart';

class Changeavatar extends StatefulWidget {
  const Changeavatar({super.key, required this.refresh});
  final VoidCallback refresh;
  @override
  State<Changeavatar> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<Changeavatar>
    with TickerProviderStateMixin {
  double height = 10;
  double opacity = 0;

  late Animation _moveanimation;
  late AnimationController _controllermove;

  late Animation _opacityanimation;
  late AnimationController _controlleropacity;
  SwiperController controller = SwiperController();
  String currentavatar = "";
  @override
  void initState() {
    super.initState();
    _controllermove = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controllermove.addListener(() {
      setState(() {
        height = _moveanimation.value;
      });
    });

    _controlleropacity = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controlleropacity.addListener(() {
      setState(() {
        opacity = _opacityanimation.value;
      });
    });

    Data().getUserInfo().then((value) {
      setState(() {});
    });
    Timer(const Duration(milliseconds: 1), () {
      animate();
    });
  }

  void animate() {
    _moveanimation = _controllermove.drive(
      Tween<double>(
        begin: 10,
        end: 0,
      ),
    );
    _controllermove.reset();
    _controllermove.forward();

    _opacityanimation = _controlleropacity.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );
    _controlleropacity.reset();
    _controlleropacity.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controllermove.dispose();
    _controlleropacity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDDB9A),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Appbar(text: "avatar"),
                const SizedBox(
                  height: 30,
                ),
                Opacity(
                  opacity: opacity,
                  child: Column(
                    children: [
                      SizedBox(
                          width: 500,
                          height: 500,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                  "lib/assets/images/avatarlar/${(index + 1).toString()}.png");
                            },
                            itemCount: 6,
                            viewportFraction: 0.6,
                            scale: 0.5,
                            controller: controller,
                            onIndexChanged: (value) {
                              currentavatar = (value + 1).toString();
                            },
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Data()
                        .changeuseravatar(
                      currentavatar,
                    )
                        .then((value) {
                      widget.refresh();
                      Navigator.pop(context);
                    });
                  },
                  child: Image.asset("lib/assets/images/degistir.png"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Togglebuttons extends StatelessWidget {
  const Togglebuttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderColor: Colors.black,
      fillColor: Colors.grey,
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      selectedColor: Colors.white,
      borderRadius: BorderRadius.circular(15),
      onPressed: (int index) {},
      isSelected: const [true, false],
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Avatar',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Custom Hours',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
