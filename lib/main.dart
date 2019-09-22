import 'package:flutter/material.dart';
import 'package:sach_mem/unit.dart';

void main() => runApp(MaterialApp(
      title: "Sách mềm",
      routes: <String, WidgetBuilder>{
        '/unit': (BuildContext context) => new UnitPage(),
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

class Item {
  const Item({this.title, this.icon});
  final String title;
  final IconData icon;
}

List<Item> items = <Item>[
  Item(title: "Sách", icon: Icons.book),
  Item(title: "Kết quả học", icon: Icons.insert_chart),
  Item(title: "Người dùng", icon: Icons.account_circle),
  Item(title: "Giới thiệu", icon: Icons.info),
  Item(title: "Góp ý, báo lỗi", icon: Icons.flag)
];

Widget _openMail(BuildContext context) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      AlertDialog(
        title: const Text(
          "Open Mail?",
          style: TextStyle(fontSize: 20.0),
        ),
        actions: <Widget>[
          new FlatButton(
            child: const Text("Open Mail."),
            color: Colors.blue[500],
            onPressed: () {},
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      )
    ],
  );
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
                    builder: (BuildContext context) => _openMail(context));
              },
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new Container(
                child: new DrawerHeader(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      "Từ vựng - Sách mềm",
                      style: TextStyle(fontSize: 20.0),
                    )),
                color: Colors.grey[300],
                height: 120.0,
              ),
              ListView.builder(
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      items[index].title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    leading: Icon(items[index].icon),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              )
            ],
          ),
        ),
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
