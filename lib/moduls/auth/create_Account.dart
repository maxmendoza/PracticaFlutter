import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/kernel/widgets/custom_text_field_password.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        centerTitle: false,
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Correo electronico',
                            labelText: 'Correo electronico',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _email,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFieldPassword(controller: _password),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFieldPassword(
                          controller: _confirmPassword,
                          hintText: 'Confirmar contraseña',
                          labelText: 'Confirmar contraseña',
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: _email.text,
                                          password: _password.text);
                                  print('credencial: $credential');
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }
                                Navigator.pushReplacementNamed(
                                    context, '/profile');
                              },
                              child: const Text('Crear cuenta')),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
