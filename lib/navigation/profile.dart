import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Column(
                  children: [
                    Text(
                      'im.fer29',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hace 10 minutos',
                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert)
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Cerrar sesión'),
            ),
          )
        ]));
  }
}
