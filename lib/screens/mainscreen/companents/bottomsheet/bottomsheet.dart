import 'package:flutter/material.dart';
import 'package:hang_man/screens/mainscreen/companents/bottomsheet/companents/button.dart';
import 'package:hang_man/screens/mainscreen/companents/bottomsheet/companents/textfield.dart';
import 'package:hang_man/screens/mainscreen/companents/bottomsheet/companents/textpart.dart';

class Bottomshet extends StatefulWidget {
  const Bottomshet({
    super.key,
  });

  @override
  State<Bottomshet> createState() => BottomshetState();
}

class BottomshetState extends State<Bottomshet> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();

    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 242, 188),
            borderRadius: BorderRadius.circular(20)),
        height: 400,
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Textpart(),
                Textfield(
                  controller: controller,
                ),
                Button(
                  formKey: formKey,
                  controller: controller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
