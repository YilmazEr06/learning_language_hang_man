import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({
    super.key, 
    required this.data,
  });
 final List data;
  @override
  Widget build(BuildContext context) {
    print(data[0]);
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
          child:  Stack(
            children: [
              Positioned(
                  top: 65,
                  left: 10,
                  child: Text(
                    (data[0][0]as String).toUpperCase(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 95,
                  left: 12,
                  child: Text(
                    data[0][1]["topwordcount"].toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 254, 11, 11)),
                  )),
              const Positioned(
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
                    "${data[0][1]["levelcounts"]} seviye mevcut",
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
Padding head(String head,bool iscurrent) {
  double width = 0;
  if (head.length.toDouble() * 15 < 100) {
    width = 100;
  } else {
    width = head.length.toDouble() * 18;
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 45,
      width: width,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: iscurrent? Colors.amber: Colors.grey,
          ),
          child: Center(
              child: Text(
            head,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ))),
    ),
  );
}
