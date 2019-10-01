import 'package:flutter/material.dart';
import 'package:sach_mem/link_app.dart';

class MessageDialog extends StatefulWidget {
  final String appLink;

  MessageDialog({Key key, @required this.appLink}) : super(key: key);

  _MessageDialogState createState() => _MessageDialogState(appLink);
}

class _MessageDialogState extends State<MessageDialog> {
  String appLink;
  String app;
  String appName;
  _MessageDialogState(this.appLink);
  Widget build(BuildContext context) {
    if (this.appLink.contains("mailto")) {
      app = "mailto:lienhe@sachmem.vn";
      appName = "Mail";
    }
    if (this.appLink.contains("tel")) {
      app = "tel:+842435122222";
      appName = "Pick an app";
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AlertDialog(
          backgroundColor: Colors.black87,
          title: Text(
            "Open " + appName + "?",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          actions: <Widget>[
            new Hyperlink(app, appLink),
            new FlatButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }
}
