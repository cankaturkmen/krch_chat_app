import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:go_router/go_router.dart';
import 'package:krch_chat_app/firebase_services/firebase_auth.dart';
import 'package:krch_chat_app/shared/notifiers/loginInfo.dart';
import 'package:krch_chat_app/shared/shared.dart';
import 'package:krch_chat_app/widgets/input_field.dart';

import '../../shared/utils/enums.dart';
import '../../shared/utils/snackbars.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required, required this.loginInfo});
  LoginInfo loginInfo;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey formkey = GlobalKey();
    final colors = context.theme.colorScheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController usernameController = TextEditingController();
    TextEditingController paswordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          width: width / 2,
          height: height / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 6,
              child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Welcome to KRCH Chat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: usernameController,
                          hintText: "Username",
                          icon: Icons.person,
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: paswordController,
                          maxLines: 1,
                          obsecureText: true,
                          hintText: "Password",
                          icon: Icons.password,
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Login"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SignInButton(
                              Buttons.Google,
                              text: "Sign up with Google",
                              onPressed: () async {
                                await widget.loginInfo.login().then((value) {
                                  print(value.boolResult);
                                  if (value.boolResult == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      snacbars(MessageType.success, colors),
                                    );
                                    context.goNamed('home');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      snacbars(MessageType.error, colors,
                                          text: value.error!.message),
                                    );
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
