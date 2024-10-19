import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Codigo extends StatefulWidget {
  const Codigo({super.key});

  @override
  State<Codigo> createState() => _LoginState();
}

class _LoginState extends State<Codigo> {
  final TextEditingController _numeroController = TextEditingController();

  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar codigo'),
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
                  controller: _numeroController,
                  decoration: const InputDecoration(
                      hintText: 'Codigo de verificacion',
                      label: Text('Codigo de verificacion')),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Solo permite números
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa el codigo';
                    }
                    return null; // Si el valor es válido
                  },
                ),
                const SizedBox(height: 35),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 50, width: double.infinity),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/contrasena');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      child: const Text('Validar codigo')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
