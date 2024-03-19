import 'package:flutter/cupertino.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFFFFF7D5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(64),
          bottomRight: Radius.circular(64),
          topLeft: Radius.circular(64),
          topRight: Radius.circular(64),
        ),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: const Stack(
        children: [
          Text(
          
            'AYARLAR',style: TextStyle(
              fontFamily: "akayakanadaka",
              fontSize:50
            ),
          ),
        ],
      ),
    );
  }
}