import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/data_sources/firebase.dart';
import 'package:hang_man/screens/levelpage/companents/levelsbar.dart';

class Levelpage extends StatefulWidget {
  const Levelpage({super.key});
  @override
  State<Levelpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Levelpage> {
  List arguments = [];
  List levels = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)?.settings.arguments as List;
    List<ListTile> list = [];
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: Column(
            children: [
              Levelspar(),
              levellist(arguments: arguments, list: list),
            ],
          ),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class levellist extends StatelessWidget {
  const levellist({
    super.key,
    required this.arguments,
    required this.list,
  });

  final List arguments;
  final List<ListTile> list;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        color: const Color.fromARGB(255, 245, 233, 146),
        child: FutureBuilder(
          future: Data().getlevels(arguments[0], arguments[1]["catagory"]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              for (var i in snapshot.data!) {
                list.add(ListItem(i: i));
              }
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return list[index];
                },
              );
            } else {
              return Text("Eror");
            }
          },
        ));
  }
}

class ListItem extends ListTile {
  const ListItem({
    Key? key,
    required this.i,
  }) : super(key: key);

  final String i; // Specify the type of i as String

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 225, 58),
          borderRadius: BorderRadius.circular(15)
        ),
        
        child: ListTile( 
          tileColor: const Color.fromARGB(255, 236, 8, 8),
          title: Text(i.toUpperCase()),
          leading: Icon(Icons.abc),
        ),
      ),
    );
  }
}