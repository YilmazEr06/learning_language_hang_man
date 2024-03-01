import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: SizedBox(
        height: 175,
        width: 175,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("lib/assets/math.png"), fit: BoxFit.fill)),
          child: const Stack(
            children: [
              Positioned(
                  top: 65,
                  left: 10,
                  child: Text(
                    "Matematik",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 95,
                  left: 12,
                  child: Text(
                    "1500 kelime",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 254, 11, 11)),
                  )),
              Positioned(
                  top: 110,
                  left: 10,
                  child: Text(
                    "%50 tamamlandı",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 1, 1)),
                  )),
              Positioned(
                  top: 125,
                  left: 10,
                  child: Text(
                    "3 seviye mevcut",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 8, 8)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}