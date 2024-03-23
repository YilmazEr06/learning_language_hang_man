import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/screens/catagorypage/companents/cardandcatagory.dart';

class Cards extends StatefulWidget {
  const Cards({
    super.key,
    required this.catagory,
  });
  final String catagory;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List items = [];
  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    final data = await Data().getlevelcards(widget.catagory);
    setState(() {
      items = data; // Handle null case
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: Data().getlevelcards(widget.catagory),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child:  CircularProgressIndicator());
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context, '/selectlevelpage',
                        arguments:[ snapshot.data![index][0],snapshot.data![index][1]]);
                    },
                    child: Cardclass(data: [snapshot.data![index]],));
                },
              ),
            );
          }
        }
      },
    );
  }
}
