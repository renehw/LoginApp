import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();

  final _focusEmail = FocusNode();
  final _focusConfirmEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _controllerEmail = TextEditingController();
  final _controllerConfirmEmail = TextEditingController();
  final _controllerSenha = TextEditingController();

  bool _typeUserPassenger = false;
  bool mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: _emailKey,
                      controller: _controllerEmail,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.light,
                      focusNode: _focusEmail,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_focusConfirmEmail);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Inform your E-mail';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _controllerConfirmEmail,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.light,
                      focusNode: _focusConfirmEmail,
                      decoration: const InputDecoration(
                        labelText: 'Confirm E-mail',
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_focusPassword);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Provide your Confirmation E-mail';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _controllerSenha,
                      autocorrect: false,
                      obscureText: !mostrarSenha,
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(),
                        suffix: buildIconPassword(),
                      ),
                      onFieldSubmitted: (_) {
                        if (_formKey.currentState.validate()) {}
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Inform your Password';
                        }

                        return null;
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    const Text('Passenger'),
                    Switch(
                      value: _typeUserPassenger,
                      onChanged: (bool value) {
                        setState(() {
                          _typeUserPassenger = value;
                        });
                      },
                    ),
                    const Text('Driver'),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 55.0,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: ElevatedButton(
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                      }),
                ),
              ),
            ],
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
