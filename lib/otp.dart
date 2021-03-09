import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("opt"),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60,left: 20,right: 20),
              child: Text("Plase enter the otp to verify your account",style: TextStyle(fontSize: 19),),
            ),
            Center(

              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("Plase enter the otp to verify your account",style: TextStyle(fontSize: 13),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: OTPTextField(
                length: 5,
                keyboardType: TextInputType.number,

                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),

            ),
        Container(
        margin: EdgeInsets.only(top:40),
    width: 190,height: 50,
    child: FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)),
    child: Text('Valide OTP',style: TextStyle(fontSize: 20),),
    color: Colors.pink,
    textColor: Colors.white,
    onPressed: () {},
    ),
    ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Resend OTP',style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
