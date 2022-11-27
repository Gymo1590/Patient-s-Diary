import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ipfs/src/service/file_picker.dart';
import 'package:flutter_ipfs/src/service/image_picker.dart';
import 'package:flutter_ipfs/src/service/video_picker.dart';

class Newsetup extends StatefulWidget {
  const Newsetup({super.key});
static const routeName = "/Newsetup";
  @override
  State<Newsetup> createState() => _NewsetupState();
}

class _NewsetupState extends State<Newsetup> {
  TextEditingController descriptionctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: h*0.15,
        backgroundColor: Colors.deepPurple,
        title: const Center(
            child: Text(
          'NEW SETUP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formcontrol,
          child: Column(
            children: [
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              TextFormField(
                controller: descriptionctrl,
                maxLines: 5,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: 'Description',
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                textInputAction: TextInputAction.next,
                autofocus: false,
              ),
              SizedBox(
                height: h * 0.05,
              ),
           Center(
              child: RaisedButton(
                onPressed: () => ImagePickerService.pickImage(context),
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Upload Image',
                      style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                    ),
                  ),
                ),
              ),
            ),
               Center(
              child: RaisedButton(
                onPressed: () => FilePickerService.pickFile(context),
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Upload File',
                      style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  onPrimary: Colors.purple,
                  onSurface: Colors.purple,
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
