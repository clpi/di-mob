import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dimo/view/home/dash.dart';
import 'package:dimo/view/home.dart';
import 'package:dimo/util.dart';
import 'package:dimo/comp/input.dart';
import 'package:dimo/comp/button.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              hintText: "Email Address",
              prefixIcon: FlutterIcons.mail_ant,
            ),
            SizedBox(height: 15.0),
            InputWidget(
              hintText: "Password",
              prefixIcon: FlutterIcons.lock_ant,
            ),
            SizedBox(height: 25.0),
            MaterialButton(
              child: Text("Login", style: TextStyle(color: Color(0xff0a080f))),
              color: Color(0xffb0fe76),
              onPressed: () {
                // Helper.nextScreen(context, HomeView());
                Helper.nextScreen(context, HomeView());
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Color(0xffb0fe76))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Or, sign in with",
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    color: Colors.white70,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(FlutterIcons.google_circles_mco),
                        SizedBox(width: 10.0),
                        Text("Google",style: TextStyle(color: Colors.white,))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    color: Colors.blue,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(FlutterIcons.facebook_square_ant),
                        SizedBox(width: 10.0),
                        Text("Facebook",style: TextStyle(color: Colors.white,))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    color: Colors.lightBlueAccent,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(FlutterIcons.twitter_box_mco),
                        SizedBox(width: 10.0),
                        Text("Twitter",style: TextStyle(color: Colors.white,))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              hintText: "Email Address",
              prefixIcon: FlutterIcons.mail_ant,
            ),
            SizedBox(height: 15.0),
            InputWidget(
              hintText: "Password",
              prefixIcon: FlutterIcons.lock_ant,
            ),
            SizedBox(height: 25.0),
            PrimaryButton(
              text: "Register",
              onPressed: () {
                Helper.nextScreen(context, HomeDashPage());
              },
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "OR",
                    style: TextStyle(),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                            color: Color.fromRGBO(105, 108, 121, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    color: Colors.blue,
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(
                            color: Color.fromRGBO(105, 108, 121, 1),
                          ),
                        )
                      ],
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
}
