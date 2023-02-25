import 'package:flutter/material.dart';

import '../widgets/textformfield.dart';

class Login extends StatelessWidget {
  Login({super.key});
  const Signup({super.key});

  State<Signup> createState() => _SignupState();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  class _SignupState extends State<Signup> {
  bool isObscurePassword = true;
 bool isObscureConfirmPassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA901F7),
      body: Column(
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
          Textformfield(
            controller: emailController,
            message: 'Email obrigatório',
            label: 'Email',
            height: 10,
            obscure: false,
          ),
          Textformfield(
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
                    icon: Icon(
                        _isObscurePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                )),        
        ],
      ),
    );
  }
}
