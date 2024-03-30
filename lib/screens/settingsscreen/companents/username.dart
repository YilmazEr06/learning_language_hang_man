

import 'package:flutter/material.dart';


class Username extends StatefulWidget {
  const Username({
    super.key,
  });

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> with TickerProviderStateMixin{


  

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width ,
        child: Center(
          child: Container(
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
            child: Stack(
              children: [
                Positioned(
                    left: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2.0, vertical: 5),
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(57, 68, 67, 67),
                              borderRadius: BorderRadius.circular(50)),
                          child: const  Center(
                              child: Icon(Icons.verified_user_outlined))),
                    )),
                Positioned(
                    top: 7,
                    left: 85,
                    child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(31, 60, 61, 62),
                            borderRadius: BorderRadius.circular(15)),
                        child: const TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(12, 56, 54, 54),
                                width: 4.0,
                              ),
                            ),
                            hintText: '#oldusername',
                          ),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
