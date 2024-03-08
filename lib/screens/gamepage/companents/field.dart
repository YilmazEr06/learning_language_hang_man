import 'package:flutter/material.dart';

class field extends StatefulWidget {
  const field({
    super.key,
    required this.x,
    required this.size,
    required this.visible,
  });
  final size;
  final String x;
  final bool visible;

  @override
  State<field> createState() => _fieldState();
}

class _fieldState extends State<field> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 50,
        width: widget.size * 2,
        child: Container(
          color: Color.fromARGB(163, 255, 193, 7),
          child: Center(
              child: Column(
            children: [
              Text(
                
                widget.x,
                style: TextStyle(
                  fontSize: widget.size, 
                  fontWeight: FontWeight.bold,
                  color: widget.visible?const Color.fromARGB(0, 0, 0, 0):Colors.black),

              ),
              Image.asset(
                "lib/assets/underline.png",
                fit: BoxFit.fill,
                scale: 1,
              )
            ],
          )),
        ),
      ),
    );
  }
}
