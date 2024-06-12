import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/text_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().inversePrimary,
      body: SingleChildScrollView(
        child: SizedBox(
          width: sizeScreen.width,
          height: sizeScreen.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'GreenGrocer',
                      style: TextStyle(
                          fontSize: sizeScreen.width * .1, color: Colors.white),
                    ),
                    Text(
                      'Virtual',
                      style: TextStyle(
                        fontSize: sizeScreen.width * .07,
                        color: MaterialTheme.lightScheme().inverseSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeScreen.width * .075,
                  vertical: sizeScreen.height * .05,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFieldCustom(
                      label: 'Email',
                      controller: _txtEmail,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    TextFieldCustom(
                      label: 'Senha',
                      controller: _txtSenha,
                      prefixIcon: const Icon(Icons.password),
                      isSecret: true,
                      isObscure: true,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: sizeScreen.width * .038),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Esqueceu a Senha?'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: Text('Ou'),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      //style: OutlinedButton.styleFrom(side: BorderSide(width: 2)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(fontSize: sizeScreen.width * .038),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
