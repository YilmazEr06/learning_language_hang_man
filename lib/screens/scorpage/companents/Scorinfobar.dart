import 'package:flutter/material.dart';

class ScorInfoBar extends StatelessWidget {
  const ScorInfoBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double imagetop = 20;
    double screenhight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Hero(
          tag: "hero-tag",
          child: // Figma Flutter Generator Group12Widget - GROUP
              SizedBox(
                  width: 381,
                  height: 64,
                  child: Stack(alignment: Alignment.center, children: <Widget>[
                    Positioned(
                        top: 0,
                        left: screenwidth - 90,
                        child: Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 247, 213, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(64, 64)),
                            ))),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 247, 213, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(64, 64)),
                            ))),
                    Positioned(
                        top: 0,
                        left: 37,
                        child: Container(
                            alignment: Alignment.center,
                            width: screenwidth * 0.75,
                            height: screenhight * 0.1,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 247, 213, 1),
                            ))),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 350,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam1.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 350,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam1.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 325,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam2.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 325,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam2.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 130,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam4.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 130,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam4.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 100,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam3.png")),
                    ),
                    Positioned(
                      top: imagetop,
                      left: screenwidth - 100,
                      child: const Image(
                          height: 35,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/adam3.png")),
                    ),
                    const Positioned(
                      child: Image(
                          height: 50,
                          fit: BoxFit.fill,
                          image: AssetImage("lib/assets/skor.png")),
                    ),
                  ]))),
    );
  }
}
