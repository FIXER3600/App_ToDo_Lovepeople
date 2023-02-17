import 'package:app_todo_lovepeople/view/pages/login.dart';
import 'package:app_todo_lovepeople/view/pages/signup_succsess.dart';
import 'package:app_todo_lovepeople/view/widgets/separator.dart';
import 'package:app_todo_lovepeople/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
      body: Form(
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
              controller: nameController,
              message: 'Nome obrigatório',
              label: 'Nome',
              height: 10,
            ),
            Textformfield(
              controller: emailController,
              message: 'Email obrigatório',
              label: 'Número de telefone, email ou CPF',
              height: 10,
            ),
            Textformfield(
              controller: passwordController,
              message: 'Senha obrigatória',
              label: 'Senha',
              height: 10,
            ),
            Textformfield(
              controller: confirmPasswordController,
              message: 'Confirme a senha',
              label: 'Confirmar senha',
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return const SignupSuccsess();
                    })));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 12, top: 12),
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xff3101B9),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text('Cadastrar',
                    style: TextStyle(fontFamily: 'Montserrat-SemiBold'))),
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
                    const Text(
                      'Já possui cadastro?',
                      style: TextStyle(color: Colors.white,
                      fontFamily: 'Tahoma')
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                      child: const Text(
                        ' Entrar',
                        style: TextStyle(color: Color(0xffFFD600), fontFamily: 'Tahoma'),
                      ),
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
