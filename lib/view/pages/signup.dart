import 'package:app_todo_lovepeople/presenter/user_presenter.dart';
import 'package:app_todo_lovepeople/view/pages/login.dart';
import 'package:app_todo_lovepeople/view/widgets/separator.dart';
import 'package:app_todo_lovepeople/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Consumer<UserPresenter>(
        builder: (context, value, child) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Vamos começar!',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Montserrat-SemiBold'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Textformfield(
                  onChanged: value.setUsername,
                  controller: nameController,
                  message: 'Nome obrigatório',
                  label: 'Nome',
                  height: 10,
                  obscure: false,
                ),
                Textformfield(
                  onChanged: value.setNumberEmailCpf,
                  controller: emailController,
                  message: 'Email obrigatório',
                  label: 'Número de telefone, email ou CPF',
                  height: 10,
                  obscure: false,
                ),
                Textformfield(
                    onChanged: value.setPassword,
                    controller: passwordController,
                    message: 'Senha obrigatória',
                    label: 'Senha',
                    height: 10,
                    obscure: _isObscurePassword,
                    sufix: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscurePassword = !_isObscurePassword;
                          });
                        },
                        color: const Color(0xFFA901F7),
                        icon: Icon(_isObscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    )),
                Textformfield(
                    onChanged: value.setConfirmPassword,
                    controller: confirmPasswordController,
                    message: 'Confirme a senha',
                    label: 'Confirme a senha',
                    height: 10,
                    obscure: _isObscureConfirmPassword,
                    sufix: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscureConfirmPassword =
                                !_isObscureConfirmPassword;
                          });
                        },
                        color: const Color(0xFFA901F7),
                        icon: Icon(_isObscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      value.validateSignUp();
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      bool? isAuth = sharedPreferences.getBool('isAuth');
                      await value.registerUser(nameController.text,
                          emailController.text, passwordController.text);
                      if ((value.isSignUpValid &&
                              _formKey.currentState!.validate()) &&
                          isAuth != null &&
                          isAuth) {
                        Navigator.pushNamed(context, 'succsess');
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Dados inválidos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff3101B9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.white,
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, bottom: 15, top: 15),
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      backgroundColor: const Color(0xff3101B9),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                    ),
                    child: const Text('Cadastrar',
                        style: TextStyle(
                            fontFamily: 'Montserrat-SemiBold', fontSize: 20))),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Separator(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já possui cadastro?',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Tahoma')),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const Login();
                            }));
                          },
                          child: const Text(
                            ' Entrar',
                            style: TextStyle(
                                color: Color(0xffFFD600), fontFamily: 'Tahoma'),
                          ),
                        ),
                        const SizedBox(height: 100)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
