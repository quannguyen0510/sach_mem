import 'package:flutter/material.dart';
import 'package:sach_mem/ClientModel.dart';
import 'package:sach_mem/database_helper.dart';

void main() => runApp(MaterialApp(
      title: "Sách mềm",
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
      ),
      home: new UnitPage(),
    ));

class UnitPage extends StatefulWidget {
  _UnitPageState createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  List<Unit> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllUnits().then((units) {
      setState(() {
        units.forEach((unit) {
          items.add(Unit.fromMap(unit));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiếng anh 1 Macmillan',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tiếng anh 1 Macmillan', style: TextStyle(color: Colors.black, fontSize: 16.0),),
          backgroundColor: Theme.of(context).primaryColor,
          leading: new FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child:new Icon(Icons.arrow_back)
          )
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].title}',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                      leading: Text(
                        '${items[position].unit}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
