import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/screens/levelpage/companents/cardandcatagory.dart';

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
        color: Color.fromARGB(0, 36, 145, 234),
        height: 75,
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
                      widget.callback(b);
                    },
                    child: (widget.currentcatagory==b)?head(b,true):head(b,false),
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
