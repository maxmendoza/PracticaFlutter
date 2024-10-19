import 'package:flutter/material.dart';

class Correo extends StatefulWidget {
  const Correo({super.key});

  @override
  State<Correo> createState() => _LoginState();
}

class _LoginState extends State<Correo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    // Expresión regular para validar un correo electrónico
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null; // Si es válido, no devuelve ningún error
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar codigo'),
        centerTitle: false,
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                    validator: validateEmail,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Correo electronico',
                        label: Text('Correo electronico')),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(height: 50, width: double.infinity),
                //print('Datos -> ${_emailController.text} ${_passwordController.text}')
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/codigo');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: const Text('Enviar codigo')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
