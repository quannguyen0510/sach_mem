import 'package:flutter/material.dart';
import 'package:sach_mem/dialog.dart';
import 'package:sach_mem/intro.dart';
import 'package:sach_mem/login.dart';
import 'package:sach_mem/menu.dart';
import 'package:sach_mem/report.dart';
import 'package:sach_mem/unit.dart';

void main() => runApp(MaterialApp(
      title: "Sách mềm",
      routes: <String, WidgetBuilder>{
        '/unit': (BuildContext context) => UnitPage(),
        '/about': (BuildContext context) => IntroPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/report': (BuildContext context) => ReportPage()
      },
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
      ),
      home: new MainPage(),
    ));

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sách"),
          actions: <Widget>[
            FloatingActionButton(
              tooltip: "Báo lỗi",
              child: Icon(
                Icons.flag,
                color: Colors.black,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        MessageDialog(appLink: "mailto:lienhe@sachmem.vn"));
              },
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: (MenuDrawer()),
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: List.generate(choices.length, (index) {
            return Center(
                child:
                    ChoiceCard(choice: choices[index], item: choices[index]));
          }),
        ));
  }
}

class Choice {
  const Choice({this.title, this.img, this.page});
  final String title;
  final String img;
  final String page;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Tiếng Anh 1 Macmillan',
      img: 'https://s.sachmem.vn/public/bookcovers/TA1V2SHS_head.jpg',
      page: '/unit'),
  const Choice(
      title: 'Tiếng Anh 2 Macmillan',
      img: 'https://s.sachmem.vn/public/bookcovers/TA2V2SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 3 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA3T1SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 3 Tập 2',
      img: 'https://s.sachmem.vn/public//bookcovers/TA3T2SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 4 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA4T1SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 4 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA4T2SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 5 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA5T1SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 5 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA5T2SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 6 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA6T1SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 6 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA6T2SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 7 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA7T1SHS_head.jpg',
      page: ''),
  const Choice(
      title: 'Tiếng Anh 7 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA7T2SHS_head.jpg',
      page: ''),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Card(
      color: Colors.white,
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: new CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(choice.img),
              ),
            ),
            new Expanded(
                child: new Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.topLeft,
              child: Text(
                choice.title,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
                maxLines: 20,
              ),
            )),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(choice.page);
        },
      ),
    );
  }
}
