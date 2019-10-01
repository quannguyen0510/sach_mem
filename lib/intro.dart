import 'package:flutter/material.dart';
import 'package:sach_mem/dialog.dart';
import 'package:sach_mem/link_app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MaterialApp(
      title: "Giới thiệu",
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
      ),
      home: new IntroPage(),
    ));

class IntroPage extends StatefulWidget {
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giới thiệu"),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          new Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                const ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Giới thiệu",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                    child: Text(
                      "Ứng dụng giúp học sinh học từ mới nhanh theo phương pháp vừa học vừa luyện. Ứng dụng cũng giúp giáo viên luyện từ vựng cho học sinh trên lớp thông qua các trò chơi đơn giản. Danh sách từ được tổ chức theo từng sách, từng bài của sách giáo khoa Tiếng Anh của Nhà xuất bản Giáo dục Việt Nam",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                const ListTile(
                  title: Text(
                    "Liên hệ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  title: Hyperlink(
                      "http://gioithieu.sachmem.vn", "http://sachmem.vn"),
                ),
                new GestureDetector(
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      size: 30.0,
                    ),
                    title: Text(
                      "lienhe@sachmem.vn",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 18.0),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              MessageDialog(appLink: "mailto"));
                    },
                  ),
                ),
                new GestureDetector(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 30.0,
                    ),
                    title: Text(
                      "+84. 24 3512.22.22",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 18.0),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => MessageDialog(
                                appLink: "tel",
                              ));
                    },
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    FontAwesomeIcons.facebookSquare,
                    size: 30.0,
                  ),
                  title: Hyperlink(
                      "https://www.facebook.com/sachmem.vn", "Facebook"),
                ),
              ],
            ),
          ),
          new Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                const ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Phiên bản",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                const ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("Đây là phiên bản thử nghiệm. Chúng tôi rất mong nhận được góp ý của người dùng để hoàn thiện.", style: TextStyle(fontStyle: FontStyle.italic),),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("Phiên bản: 1.4, ngày 1 tháng 9 năm 2018.", style: TextStyle(color: Colors.black, fontSize: 15.0),),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
