import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';

import 'package:nft_marketplace/widgets/diary_card_widget.dart';
import 'package:nft_marketplace/widgets/category.dart';
import 'package:provider/provider.dart';

import '../backend/diary_data_helper.dart';
import 'package:nft_marketplace/screen/set.dart';
import 'seeAll.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    final wid = Provider.of<Modules>(context);
    // final web3Storage = withApiToken(wid.token);

    IpfsClient ipfsClient = IpfsClient(
        url: "https://ipfs.infura.io:5001", authorizationToken: wid.token);

    Future getclient() async {
      var response = await ipfsClient.write(
          dir: 'myfolder/sample.png',
          filePath: "C:/Users/Asus/Desktop/SOFT DEV/kai.jpg",
          fileName: "kai.jpg");
      print(response);
    }

    const String lost = "Lost Trades";
    const String active = "Active Trades";
    const String won = "won Trades";

    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pushNamed(context, Newsetup.routeName
                                },
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xff3b22a1),
        //appbar bg color

        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: size.width * 0.15,
        title: Text(
          "TRADERS DIARY",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: size.height,
            width: size.height,
            decoration: const BoxDecoration(color: Color(0xff06090d)
                //background color
                ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: ListView(
                  children: [
                    // buildVideoThumbnail(isDarkMode, size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCategory(active, defaultFontColor, size),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SeeAll.routeName,
                                arguments: active);
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.lato(
                              color: defaultFontColor.withOpacity(0.7),
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: wid.listed.length,
                        itemBuilder: (BuildContext ctx, index) =>
                            ChangeNotifierProvider.value(
                          value: wid.listed[index],
                          child: CardWidget(index: index),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: getclient, child: const Text('hello')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCategory(won, defaultFontColor, size),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SeeAll.routeName,
                                arguments: won);
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.lato(
                              color: defaultFontColor.withOpacity(0.7),
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: wid.listed.length,
                        itemBuilder: (BuildContext ctx, index) =>
                            ChangeNotifierProvider.value(
                          value: wid.listed[index],
                          child: CardWidget(index: index),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCategory(lost, defaultFontColor, size),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SeeAll.routeName,
                                arguments: lost);
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.lato(
                              color: defaultFontColor.withOpacity(0.7),
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: wid.listed.length,
                        itemBuilder: (BuildContext ctx, index) =>
                            ChangeNotifierProvider.value(
                                value: wid.listed[index],
                                child: CardWidget(
                                  index: index,
                                )),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
