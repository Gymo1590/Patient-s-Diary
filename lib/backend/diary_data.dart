import 'package:flutter/foundation.dart';

class Module with ChangeNotifier {
  String title;
  double price;
  String author;
  String authorImg;
  String nftImg;
  bool status;

  Module(
      {required this.title,
      required this.price,
      required this.author,
      required this.authorImg,
      required this.nftImg,
      required this.status});
} 
