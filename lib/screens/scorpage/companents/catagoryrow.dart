import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:hang_man/bloc/databloc.dart';

class Catagoryrow extends StatelessWidget {
  const Catagoryrow({
    super.key,
    required this.callback,
    required this.currentcatagory,
  });
  final String currentcatagory;
  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(0, 36, 145, 234),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List>(
          future: Data().getcatagory(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child:  CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var a = snapshot.data;
                List<Widget> heads = [const SizedBox(width: 10,)];
                for (var b in a!) {
                  heads.add(GestureDetector(
                    onTap: () {
                      callback(b);
                    },
                    child: (currentcatagory == b)
                        ? Catagoryitem(text: b,isselected: true,)
                        : Catagoryitem(text: b,isselected: false),
                  ));
                }
                return    SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: AnimationLimiter(
                      child: Row(
                        children: AnimationConfiguration.toStaggeredList(
                          children: heads,
                          childAnimationBuilder: (p0) {
                            return SlideAnimation(
                              horizontalOffset: 1,
                              child: FadeInAnimation(child: p0),
                            );
                          },
                        ),
                      ),
                    ));
              }
            }
          },
        ));
  }
}

class Catagoryitem extends StatelessWidget {
  const Catagoryitem({
    super.key,
    required this.text,
    required this.isselected,
  });
  final String text;
  final bool isselected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isselected? const Color.fromARGB(255, 212, 169, 25): const Color.fromARGB(136, 228, 187, 53),
            borderRadius: BorderRadius.circular(20)),
        height: 35,
        width: 100,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
