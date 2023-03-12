import 'package:app_todo_lovepeople/view/pages/signup.dart';
import 'package:app_todo_lovepeople/view/pages/task_list.dart';
import 'package:app_todo_lovepeople/view/pages/todo_register.dart';
import 'package:app_todo_lovepeople/view/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presenter/user_presenter_login.dart';
import '../widgets/textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscurePassword = true;
  final bool _isObscureConfirmPassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  /*void loginUser(TextEditingController email, TextEditingController password) {
    context
        .read()<UserPresenterLogin>()
        .loginUser(emailController.text, passwordController.text)
        .then((value) => {print(value)})
        .catchError((onError) {
      print(onError);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Consumer<UserPresenterLogin>(builder: (context, presenter, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(190))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'lib/view/assets/images/logo.png',
                        scale: 3,
                      ),
                    ),
                    const Text('Lovepeople',
                        style: TextStyle(
                          color: Color(0xFF3101B9),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: 'Montserrat-SemiBold',
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Que bom que voltou!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    fontFamily: 'Montserrat-SemiBold',
                  )),
              const SizedBox(
                height: 30,
              ),
              Textformfield(
                controller: _emailController,
                message: 'Email obrigatório',
                label: 'E-mail',
                height: 10,
                obscure: false,
              ),
              Textformfield(
                  controller: _passwordController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Esqueceu seu login ou a senha?',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Tahoma',
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  InkWell(
                    child: const Text(
                      ' Clique aqui.',
                      style: TextStyle(
                          color: Color(0xffFFD600), fontFamily: 'Tahoma'),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TodoRegister()));
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await presenter
                        .login(
                          _emailController.text,
                          _passwordController.text,
                        )
                        .whenComplete(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TaskList(),
                            ),
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        right: 22, left: 22, bottom: 10, top: 10),
                    side: const BorderSide(
                      width: 2.0,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color(0xff3101B9),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0)),
                  ),
                  child: const Text('Entrar',
                      style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold', fontSize: 20))),
              const SizedBox(
                height: 90,
              ),
              const Separator(
                color: Colors.white,
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não possui cadastro?',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tahoma',
                        fontSize: 18,
                      )),
                  InkWell(
                    child: const Text(
                      ' Clique aqui.',
                      style: TextStyle(
                          color: Color(0xffFFD600),
                          fontFamily: 'Tahoma',
                          fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Signup()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
