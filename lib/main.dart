import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nft_marketplace/screens/home_page.dart';
import 'package:nft_marketplace/screens/seeAll.dart';
import 'package:provider/provider.dart';

import 'backend/diary_data.dart';
import 'backend/diary_data_helper.dart';
import 'screens/diary_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const App());
  });
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Modules()),
          ChangeNotifierProvider(
              create: (_) => Module(
                  author: '',
                  authorImg: '',
                  nftImg: '',
                  price: 0,
                  title: '',
                  status: true))
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'TRADERS DIARY',
            home: GetMaterialApp(
              defaultTransition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 500),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
              routes: {
                DetailsPage.routeName: (context) => const DetailsPage(),
                SeeAll.routeName: (context) => const SeeAll(),
              },
            ),
          );
        });
  }
}
