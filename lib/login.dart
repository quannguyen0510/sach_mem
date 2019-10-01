import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sach_mem/menu.dart';

void main() => runApp(MaterialApp(
      title: "Giới thiệu",
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        textTheme: TextTheme(title: TextStyle(fontSize: 30.0)),
      ),
      home: new LoginPage(),
    ));

class Skill {
  const Skill({this.icon, this.skill, this.isChoose, this.color});
  final IconData icon;
  final String skill;
  final bool isChoose;
  final Color color;
}

List<Skill> skills = const <Skill>[
  const Skill(icon: Icons.headset, skill: "Nghe", isChoose: true, color: Colors.yellow),
  const Skill(icon: Icons.mic, skill: "Nói", isChoose: true, color: Colors.blue),
  const Skill(icon: FontAwesomeIcons.pen, skill: "Viết", isChoose: true, color: Colors.green),
  const Skill(icon: FontAwesomeIcons.bookOpen, skill: "Đọc", isChoose: true, color: Colors.red)
];

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Người dùng"),
        ),
        drawer: MenuDrawer(),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                const ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Icon(
                        FontAwesomeIcons.signInAlt,
                        size: 45.0,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: Text(
                        "Để lưu kết quả học tập bạn cần đăng nhập.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    )),
                Column(
                  children: <Widget>[
                    SizedBox(
                        width: 350.0,
                        height: 56.0,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: FlatButton(
                            child: ListTile(
                                leading: Padding(
                                  padding:
                                      EdgeInsets.only(left: 24.0, bottom: 16.0),
                                  child: Icon(
                                    FontAwesomeIcons.googlePlusG,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                ),
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    "ĐĂNG NHẬP VỚI GOOGLE",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            onPressed: () {},
                            color: Colors.red,
                          ),
                        )),
                    SizedBox(
                        width: 350.0,
                        height: 56.0,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: FlatButton(
                            child: ListTile(
                                leading: Padding(
                                  padding:
                                      EdgeInsets.only(left: 24.0, bottom: 16.0),
                                  child: Icon(
                                    FontAwesomeIcons.facebookSquare,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                ),
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    "ĐĂNG NHẬP VỚI FACEBOOK",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            onPressed: () {
                              initiateFacebookLogin();
                            },
                            color: Colors.blue,
                          ),
                        )),
                    GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Text(
                            "ĐĂNG NHẬP SAU",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.0),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/');
                        }),
                    Container(
                      height: 1.0,
                      width: 370.0,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, right:80.0),
                      child: Text("Chọn kĩ năng bạn muốn luyện", style: TextStyle(fontSize: 20.0, color: Colors.black45),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: skills.length,
                        itemBuilder: (context, position) {
                          bool isSwitched = true;
                          return Column(
                            children: <Widget>[
                              ListTile(
                                leading: Padding(
                                  padding: EdgeInsets.only(right: 4.0, left: 16.0),
                                  child: Icon(skills[position].icon, color: skills[position].color, size: 30.0,),
                                ),
                                title: Text('${skills[position].skill}', style: TextStyle(fontSize: 20.0),),
                                trailing: CupertinoSwitch(
                                  value: skills[position].isChoose,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 48.0),
                                child: Container(
                                  height: 1.0,
                                  width: 310.0,
                                  color: Colors.black26,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
  }
}
