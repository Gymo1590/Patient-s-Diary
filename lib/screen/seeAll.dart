import 'package:flutter/material.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:provider/provider.dart';

import '../backend/diary_data_helper.dart';
import '../widgets/see_all_list_widget.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  static const routeName = "/SeeAll";

  @override
  Widget build(BuildContext context) {
    final wid = Provider.of<Modules>(context);
    final title = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xff3b22a1),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: wid.listed.length,
          itemBuilder: (BuildContext ctx, index) =>
              ChangeNotifierProvider.value(
                  value: wid.listed[index],
                  child: GridWid(
                    index: index,
                  )),
        ),
      ),
    );
  }
}
