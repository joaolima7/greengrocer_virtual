import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/dialogs/recover_password_dialog.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = GetIt.I.get<AuthController>();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtSenha = TextEditingController();

  // Lista de dados para o carrossel
  final List<Map<String, String>> carouselData = [
    {
      'image': 'assets/images/img1.jpg',
      'text': 'Ofertas fresquinhas para você!'
    },
    {'image': 'assets/images/img2.jpg', 'text': 'Entregamos na sua porta.'},
    {
      'image': 'assets/images/img3.jpg',
      'text': 'Produtos orgânicos e de qualidade.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Carrossel na parte superior
          SizedBox(
            width: sizeScreen.width,
            height: sizeScreen.height,
            child: Column(
              children: <Widget>[
                // Seção do Carrossel
                Container(
                  height: sizeScreen.height * 0.4, // Ajuste conforme necessário
                  child: CarouselSlider(
                    options: CarouselOptions(
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      height: sizeScreen.height * 0.4,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                    ),
                    items: carouselData.map((item) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          // Imagem de fundo
                          Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                          // Sobreposição com opacidade
                          Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                          // Conteúdo sobre a imagem
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Nome do App
                                Text(
                                  'GreenGrocer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sizeScreen.width * 0.08,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Texto do Carrossel
                                Text(
                                  item['text']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sizeScreen.width * 0.05,
                                    fontWeight: FontWeight.w500,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Formulário posicionado abaixo do carrossel
          Positioned(
            top: sizeScreen.height * 0.35, // Ajuste para sobrepor o carrossel
            left: 0,
            right: 0,
            child: Container(
              // Utilizamos um Padding para centralizar horizontalmente
              padding: EdgeInsets.symmetric(
                horizontal: sizeScreen.width * .075,
                // Reduzimos o padding vertical para evitar excesso de espaço
                vertical: sizeScreen.height * .02,
              ),
              // Ajustamos o tamanho do Container para se adaptar ao conteúdo
              // e utilizamos uma BoxDecoration com bordas arredondadas
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: sizeScreen.height * 0.02),
                    TextFieldCustom(
                      label: 'Email',
                      textInputType: TextInputType.emailAddress,
                      controller: _txtEmail,
                      prefixIcon: const Icon(Icons.email),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo Obrigatório!'),
                        Validatorless.email('Digite um email válido!'),
                      ]),
                    ),
                    SizedBox(height: sizeScreen.height * 0.015),
                    TextFieldCustom(
                      label: 'Senha',
                      controller: _txtSenha,
                      prefixIcon: const Icon(Icons.lock),
                      isSecret: true,
                      isObscure: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo Obrigatório!'),
                        Validatorless.min(
                            6, 'A senha deve ter pelo menos 6 caracteres!'),
                      ]),
                    ),
                    SizedBox(height: sizeScreen.height * 0.015),
                    GetX<AuthController>(
                      init: authController,
                      builder: (authController) {
                        return ElevatedButton(
                          onPressed: authController.isLoading.value
                              ? null
                              : () async {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    await authController.signIn(
                                      email: _txtEmail.text,
                                      password: _txtSenha.text,
                                      context: context,
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: sizeScreen.height * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: authController.isLoading.value
                              ? SizedBox(
                                  width: sizeScreen.width * .045,
                                  height: sizeScreen.width * .045,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: sizeScreen.width * .038,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => RecoverPasswordDialog(
                                sizeWidth: sizeScreen.width),
                          );
                        },
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: sizeScreen.height * 0.02,
                        ),
                        side: BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: sizeScreen.width * .038,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
