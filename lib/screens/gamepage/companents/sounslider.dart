import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Slidersound extends StatefulWidget {
  const Slidersound({
    super.key,
  });

  @override
  State<Slidersound> createState() => SlidersoundState();
}

class SlidersoundState extends State<Slidersound> {
  late double slidersoundvalue;
  @override
  void initState() {
    slidersoundvalue = 10;
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
                left: 20, child: SvgPicture.asset("lib/assets/images/headphones.svg")),
            Positioned(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.60,
                child: Slider(
                  min: 0,
                  max: 100,
                  value: slidersoundvalue,
                  onChanged: (value) {
                    setState(() {
                      slidersoundvalue = value;
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
