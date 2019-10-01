import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Item {
  const Item({this.title, this.icon, this.pgLink});
  final String title;
  final IconData icon;
  final String pgLink;
}

List<Item> items = <Item>[
  Item(title: "Sách", icon: FontAwesomeIcons.bookOpen, pgLink: ""),
  Item(title: "Kết quả học", icon: FontAwesomeIcons.chartBar, pgLink: ""),
  Item(title: "Người dùng", icon: FontAwesomeIcons.user, pgLink: "/login"),
  Item(title: "Giới thiệu", icon: Icons.info, pgLink: "/about"),
  Item(title: "Góp ý, báo lỗi", icon: Icons.flag, pgLink: "/report")
];

class MenuDrawer extends StatefulWidget {
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  Widget build(BuildContext context) {
    return Drawer(
      child: GestureDetector(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
                BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0))
              ]),
              child: new DrawerHeader(
                child: Text(
                  "Từ vựng - Sách mềm",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              height: 105.0,
            ),
            ListView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        items[index].title,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                      leading: Icon(
                        items[index].icon,
                        color: Colors.blue,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(items[index].pgLink);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 72.0),
                      child: Container(
                        height: 1.0,
                        width: 240.0,
                        color: Colors.black12,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
