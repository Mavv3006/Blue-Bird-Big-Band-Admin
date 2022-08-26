import 'package:admin_app/screens/widgets/image_placeholder.dart';
import 'package:admin_app/screens/widgets/text_field.dart';
import 'package:admin_app/util/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 64, right: 64, bottom: 8),
                child: ImagePlaceholder(),
              ),
              const Text(
                "Bitte gebe Benutzername und Passwort ein, um dich in der App einzuloggen.",
                textAlign: TextAlign.center,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 48.0,
                    right: 48.0,
                    top: 32,
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      children: [
                        MyTexField(
                          controller: usernameController,
                          labelText: "Benutzername",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Bitte einen Benutzernamen eingeben";
                            }
                            return null;
                          },
                        ),
                        sizedBox32,
                        MyTexField(
                          controller: passwordController,
                          labelText: "Passwort",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Bitte ein Passwort eingeben";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              sizedBox16,
              ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Login"),
                ),
                onPressed: () {
                  if (formKey.currentState == null ||
                      !formKey.currentState!.validate()) {
                    return;
                  }
                  final String username = usernameController.text;
                  final String password = passwordController.text;
                  // TODO: make api request using these infos
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
