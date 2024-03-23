
import 'package:flutter/material.dart';

class ListItem extends ListTile {
  const ListItem({
    required this.catagory,
    required this.id,
    Key? key,
    required this.i,
  }) : super(key: key);

  final String i; // Specify the type of i as String
  final String catagory;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 225, 58),
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          onTap: () {
            
            Navigator.pushReplacementNamed(context,  '/wordview',arguments: [id,catagory,i]);
          },
          tileColor: const Color.fromARGB(255, 236, 8, 8),
          title: Text(i.toUpperCase()),
          leading: const Icon(Icons.abc),
        ),
      ),
    );
  }
}
