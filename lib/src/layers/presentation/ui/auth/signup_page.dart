import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/text_field_custom.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final telephoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtTelephone = TextEditingController();
  TextEditingController _txtCPF = TextEditingController();
  TextEditingController _txtName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().inversePrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: sizeScreen.width,
          height: sizeScreen.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
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
              Expanded(
                flex: 2,
                child: Container(
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
                        controller: _txtPassword,
                        prefixIcon: const Icon(Icons.password),
                        isSecret: true,
                        isObscure: true,
                      ),
                      TextFieldCustom(
                        label: 'Nome',
                        controller: _txtName,
                        prefixIcon: const Icon(Icons.person_rounded),
                      ),
                      TextFieldCustom(
                        label: 'Celular',
                        controller: _txtTelephone,
                        prefixIcon: const Icon(Icons.phone_rounded),
                        inputFormatters: [telephoneFormatter],
                      ),
                      TextFieldCustom(
                        label: 'CPF',
                        controller: _txtCPF,
                        prefixIcon: const Icon(Icons.description_rounded),
                        inputFormatters: [cpfFormatter],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
