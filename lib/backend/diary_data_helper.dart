import 'package:flutter/material.dart';

import 'diary_data.dart';

class Modules extends ChangeNotifier {
  final List<Module> _items = [
    Module(
        author: 'John Doe',
        authorImg: 'assets/images/avatar1.jpg',
        price: 1.123,
        nftImg: 'assets/images/nft1.jpg',
        title: 'XAUUSD',
        status: true),
    Module(
        author: 'Gift Peter',
        authorImg: 'assets/images/avatar2.jpg',
        price: 0.0113,
        nftImg: 'assets/images/nft2.jpg',
        title: 'USDCHF',
        status: false),
    Module(
        author: 'cactus mpiro',
        authorImg: 'assets/images/avatar1.jpg',
        price: 0.00932,
        nftImg: 'assets/images/nft1.jpg',
        title: 'BTCUSD',
        status: true),
    Module(
        author: 'Does and donts',
        authorImg: 'assets/images/avatar2.jpg',
        price: 0.000012,
        nftImg: 'assets/images/nft2.jpg',
        title: 'EURUSD',
        status: false),
    Module(
        author: 'Gift Peter',
        authorImg: 'assets/images/avatar2.jpg',
        price: 0.0113,
        nftImg: 'assets/images/nft2.jpg',
        title: 'GBPUSD',
        status: false),
  ];
  final token = "7bba71456e5acfd939dd77c7de97cecb";
  List<Module> get listed => _items;

  // Module findById(String id) {
  //   return _items.firstWhere((prod) => prod.status == id);
  // }
  //eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweENCQkJGN0I2Zjk5MzI5MjhFZjhEOUI5QzM4MkY1ZjU4MjYzQjQ5QUUiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY2OTQ2NDE0MDE3MywibmFtZSI6ImNsaWVudCJ9.NDlFK2UoM56k3IAFQiZGxwSTzvTkdo3a9IfzUKTnU3k

  Module findContentId(int index) {
    return listed.elementAt(index);
  }
}
