// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team33_app/components/color.dart';
import 'package:team33_app/service/list_service.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController statusController = TextEditingController();
  ListService _statusService = ListService();

  final ImagePicker _imagePicker = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  Widget? imagePlace() {
    double height = MediaQuery.of(context).size.height;
    if (profileImage != null) {
      return CircleAvatar(
        backgroundImage: FileImage(File(profileImage!.path)),
        radius: height * 0.08,
      );
    } else {
      if (_pickImage != null) {
        return CircleAvatar(
          // backgroundImage: NetworkImage(_pickImage),
          radius: height * 0.08,
        );
      } else {
        return CircleAvatar(
          backgroundImage: AssetImage("assets/images/loggo.png"),
          radius: height * 0.08,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: Colors.transparent,
          height: 420,
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: grimsi,
                    border:
                        Border.all(color: bluegre.withOpacity(0.7), width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 379,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Container(
                          height: size.height * .4,
                          /* decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))), */
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextField(
                                    style: TextStyle(color: Colors.white),
                                    controller: statusController,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: "Write your window",
                                      hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.6)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: grimsi),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: imagePlace(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          _onImageButtonPress(
                                              ImageSource.camera,
                                              context: context);
                                        },
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 30,
                                          color: Colors.white.withOpacity(0.6),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _onImageButtonPress(
                                              ImageSource.gallery,
                                              context: context);
                                        },
                                        child: Icon(
                                          Icons.image,
                                          size: 30,
                                          color: Colors.white.withOpacity(0.6),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            InkWell(
              onTap: () {
                _statusService
                    .addNot(statusController.text, profileImage ?? '')
                    .then((value) => Fluttertoast.showToast(msg: "Eklendi"));
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 190,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.transparent, width: 2),
                    //color: colorPrimaryShade,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Text(
                    "Ekle",
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onImageButtonPress(ImageSource source,
      {required BuildContext context}) async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: source);

      setState(() {
        profileImage = pickedFile!;
        print("resim ekleme");
        if (profileImage != null) {}
      });
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Hatamız :" + _pickImage);
      });
    }
  }
}
