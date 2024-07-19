import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/layers/data/datasources/app_data.dart'
    as appData;
import 'package:validatorless/validatorless.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _txtEmail =
      TextEditingController(text: appData.user.email);

  final TextEditingController _txtPerson =
      TextEditingController(text: appData.user.name);

  final TextEditingController _txtPhone =
      TextEditingController(text: appData.user.phone.toString());

  final TextEditingController _txtCPF =
      TextEditingController(text: appData.user.cpf.toString());

  final FormatterService _formatterService = FormatterService();

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu Perfil',
          style:
              TextStyle(fontSize: sizeScreen.width * .065, color: Colors.white),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          TextFieldCustom(
              controller: _txtEmail,
              prefixIcon: const Icon(Icons.email),
              label: 'Email',
              readOnly: true),
          TextFieldCustom(
              controller: _txtPerson,
              prefixIcon: const Icon(Icons.person),
              label: 'Nome',
              readOnly: true),
          TextFieldCustom(
            controller: _txtPhone,
            prefixIcon: const Icon(Icons.phone),
            label: 'Telefone',
            readOnly: true,
            inputFormatters: [_formatterService.telephoneFormatter],
          ),
          TextFieldCustom(
            controller: _txtCPF,
            prefixIcon: const Icon(Icons.document_scanner_rounded),
            label: 'CPF',
            isSecret: true,
            isObscure: true,
            readOnly: true,
          ),
          OutlinedButton(
            onPressed: () async {
              bool? result = await updatePassword(sizeScreen.width);
            },
            child: Text(
              'Alterar senha',
              style: TextStyle(fontSize: sizeScreen.width * .038),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword(double sizeWidth) {
    final TextEditingController _txtCurrentPassword = TextEditingController();

    final TextEditingController _txtNewPassword = TextEditingController();

    final TextEditingController _txtConfirmPassword = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(sizeWidth * .06),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: sizeWidth * .05,
                        ),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: sizeWidth * .05,
                          ),
                        ),
                      ),
                      TextFieldCustom(
                        controller: _txtCurrentPassword,
                        prefixIcon: const Icon(Icons.lock),
                        label: 'Senha atual',
                        isObscure: true,
                        isSecret: true,
                        validator: Validatorless.required('Campo obrigatório'),
                      ),
                      TextFieldCustom(
                        controller: _txtNewPassword,
                        prefixIcon: const Icon(Icons.lock),
                        label: 'Nova Senha',
                        isObscure: true,
                        isSecret: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo obrigatório!'),
                          Validatorless.min(
                              6, 'A senha deve ter pelo menos 6 caracteres!')
                        ]),
                      ),
                      TextFieldCustom(
                        controller: _txtConfirmPassword,
                        prefixIcon: const Icon(Icons.lock),
                        label: 'Confirme a Senha',
                        isObscure: true,
                        isSecret: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo obrigatório'),
                          Validatorless.compare(
                              _txtNewPassword, 'As senhas não coincidem'),
                        ]),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          'Atualizar',
                          style: TextStyle(fontSize: sizeWidth * .038),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 3,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
