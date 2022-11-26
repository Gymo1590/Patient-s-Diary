import 'package:flutter/material.dart';
import 'package:nft_marketplace/backend/diary_data_helper.dart';
import 'package:provider/provider.dart';
import '../screens/diary_details_page.dart';

class GridWid extends StatelessWidget {
  const GridWid({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final wid = Provider.of<Modules>(context);
    final elem = wid.listed.elementAt(index);

    return InkWell(
      focusColor: Colors.blue[100],
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailsPage.routeName, arguments: index);
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  elem.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  elem.nftImg,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
