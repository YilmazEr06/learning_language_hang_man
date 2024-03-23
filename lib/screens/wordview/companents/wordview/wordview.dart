import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/wordview/companents/wordview/insideofwordview.dart';


class Wordview extends StatelessWidget {
  const Wordview({
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
          return Insideofwordview(words: words);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
