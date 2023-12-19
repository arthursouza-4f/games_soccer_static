import 'package:flutter/material.dart';
import 'package:games_soccer_static/screens/home.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/auth/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Color borderTextField = Color.fromARGB(193, 231, 237, 235);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0c9762), Color(0xff066f4c)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: const Text('Registro',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                  child: const Text('Entre e comece a jogar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  width: double.infinity,
                  height: 76.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(35),
                          topStart: Radius.circular(35))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: const Color.fromARGB(193, 231, 237, 235),
                            border: Border.all(
                              color: borderTextField, // Cor do border
                              width: 2.0, // Largura do border
                            ),
                          ),
                          child: TextField(
                            onChanged: (_) {
                              setState(() {
                                borderTextField = Colors
                                    .transparent; // Reseta a cor quando o texto muda
                              });
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: const Color(0xFF404241),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "Seu Email",
                            ),
                          ),
                        ),
                        Container(
                          width: 80.w,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: const Color.fromARGB(193, 231, 237, 235),
                            border: Border.all(
                              color: borderTextField, // Cor do border
                              width: 2.0, // Largura do border
                            ),
                          ),
                          child: TextField(
                            onChanged: (_) {
                              setState(() {
                                borderTextField = Colors
                                    .transparent; // Reseta a cor quando o texto muda
                              });
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              prefixIconColor: const Color(0xFF404241),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: "Sua Senha",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0c9762),
                              elevation: 5, // Sombra do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Borda circular
                              ),

                              fixedSize: Size(80.w, 50),
                            ),
                            onPressed: () async {
                              var errorMessage =
                                  await authController.makeRegister(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              if (errorMessage == true) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    (Route<dynamic> route) => false);
                              } else {
                                // Exibe a mensagem de erro no SnackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                  ),
                                );
                                setState(() {
                                  borderTextField = Colors.red;
                                });
                              }
                            },
                            child: const Text(
                              'Registrar',
                              style: TextStyle(fontSize: 19),
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não tem uma conta ?'),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Crie Agora'))
                          ],
                        )
                      ]),
                ),
              ]),
        ));
  }
}
