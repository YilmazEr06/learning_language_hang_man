import 'package:flutter/material.dart';
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
      height: MediaQuery.of(context).size.height*0.8,
      child: FutureBuilder(
        future: Data().getcorlist(catagory),
        builder:  (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child:  CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var a = snapshot.data;
                List<Widget> heads = [];
                for (var _ in a!) {
                  heads.add(GestureDetector(
                    onTap: () {
                       // skor tablosundaki itemlere tıklandığında ne olacağı
                    },
                    child: const Listitemwinner(),
                  ));
                }
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: heads,
                    ));
              }
            }
          },
      ),
    );
  }
}
