import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:obsidan/presentation/screens/dashboard_screen.dart';
import 'package:obsidan/presentation/widgets/custom_button.dart';
import 'package:obsidan/presentation/widgets/custom_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/Pattern_1.svg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: 30.0,
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Text(
                      "Long time no see! Let's Sign in to get started",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  CustomInputField(
                    label: "Email",
                    obscure: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    label: "Password",
                    obscure: true,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  CustomButton(
                    text: "Sign In",
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DashboardScreen()));
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      "Forgot password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

