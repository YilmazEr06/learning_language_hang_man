import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/selectCatagorypage');
                },
                child: const Image(image: AssetImage("lib/assets/start.png"))),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/scorpage');
                },
                child:
                    const Image(image: AssetImage("lib/assets/skortable.png")))
          ],
        )),
      ],
    );
  }
}