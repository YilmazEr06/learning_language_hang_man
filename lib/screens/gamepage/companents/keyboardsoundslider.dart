import 'package:flutter/material.dart';

class Keyboardsound extends StatefulWidget {
  const Keyboardsound({
    super.key,
  });

  @override
  State<Keyboardsound> createState() => SlidersoundState();
}

class SlidersoundState extends State<Keyboardsound> {
  late double slidervalue ;
  @override
  void initState() {
    slidervalue = 10;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.75,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFFFFF7D5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(64),
            bottomRight: Radius.circular(64),
            topLeft: Radius.circular(64),
            topRight: Radius.circular(64),
          ),
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
                left: 20,
                child: Image.asset("lib/assets/keyboard.png",
                fit: BoxFit.fill,
                height: 50,)),
            Positioned(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.60,
                child: Slider(
                  min: 0,
                  max: 100,
                  value: slidervalue,
                  onChanged: (value) {
                    setState(() {
                     slidervalue= value;
                    });
                    
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
