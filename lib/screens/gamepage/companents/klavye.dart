import 'package:flutter/material.dart';

class Klavye extends StatelessWidget {
  const Klavye({
    super.key,
    required this.passedbuttons,
  });

  final void Function(String) passedbuttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Button(text: "Q", passedbuttons: passedbuttons),
          Button(text: "W", passedbuttons: passedbuttons),
          Button(text: "E", passedbuttons: passedbuttons),
          Button(text: "R", passedbuttons: passedbuttons),
          Button(text: "T", passedbuttons: passedbuttons),
          Button(text: "Y", passedbuttons: passedbuttons),
          Button(text: "U", passedbuttons: passedbuttons),
          Button(text: "I", passedbuttons: passedbuttons),
          Button(text: "O", passedbuttons: passedbuttons),
          Button(text: "P", passedbuttons: passedbuttons),
          Button(text: "Ğ", passedbuttons: passedbuttons),
          Button(text: "Ü", passedbuttons: passedbuttons),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Button(text: "A", passedbuttons: passedbuttons),
          Button(text: "S", passedbuttons: passedbuttons),
          Button(text: "D", passedbuttons: passedbuttons),
          Button(text: "F", passedbuttons: passedbuttons),
          Button(text: "G", passedbuttons: passedbuttons),
          Button(text: "H", passedbuttons: passedbuttons),
          Button(text: "J", passedbuttons: passedbuttons),
          Button(text: "K", passedbuttons: passedbuttons),
          Button(text: "L", passedbuttons: passedbuttons),
          Button(text: "Ş", passedbuttons: passedbuttons),
          Button(text: "İ", passedbuttons: passedbuttons),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Button(text: "Z", passedbuttons: passedbuttons),
          Button(text: "X", passedbuttons: passedbuttons),
          Button(text: "C", passedbuttons: passedbuttons),
          Button(text: "V", passedbuttons: passedbuttons),
          Button(text: "B", passedbuttons: passedbuttons),
          Button(text: "N", passedbuttons: passedbuttons),
          Button(text: "M", passedbuttons: passedbuttons),
          Button(text: "Ö", passedbuttons: passedbuttons),
          Button(text: "Ç", passedbuttons: passedbuttons),
        ]),
      ],
    );
  }
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    required this.passedbuttons,
  });

  final String text;
  final void Function(String) passedbuttons;
  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
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
                  color: !passed
                      ? const Color.fromARGB(255, 170, 167, 166)
                      : const Color.fromARGB(255, 120, 119, 118)),
              child: Center(child: Text(widget.text))),
        ),
      ),
    );
  }
}
