import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> showLoadingDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(vertical: 250, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator().h(50).w(50),
              HeightBox(20),
              "Loading...".text.make(),
            ],
          ),
        );
      });
}

void showSnackBarError(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.all(10),
    content: <Widget>[
      Flexible(child: message.text.size(15).make()),
      Icon(
        Icons.warning,
        color: Colors.red,
      )
    ].row(alignment: MainAxisAlignment.spaceBetween),
    duration: 3.seconds,
  ));
}
