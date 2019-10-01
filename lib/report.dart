import 'package:flutter/material.dart';
import 'package:sach_mem/menu.dart';

void main() => runApp(MaterialApp(
      title: "Sách mềm",
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
      ),
      home: new ReportPage(),
    ));

class ReportPage extends StatefulWidget {
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final textEdit = TextEditingController();

  void dispose() {
    textEdit.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    textEdit.text = "Báo lỗi, góp ý cho ứng dụng Từ vựng - Sách mềm";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Báo cáo lỗi"),
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  "Gửi đến:",
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: TextField(
                minLines: 1,
                decoration: InputDecoration(
                    enabledBorder: new UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.green, width: 2.0)),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ))),
              ),
            ),
            ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text(
                    "Tiêu đề:",
                    style: TextStyle(fontSize: 20.0, color: Colors.black54),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextField(
                    controller: textEdit,
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabled: true,
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.blue)),
                  ),
                )),
            Container(
              height: 2.0,
              width: 350.0,
              color: Colors.green,
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Góp ý, báo lỗi:",
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: TextField(
                maxLines: 6,
                // keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    enabledBorder: new UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.green, width: 2.0)),
                    focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
