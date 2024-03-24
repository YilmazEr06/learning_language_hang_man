import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/screens/catagorypage/companents/cardandcatagory.dart';

class CategoryFields extends StatefulWidget {
  const CategoryFields({
    super.key,
    required this.callback,
    required this.currentcatagory,
  });
  final String currentcatagory;
  final void Function(String) callback;
  @override
  State<CategoryFields> createState() => _CategoryFieldsState();
}

class _CategoryFieldsState extends State<CategoryFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(0, 36, 145, 234),
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List>(
          future: Data().getcatagory(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()),
              );
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var a = snapshot.data;
                List<Widget> heads = [];
                for (var b in a!) {
                  heads.add(GestureDetector(
                    onTap: () {
                      widget.callback(b);
                    },
                    child: (widget.currentcatagory == b)
                        ? head(b, true)
                        : head(b, false),
                  ));
                }
                return SingleChildScrollView(
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
