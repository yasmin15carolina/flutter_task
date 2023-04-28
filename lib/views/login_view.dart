import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_task/views/house_rules_list_view.dart';
import 'package:flutter_task/widgets/text_input_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController(text: "");
  TextEditingController txtPassword = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xff6750a4),
            alignment: Alignment.topCenter,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Text(
              "HOUSE RULES APP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height / 30),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(
                    controller: txtEmail,
                    label: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  TextInputField(
                    controller: txtPassword,
                    label: "Password",
                    obscure: true,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  FilledButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HouseRulesListView(),
                            ));
                      },
                      child: const Text("Login")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an Acount?",
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: const Text("Sing in now",
                              style: TextStyle(color: Colors.blue)),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                controller: txtEmail,
                label: "Username",
              ),
              TextInputField(
                controller: txtPassword,
                label: "Password",
                obscure: true,
              ),
              FilledButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HouseRulesListView(),
                        ));
                    // await UserController.login(LoginViewModel(
                    //     username: txtUsername.text,
                    //     password: txtPassword.text));
                    // if (errorMessage != "") {
                    //   print(errorMessage);
                    //   Dialogs.show(
                    //       title: "Error",
                    //       content: errorMessage,
                    //       context: context);
                    //   errorMessage = "";
                    // } else {
                    //   print(UserModel().token);

                    //   localStorage.setString('username', txtUsername.text);
                    //   localStorage.setString('password', txtPassword.text);

                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const HomeView(),
                    //       ));
                    // }
                  },
                  child: const Text("Login")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Acount?",
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: const Text("Sing in now",
                          style: TextStyle(color: Colors.blue)),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
