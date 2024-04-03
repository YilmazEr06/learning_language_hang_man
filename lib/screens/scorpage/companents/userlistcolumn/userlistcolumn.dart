import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'companents/listitemwinner.dart';

class Userlistcolumn extends StatelessWidget {
  const Userlistcolumn({
    super.key,
    required this.catagory,
  });
  final String catagory;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0, 33, 149, 243),
      height: MediaQuery.of(context).size.height * 0.8,
      child: FutureBuilder(
        future: Data().getcorlist("hepsi"),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var list = snapshot.data;
             
              list!.sort((a, b) => b.scor[catagory].compareTo(a.scor[catagory]));
             

              List<Widget> heads = [];

              for (var i in list) {
                heads.add(GestureDetector(
                  onTap: () {  // skor tablosundaki itemlere tıklandığında ne olacağı
                  },
                  child: Listitemwinner(user: i,category: catagory,sira: heads.length+1,),
                ));
              }
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AnimationLimiter(
                    child: Column(
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
      ),
    );
  }
}
