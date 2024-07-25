import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/dialogs/dialog_alert.dart';
import 'package:validatorless/validatorless.dart';

class RecoverPasswordDialog extends StatelessWidget {
  double sizeWidth;
  RecoverPasswordDialog({
    super.key,
    required this.sizeWidth,
  });

  TextEditingController _txtEmail = TextEditingController();
  final AuthController authController = GetIt.I.get<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Recuperação de Senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: sizeWidth * .05,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Digite seu email para recuperar sua senha:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: sizeWidth * .05,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: TextFieldCustom(
                label: 'Email',
                textInputType: TextInputType.emailAddress,
                controller: _txtEmail,
                prefixIcon: const Icon(Icons.email_rounded),
                validator: Validatorless.multiple([
                  Validatorless.required('Campo Obrigatório!'),
                  Validatorless.email('Digite um email válido!'),
                ]),
              ),
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
                            await authController.recoverPassword();
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => DialogAlert(
                                  txt:
                                      'Email pra recuperação de senha enviado com sucesso!',
                                  sizeWidth: sizeWidth,
                                  functions: {1: () => Navigator.pop(context)}),
                            );
                          }
                        },
                  child: authController.isLoading.value
                      ? Container(
                          width: sizeWidth * .045,
                          height: sizeWidth * .045,
                          child: CircularProgressIndicator(color: Colors.white))
                      : Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: sizeWidth * .038),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
