import 'package:flutter/material.dart';
import 'package:hang_man/screens/changeavatar/avatar.dart';

class Userphoto extends StatefulWidget {
  const Userphoto({
    super.key,
    required this.avatar, required this.refresh,
  });
  final VoidCallback refresh;
  final String avatar;
  @override
  State<Userphoto> createState() => _UserphotoState();
}

class _UserphotoState extends State<Userphoto> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 255, 209, 3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Changeavatar(
                        refresh: () =>widget.refresh()
                                
                      )),
            );
          },
          child: CircleAvatar(
            radius: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                  "lib/assets/images/avatarlar/${widget.avatar}.png"),
            ),
          ),
        ),
      ),
    );
  }
}
