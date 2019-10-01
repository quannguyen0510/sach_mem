import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final String _url;
  final String _text;

  const Hyperlink(this._url, this._text);

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_url.contains("http://") || _url.contains("https://")) {
      return InkWell(
        child: Text(
          _text,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.blue,
              fontSize: 18.0),
        ),
        onTap: _launchURL,
      );
    }
    if (_url.contains("mailto:")) {
      return FlatButton(
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
            side: BorderSide(
                color: Colors.white60, width: 1, style: BorderStyle.solid)),
        child: Text(
          "Open Mail",
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: _launchURL,
      );
    } else {
      return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
            side: BorderSide(
                color: Colors.white60, width: 1, style: BorderStyle.solid)),
        child: Text(
          "Open Pick an app",
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: _launchURL,
      );
    }
  }
}
