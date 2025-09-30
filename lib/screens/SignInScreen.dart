import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) =>
                value != null && value.contains("@") ? null : "Invalid email",
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) =>
                value != null && value.length >= 6 ? null : "Min 6 characters",
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Success"),
                        content: const Text("Account sign-in successfully"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                              const HomeScreen(),
                              transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                              opacity: animation,
                              child: child,
                              );
                              },
                              transitionDuration: const Duration(milliseconds: 700),
                              ),
                              );
                              },

                            child: const Text("Close"),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
