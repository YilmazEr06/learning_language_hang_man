
import 'package:flutter/material.dart';

class userphoto extends StatelessWidget {
  const userphoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
          color: Color(0xFFFFF7D5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        child: ClipRRect(

            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(
              radius: 100,
              child: Image.asset("lib/assets/indir.jpeg",
              fit: BoxFit.fill,),
            )),
      ),
    );
  }
}