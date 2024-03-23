
import 'package:flutter/material.dart';
import 'package:hang_man/models/word.dart';
import 'package:stroke_text/stroke_text.dart';

class Insideofwordview extends StatefulWidget {
  const Insideofwordview({
    super.key,
    required this.words,
  });
  final List<WordModel> words;

  @override
  State<Insideofwordview> createState() => InsideofwordviewState();
}

class InsideofwordviewState extends State<Insideofwordview> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    int max = widget.words.length;
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
          color: const Color.fromARGB(0, 33, 149, 243),
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.85,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.65,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (i < max - 1) {
                          i = i + 1;
                        } else if (i == max - 1) {
                          Navigator.pushReplacementNamed(context, '/gamepage',
                              arguments: widget.words);
                        }
                      });
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 75,
                    ),
                  )),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.65,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (0 < i) {
                          i = i - 1;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 75,
                    ),
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                child: StrokeText(
                    text: widget.words[i].name,
                    strokeWidth: 4,
                    textStyle: const TextStyle(fontSize: 50)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Center(
                  child: StrokeText(
                      text: widget.words[i].description,
                      strokeWidth: 4,
                      textStyle: const TextStyle(
                        fontSize: 50,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
