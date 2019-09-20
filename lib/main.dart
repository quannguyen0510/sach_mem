import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Sách mềm",
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
      ),
      home: new MainPage(),
    ));

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appName = "Sách";
//     return MaterialApp(
//       title: appName,
//       theme: ThemeData(
//         primaryColor: Colors.grey[100],
//         textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
//       ),
//       home: MyStatelessWidget(
//         title: appName,
//       ),
//     );
//   }
// }

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(
  content: Text('Showing Snackber'),
);

// void openPage(BuildContext context) {
//   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   },
//   ));
// }

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
              child: Icon(
                Icons.flag,
                color: Colors.black,
              ),
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          backgroundColor: Theme.of(context).primaryColor,
          // actions: <Widget>[
          //   IconButton()
          // ],
        ),
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: List.generate(choices.length, (index) {
            return Center(
              child: ChoiceCard(choice: choices[index], item: choices[index]),
            );
          }),
        ));
  }
}

class Choice {
  const Choice({this.title, this.img});
  final String title;
  final String img;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Tiếng Anh 1 Macmillan',
      img: 'https://s.sachmem.vn/public/bookcovers/TA1V2SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 2 Macmillan',
      img: 'https://s.sachmem.vn/public/bookcovers/TA2V2SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 3 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA3T1SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 3 Tập 2',
      img: 'https://s.sachmem.vn/public//bookcovers/TA3T2SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 4 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA4T1SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 4 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA4T2SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 5 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA5T1SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 5 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA5T2SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 6 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA6T1SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 6 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA6T2SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 7 Tập 1',
      img: 'https://s.sachmem.vn/public/bookcovers/TA7T1SHS_head.jpg'),
  const Choice(
      title: 'Tiếng Anh 7 Tập 2',
      img: 'https://s.sachmem.vn/public/bookcovers/TA7T2SHS_head.jpg'),
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
        ));
  }
}

class Item {
  const Item({this.title, this.icon});
  final String title;
  final IconData icon;
}

// List<Item> items = <Item>[
//   Item(title: "Sách", icon: Icons.book),
//   Item(title: "Kết quả học", icon: Icons.insert_chart),
//   Item(title: "Người dùng", icon: Icons.account_circle),
//   Item(title: "Giới thiệu", icon: Icons.info),
//   Item(title: "Góp ý, báo lỗi", icon: Icons.flag)
// ];

// class DisplayItem extends StatelessWidget {
//   const DisplayItem(
//       {Key key,
//       this.choice,
//       this.onTap,
//       @required this.item,
//       this.selected: false})
//       : super(key: key);

//   final Item choice;
//   final VoidCallback onTap;
//   final Item item;
//   final bool selected;

//   @override
//   Widget build(BuildContext context) {
//     TextStyle textStyle = Theme.of(context).textTheme.display1;
//     if (selected)
//       textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
//     return Card(
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             new Container(
//                 padding: const EdgeInsets.all(8.0),
//                 alignment: Alignment.topLeft,
//                 child: Icon(
//                   item.icon,
//                   size: 80.0,
//                   color: textStyle.color,
//                 )),
//             new Expanded(
//                 child: new Container(
//               padding: const EdgeInsets.all(10.0),
//               alignment: Alignment.topLeft,
//               child: Text(
//                 item.title,
//                 style: null,
//                 textAlign: TextAlign.left,
//                 maxLines: 5,
//               ),
//             )),
//           ],
//           crossAxisAlignment: CrossAxisAlignment.start,
//         ));
//   }
// }
