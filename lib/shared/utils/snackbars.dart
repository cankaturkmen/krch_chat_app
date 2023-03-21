import 'package:flutter/material.dart';

import '../shared.dart';

SnackBar snacbars(MessageType messageType, ColorScheme colors, {String? text}) {
  switch (messageType) {
    case MessageType.processsing:
      return SnackBar(
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text ?? 'Processing',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
        backgroundColor: colors.primary,
      );
    //TODO GREEN COLOR
    case MessageType.success:
      return SnackBar(
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(text ?? 'Processed Succesfully',
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        backgroundColor: Colors.green,
      );
    case MessageType.error:
      return SnackBar(
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(text ?? 'Error Ocurred',
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        backgroundColor: colors.error,
      );
    default:
      return SnackBar(
        content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(text ?? 'Sorun Olustu',
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        backgroundColor: colors.tertiary,
      );
  }
}
