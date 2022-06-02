import 'package:flutter/material.dart';
import 'package:team33_app/components/color.dart';
import 'package:team33_app/components/color.dart';
import 'package:team33_app/view/addNotaPage/add_note.dart';
import 'package:team33_app/view/addNotaPage/add_button_widget.dart';

class CustomDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ButtonWidget(
        text: 'Custom Dialog',
        onClicked: () => showCustomDialog(context),
      );

  void showCustomDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Dialog(
              backgroundColor: Colors.transparent,
              child: AddNotePage(),
            ),
            Positioned(
              bottom: 140,
              child: IgnorePointer(
                ignoring: true,
                child: SingleChildScrollView(
                  child: Container(
                    height: 50,
                    width: 190,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: grimsi,
                        border: Border.all(
                            color: bluegre.withOpacity(0.7), width: 4),
                        //color: colorPrimaryShade,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        "Ekle",
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
