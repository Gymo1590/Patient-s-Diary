import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../backend/diary_data_helper.dart';
import '../screens/diary_details_page.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    final wid = Provider.of<Modules>(context);
    var size = MediaQuery.of(context).size;
    final elem = wid.listed.elementAt(widget.index);
    final date = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(date);
    double width = size.width * 0.7;
    double height = size.height * 0.2;
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: width,
        height: size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              width: size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(DetailsPage.routeName,
                      arguments: widget.index);
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        elem.nftImg,
                        fit: BoxFit.fill,
                        width: width,
                        height: height,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: height,
                            width: width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.05,
              ),
              child: SizedBox(
                width: width,
                child: Text(
                  elem.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        "status",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Align(
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: Text(
                              // "$wid.price GHX",
                              formattedDate,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
