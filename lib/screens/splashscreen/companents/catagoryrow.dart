import 'package:flutter/material.dart';

import 'package:hang_man/bloc/databloc.dart';

class catagoryrow extends StatelessWidget {
  const catagoryrow({
    super.key,
    required this.callback,
    required this.currentcatagory,
  });
  final String currentcatagory;
  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(0, 36, 145, 234),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List>(
          future: Data().getcatagory(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                var a = snapshot.data;
                List<Widget> heads = [];
                for (var b in a!) {
                  heads.add(GestureDetector(
                    onTap: () {
                      callback(b);
                    },
                    child: (currentcatagory == b)
                        ? catagoryitem(text: b,isselected: true,)
                        : catagoryitem(text: b,isselected: false),
                  ));
                }
                return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: heads,
                    ));
              }
            }
          },
        ));
  }
}

class catagoryitem extends StatelessWidget {
  const catagoryitem({
    super.key,
    this.text,
    required this.isselected,
  });
  final text;
  final bool isselected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isselected? Color.fromARGB(255, 241, 190, 24): Color.fromARGB(255, 251, 219, 113),
            borderRadius: BorderRadius.circular(20)),
        height: 35,
        width: 100,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
