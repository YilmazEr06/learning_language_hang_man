import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/wordview/companents/wordviewbar.dart';
import 'package:stroke_text/stroke_text.dart';

class Wordviewpage extends StatefulWidget {
  const Wordviewpage({super.key});
  @override
  State<Wordviewpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Wordviewpage> {
  List arguments = [];
  List levels = [];
  @override
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)?.settings.arguments as List;
    List<ListTile> list = [];
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: Column(
            children: [const wordviewbar(), wordview(arguments: arguments)],
          ),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class wordview extends StatelessWidget {
  const wordview({
    super.key,
    required this.arguments,
  });

  final List arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Data().getwords(arguments[0], arguments[1], arguments[2]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<WordModel> words = [];
          for (var i in snapshot.data!) {
            words
                .add(WordModel(name: i["name"], description: i["description"]));
          }
          return inside_of_wordview(words: words);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class inside_of_wordview extends StatefulWidget {
  const inside_of_wordview({
    super.key,
    required this.words,
  });
  final List<WordModel> words;

  @override
  State<inside_of_wordview> createState() => _inside_of_wordviewState();
}

class _inside_of_wordviewState extends State<inside_of_wordview> {
   int i = 0;
  @override
  Widget build(BuildContext context) {
   
    int max = widget.words.length;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
          color: Colors.blue,
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
                        if (i < max-1) {
                          i = i + 1;
                        }else if (i == max-1) {
                          Navigator.pushNamed(
                            context, '/gamepage', arguments:widget.words );
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
                        if (0<i) {
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
                    textStyle: TextStyle(fontSize: 50)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Center(
                  child: StrokeText(
                     
                      text: widget.words[i].description,
                      strokeWidth: 4,
                      textStyle: TextStyle(fontSize: 50,
                      
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
