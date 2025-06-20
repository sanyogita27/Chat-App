import 'package:chat_app/bloc/auth/auth_bloc.dart';
import 'package:chat_app/bloc/auth/auth_event.dart';
import 'package:chat_app/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _register() {
    context.read<AuthBloc>().add(
          AuthRegisterRequested(
            emailController.text.trim(),
            passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 400,
                  child: TextField(
                    obscureText: false,
                    controller: emailController, decoration: const InputDecoration(labelText: "Email"
                  ,
                  border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue
                    ,
                    width: 2.0
                  )
                  )

                    ))),
                TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: _register, child: const Text("Register")),
              ],
            ),
          );
        },
      ),
    );
  }
}
