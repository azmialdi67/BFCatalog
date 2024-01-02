import 'package:flutter/material.dart';
import 'package:flutter_intro_project/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white)),
              ),
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 30.0,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white)),
              ),
              SizedBox(
                height: 30.0,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: context.accentColor),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome $name",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: context.accentColor),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                        style: TextStyle(color: context.accentColor),
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          } else if (value.length < 3) {
                            return "Length of username should be more than 3 characters";
                          }
                          return null;
                        }),
                    TextFormField(
                      style: TextStyle(color: context.accentColor),
                      cursorColor: context.accentColor,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password should atleast have 6 characters";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Material(
                color: context.primaryColor,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changeButton
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
