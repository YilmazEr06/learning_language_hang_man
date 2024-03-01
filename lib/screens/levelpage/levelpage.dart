import 'package:flutter/material.dart';
import 'package:hang_man/bloc/firebase_bloc.dart';
import 'package:hang_man/screens/levelpage/companents/card.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';

class Levelpage extends StatefulWidget {
  const Levelpage({super.key});

  @override
  State<Levelpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Levelpage> {
  String category = "";

  @override
  void initState() {
    super.initState();
    category = "sanat";
    changecategory(category);
  }

  void changecategory(String category) {
    setState(() {
      print("object");
      print(category);
      this.category = category;
      
    
       });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const userinfobar(),
                catagoryfields(callback: changecategory),
                cards(catagory: category),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class cards extends StatefulWidget {
  const cards({
    super.key,
    required this.catagory,
  });
  final String catagory;

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  List items = [];
  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    final data = await Data().getlevelcards(widget.catagory);
    setState(() {
      items = data ?? []; // Handle null case
      print(items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: Data().getlevelcards(widget.catagory),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return card();
                },
              ),
            );
          }
        }
      },
    );
  }
  }


class catagoryfields extends StatelessWidget {
  const catagoryfields({
    super.key,
    required this.callback,
  });
  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            child: head("Bilim"),
            onTap: () {
              print("bilim");
              callback("bilim");
            },
          ),
          GestureDetector(
            child: head("Sanat"),
            onTap: () {
              callback("sanat");
              print("Sanat");
            },
          ),
          head("Mühendislik"),
          head("Biyoloji")
        ],
      ),
    );
  }

  Padding head(String head) {
    double width = 0;
    if (head.length.toDouble() * 15 < 100) {
      width = 100;
    } else {
      width = head.length.toDouble() * 18;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: width,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
            ),
            child: Center(
                child: Text(
              head,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ))),
      ),
    );
  }
}
