import 'package:flornanda/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  bool isAuth = false;
  bool _isLogin = true;
  String _enteredEmail = '';
  String _enteredPassword = '';
  var _isAuthenticating = false;

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  Future<bool> _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      // show error message ...
      return false;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });

      if (_isLogin) {
        await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      }
      isAuth = true;
    } on FirebaseAuthException catch (error) {
      showSnackBar(error.message ?? 'Autentição falhou');
    }
    setState(() {
      _isAuthenticating = false;
    });
    return isAuth;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Por favor entre um email válido.';
                            }

                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'A senha deve ter pelo menos 6 caracteres.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(height: 12),
                        if (_isAuthenticating)
                          const CircularProgressIndicator(),
                        if (!_isAuthenticating)
                          FilledButton(
                            onPressed: () {
                              _submit().then((isAuth) {
                                if (isAuth) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductsScreen(),
                                    ),
                                  );
                                }
                              });
                            },
                            child: Text(_isLogin ? 'Login' : 'Cadastrar'),
                          ),
                        if (!_isAuthenticating)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Criar uma conta'
                                : 'Já tenho uma conta'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
