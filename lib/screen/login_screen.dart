import 'package:flornanda/screen/products_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                const TextField(
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const TextField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProductsScreen(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
