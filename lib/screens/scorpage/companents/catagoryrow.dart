import 'package:flutter/material.dart';

class catagoryrow extends StatelessWidget {
  const catagoryrow({
    super.key,
   
  });



  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 10,),
          catagoryitem(text: "Genel"),
          catagoryitem(text: "Bilim"),
          catagoryitem(text: "Sanat"),
          catagoryitem(text: "Matematik"),
      
        ],
      ),
    );
  }
}

class catagoryitem extends StatelessWidget {
  const catagoryitem({
    super.key, this.text,
  });
 final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 2),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 251, 219, 113),
            borderRadius: BorderRadius.circular(20)),
        height: 35,
        width: 100,
        child:  Text(text,style:const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
