 
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget userid(BuildContext context,  String id) {

    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
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
                      padding:
                         const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(57, 68, 67, 67),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: SvgPicture.asset(
                            "lib/assets/images/icon _info_.svg",
                            fit: BoxFit.fill,
                            height: 40,
                          ))),
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
                        child:  TextField(
                          enabled: false,
                          decoration:  InputDecoration(
                          
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(
                                    color: Color.fromARGB(12, 56, 54, 54),
                                   width: 4.0,
                                  ),
                            ),
                            hintText:id,
                          ),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }