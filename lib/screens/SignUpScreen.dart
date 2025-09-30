import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter your name";
                  if (value[0] != value[0].toUpperCase()) {
                    return "First letter must be uppercase";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),

              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
                validator: (value) =>
                value == _passwordController.text ? null : "Passwords don’t match",
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
                        content: const Text("Account created successfully"),
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
                              transitionDuration: const Duration(seconds: 2),
                              ),
                              );
                              },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            child: const Text("Close"),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
