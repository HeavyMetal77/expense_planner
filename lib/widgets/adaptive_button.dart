import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final Function presentDatePicker;
  final String chooseDate;

  const AdaptiveFlatButton(this.chooseDate, this.presentDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              chooseDate,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: presentDatePicker)
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: presentDatePicker,
            child: Text(
              chooseDate,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
