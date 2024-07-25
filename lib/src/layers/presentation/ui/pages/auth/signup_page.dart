import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/core/utils/formatters_service.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/text_field_custom.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final AuthController authController = GetIt.I.get<AuthController>();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtTelephone = TextEditingController();
  TextEditingController _txtCPF = TextEditingController();
  TextEditingController _txtName = TextEditingController();
  FormatterService _formatterService = FormatterService();
  final _formKey = GlobalKey<FormState>();

  void _signUp(BuildContext context) async {
    await authController.signUp(
      newUser: User(
        name: _txtName.text,
        email: _txtEmail.text,
        phone: int.parse(_txtTelephone.text.replaceAll(RegExp(r'\D'), '')),
        cpf: int.parse(_txtCPF.text.replaceAll(RegExp(r'\D'), '')),
        password: _txtPassword.text,
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().inversePrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
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
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFieldCustom(
                          label: 'Email',
                          textInputType: TextInputType.emailAddress,
                          controller: _txtEmail,
                          prefixIcon: const Icon(Icons.email_rounded),
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo Obrigatório!'),
                            Validatorless.email('Digite um email válido!'),
                          ]),
                        ),
                        TextFieldCustom(
                          label: 'Senha',
                          controller: _txtPassword,
                          prefixIcon: const Icon(Icons.password),
                          isSecret: true,
                          isObscure: true,
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo Obrigatório!'),
                            Validatorless.min(
                                6, 'A senha deve ter pelo menos 6 caracteres!'),
                          ]),
                        ),
                        TextFieldCustom(
                          label: 'Nome',
                          textInputType: TextInputType.name,
                          controller: _txtName,
                          prefixIcon: const Icon(Icons.person_rounded),
                          validator:
                              Validatorless.required('Campo Obrigatório!'),
                        ),
                        TextFieldCustom(
                          label: 'Celular',
                          textInputType: TextInputType.phone,
                          controller: _txtTelephone,
                          prefixIcon: const Icon(Icons.phone_rounded),
                          inputFormatters: [
                            _formatterService.telephoneFormatter
                          ],
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo obrigatório!'),
                            Validatorless.min(
                                11, 'Número deve conter 11 digitos!'),
                          ]),
                        ),
                        TextFieldCustom(
                          label: 'CPF',
                          textInputType: TextInputType.number,
                          controller: _txtCPF,
                          prefixIcon: const Icon(Icons.description_rounded),
                          inputFormatters: [cpfFormatter],
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo obrigatório!'),
                            Validatorless.cpf('CPF inválido!'),
                          ]),
                        ),
                        GetX<AuthController>(
                          init: authController,
                          builder: (controller) {
                            return ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () async {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        _signUp(context);
                                      }
                                    },
                              child: Text(
                                'Cadastrar',
                                style: TextStyle(
                                    fontSize: sizeScreen.width * .038),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
