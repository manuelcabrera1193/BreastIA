import 'package:breast_ia/screens/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  static const String routerName = '/Auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _error = "";

  String _email = "";

  String _password = "";

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Theme.of(context).colorScheme.background,
              Colors.orange[400]!,
              Colors.orange[900]!
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 40),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Login",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Bienvenido",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      blurRadius: 20,
                                      offset: const Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (!esCorreoValido(input ?? "")) {
                                        return 'email invalid';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) {
                                      setState(() {
                                        _error = "";
                                      });
                                      _email = input ?? "";
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Usuario",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (input) {
                                      var large = input?.length ?? 0;
                                      if (large < 6) {
                                        return 'Your password needs to be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) {
                                      setState(() {
                                        _error = "";
                                      });
                                      _password = input ?? "";
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]),
                            child: MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  _error = "";
                                });
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _formKey.currentState?.save();
                                  _error = await authController.login(
                                      _email, _password);
                                }
                                setState(() {});
                              },
                              child: const Center(
                                child: Text(
                                  "Ingresar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red),
                            child: MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  _error = "";
                                });
                                _error = await authController.loginGoogle();

                                setState(() {});
                              },
                              child: const Center(
                                child: Text(
                                  "Ingresar con Google",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            _error,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool esCorreoValido(String correo) {
    // Expresión regular para validar correos electrónicos
    final correoRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    // Compara el valor de entrada con la expresión regular y devuelve un booleano
    return correoRegex.hasMatch(correo);
  }
}
