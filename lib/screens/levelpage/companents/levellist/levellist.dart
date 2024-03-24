import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/screens/levelpage/companents/levellist/item.dart';

class Levellist extends StatelessWidget {
  const Levellist({
    super.key,
    required this.arguments,
    required this.list,
  });

  final List arguments;
  final List<ListTile> list;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        color: const Color.fromARGB(255, 245, 233, 146),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: FutureBuilder(
            future: Data().getlevels(arguments[0], arguments[1]["catagory"]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                for (var i in snapshot.data!) {
                  list.add(ListItem(
                    i: i,
                    catagory: arguments[1]["catagory"],
                    id: arguments[0],
                  ));
                }
                return AnimationLimiter(child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                         child:  SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(child: list[index],)));
                  },
                ));
              } else {
                return const Text("Eror");
              }
            },
          ),
        ));
  }
}
