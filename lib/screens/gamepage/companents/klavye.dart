
import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  const buttons({
    super.key, required this.passedbuttons,
  });
  
  final void Function(String) passedbuttons;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          button(text: "Q",passedbuttons: passedbuttons),
          button(text: "W",passedbuttons: passedbuttons),
          button(text: "E",passedbuttons: passedbuttons),
          button(text: "R",passedbuttons: passedbuttons),
          button(text: "T",passedbuttons: passedbuttons),
          button(text: "Y",passedbuttons: passedbuttons),
          button(text: "U",passedbuttons: passedbuttons),
          button(text: "I",passedbuttons: passedbuttons),
          button(text: "O",passedbuttons: passedbuttons),
          button(text: "P",passedbuttons: passedbuttons),
          button(text: "Ğ",passedbuttons: passedbuttons),
          button(text: "Ü",passedbuttons: passedbuttons),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          button(text: "A",passedbuttons: passedbuttons),
          button(text: "S",passedbuttons: passedbuttons),
          button(text: "D",passedbuttons: passedbuttons),
          button(text: "F",passedbuttons: passedbuttons),
          button(text: "G",passedbuttons: passedbuttons),
          button(text: "H",passedbuttons: passedbuttons),
          button(text: "J",passedbuttons: passedbuttons),
          button(text: "K",passedbuttons: passedbuttons),
          button(text: "L",passedbuttons: passedbuttons),
          button(text: "Ş",passedbuttons: passedbuttons),
          button(text: "İ",passedbuttons: passedbuttons),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          button(text: "Z",passedbuttons: passedbuttons),
          button(text: "X",passedbuttons: passedbuttons),
          button(text: "C",passedbuttons: passedbuttons),
          button(text: "V",passedbuttons: passedbuttons),
          button(text: "B",passedbuttons: passedbuttons),
          button(text: "N",passedbuttons: passedbuttons),
          button(text: "M",passedbuttons: passedbuttons),
          button(text: "Ö",passedbuttons: passedbuttons),
          button(text: "Ç",passedbuttons: passedbuttons),
        ]),
      ],
    );
  }
}

class button extends StatefulWidget {
  const button({
    super.key,
    required this.text, 
    required this.passedbuttons,
  });
  
  final String text;
final void Function(String) passedbuttons;
  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  bool passed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5),
      child: SizedBox(
        height: 46,
        width: 29,
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.passedbuttons(widget.text.toLowerCase());
              passed = true;
            });
            
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:!passed? Color.fromARGB(255, 170, 167, 166):Color.fromARGB(255, 120, 119, 118)),
              child: Center(child: Text(widget.text))),
        ),
      ),
    );
  }
}