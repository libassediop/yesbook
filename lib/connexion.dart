import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yesbook/otp.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool isEnabled = false;
  bool _isloading = true;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = new GlobalKey<FormState>();

  bool changeScreen;
  String errorText = '';
  IconData errorIcon;
  double errorContainerHeight = 0.0;
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen = false;
    isEnabled = false;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Container password(BuildContext context, StateSetter setState) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      // color: Colors.amber,
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          onPressed: () {
                            this._scaffoldkey.currentState.showBottomSheet(
                                (context) => StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return login(context, setState);
                                    }),
                                backgroundColor: Colors.black);
                          },
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4.5,
                    ),
                    Text(
                      "Connexion",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Icon(
                    FontAwesomeIcons.airbnb,
                    size: 80,
                    color: Colors.pink,
                  )),
              Container(
                child: Text(
                  "Bienvenue sur Airbnb",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: TextField(
                    controller: passwordController,
                    onChanged: (val) {
                      print(val.length);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        border: OutlineInputBorder(),
                        //labelText: 'Adresse e-mail',
                        hintText: 'Mot de passe',
                        suffix: GestureDetector(
                            child: Text('Afficher',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                )),
                            onTap: () {
                              print(_obscureText);
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            })),
                    autofocus: true,
                    cursorColor: Colors.black,
                    obscureText: _obscureText),
              ),
              _isloading
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: FlatButton(
                        disabledColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        padding: EdgeInsets.all(16.0),
                        color: Colors.pink,
                        onPressed: () => {

                          setState(() {
                            _isloading = false;
                          }),
                          Future.delayed(const Duration(seconds: 5), () {
                            // deleayed code here
                            setState(() {
                              _isloading = true;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Otp()),
                            );
                            print('delayed execution');
                          }),
                          print(passwordController.value.text)
                        },
                        child: Text(
                          "Continuer",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 50),
                      child: SpinKitFadingCircle(
                        color: Colors.pink,
                        size: 80.0,
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: GestureDetector(
                  child: Text(
                    "Mot de passe oublie",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    print("Mot de passe oublie");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container login(BuildContext context, StateSetter setState) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      // color: Colors.amber,
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: IconButton(
                            icon: Icon(Icons.clear_outlined),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                      ),
                      Text(
                        "Connexion",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFormField(
                    controller: lastNameController,
                    autocorrect: true,
                    onChanged: (val) {
                      print(val);
                      val == null || val.toString() == ""
                          ? setState(() {
                              isEnabled = false;
                            })
                          : setState(() {
                              isEnabled = true;
                            });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Adresse e-mail',
                    ),
                    // focusNode: FocusNode(),
                    autofocus: true,
                    cursorColor: Colors.black,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 20.0, top: 5.0),
                    height: errorContainerHeight,
                    child: Row(
                      children: <Widget>[
                        Icon(errorIcon, size: 20.0, color: Colors.red[700]),
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(errorText,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.red[700])))
                      ],
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: FlatButton(
                    disabledColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: EdgeInsets.all(16.0),
                    color: Colors.pink,
                    onPressed: isEnabled
                        ? () {
                            if (lastNameController.text.isEmpty ||
                                !lastNameController.text.contains("@")) {
                              setState(() {
                                errorContainerHeight = 35.0;
                                errorIcon = FontAwesomeIcons.exclamationCircle;
                                errorText =
                                    'Veuillez entrer une adresse e-mail valide';
                              });
                            }
                             else {
                              setState(() {
                                errorContainerHeight = 0.0;
                                errorIcon = null;
                                errorText = '';
                              });
                              this._scaffoldkey.currentState.showBottomSheet(
                                  (context) => StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return password(context, setState);
                                      }),
                                  backgroundColor: Colors.black);
                            }
                          }
                        : null,
                    child: Text(
                      "Continuer",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: this._scaffoldkey,
        body: Container(
          child: Center(
            child: ElevatedButton(
                child: const Text('showBottomSheet'),
                onPressed: () async {
                  this._scaffoldkey.currentState.showBottomSheet(
                      (context) => StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return login(context, setState);
                          }),
                      backgroundColor: Colors.black);
                }),
          ),
        ),
      ),
    );
  }
}
