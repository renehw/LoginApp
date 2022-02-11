import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uber/screens/cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();

  final _focusEmail = FocusNode();
  final _controllerEmail = TextEditingController();

  final _focusSenha = FocusNode();
  final _controllerSenha = TextEditingController();

  bool mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  TextFormField(
                    key: _emailKey,
                    autocorrect: false,
                    controller: _controllerEmail,
                    focusNode: _focusEmail,
                    keyboardAppearance: Brightness.light,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 22.0,
                      ),
                      isDense: false,
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_focusSenha);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe seu e-mail';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    autocorrect: false,
                    controller: _controllerSenha,
                    keyboardAppearance: Brightness.light,
                    focusNode: _focusSenha,
                    obscureText: !mostrarSenha,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 22.0,
                        ),
                        suffix: buildIconPassword(),
                        isDense: true,
                        labelText: 'Senha',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder()),
                    onFieldSubmitted: (_) {
                      if (_formKey.currentState.validate()) {}
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe sua senha';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    height: 55.0,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: double.infinity),
                      child: ElevatedButton(
                          child: const Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child: GestureDetector(
                      child: const Text(
                        "Não tem conta? cadastre-se!",
                        style: TextStyle(fontSize: 17.0, color: Colors.white),
                      ),
                      onTap: () {
                        Future.delayed(const Duration(microseconds: 100), () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(builder: (BuildContext context) {
                              return const Cadastro();
                            }),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconPassword() {
    return GestureDetector(
      child: Icon(
        mostrarSenha ? Icons.visibility_off : Icons.visibility,
        size: 22.0,
      ),
      onTap: () {
        setState(() {
          mostrarSenha = !mostrarSenha;
        });
      },
    );
  }
}
