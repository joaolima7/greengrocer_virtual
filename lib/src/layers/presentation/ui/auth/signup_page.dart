import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/text_field_custom.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _txtEmail = TextEditingController();
    TextEditingController _txtSenha = TextEditingController();
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
                      'Cadastro',
                      style: TextStyle(
                          fontSize: sizeScreen.width * .1, color: Colors.white),
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
                      prefixIcon: const Icon(Icons.email_rounded),
                    ),
                    TextFieldCustom(
                      label: 'Senha',
                      controller: _txtSenha,
                      prefixIcon: const Icon(Icons.password),
                      isSecret: true,
                      isObscure: true,
                    ),
                    TextFieldCustom(
                      label: 'Nome',
                      controller: _txtEmail,
                      prefixIcon: const Icon(Icons.person_rounded),
                    ),
                    TextFieldCustom(
                      label: 'Celular',
                      controller: _txtEmail,
                      prefixIcon: const Icon(Icons.phone_rounded),
                    ),
                    TextFieldCustom(
                      label: 'CPF',
                      controller: _txtEmail,
                      prefixIcon: const Icon(Icons.description_rounded),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Cadastrar',
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
