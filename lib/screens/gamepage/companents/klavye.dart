import 'package:flutter/material.dart';

class Klavye extends StatelessWidget {
  const Klavye({
    super.key,
    required this.passedbuttonsfunc,
    required this.bottom,
    required this.opacity,
    required this.passedbuttons,
  });
  final double bottom;
  final double opacity;
  final void Function(String) passedbuttonsfunc;
  final List passedbuttons;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Button(text: "Q", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "W", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "E", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "R", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "T", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "Y", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "U", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "I", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "O", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "P", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "Ğ", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "Ü", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
          ]), 
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Button(text: "A", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "S", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "D", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "F", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "G", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "H", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "J", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "K", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "L", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "Ş", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "İ", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Button(text: "Z", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "X", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "C", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "V", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "B", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "N", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "M", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "Ö", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons),
            Button(text: "Ç", passedbuttonsfunc: passedbuttonsfunc, passedbuttons: passedbuttons,),
          ]),
        ],
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    required this.passedbuttonsfunc, required this.passedbuttons,
  });
  final List passedbuttons;
  final String text;
  final void Function(String) passedbuttonsfunc;
  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {

  bool passed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.passedbuttons.contains(widget.text.toLowerCase())){
      passed = true;
    }
    else{
      passed=false;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5),
      child: SizedBox(
        height: 46,
        width: 29,
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.passedbuttonsfunc(widget.text.toLowerCase());
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
