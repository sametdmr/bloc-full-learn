import 'package:bloc_full_learn/104-bloc-with-firebase/bloc/app_event.dart';
import 'package:bloc_full_learn/104-bloc-with-firebase/extensions/if_debugging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/app_bloc.dart';

class RegisterView extends HookWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'sametdemir@at.com'.ifDebugging,
    );

    final passwordController = useTextEditingController(
      text: 'atadam'.ifDebugging,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email here...',
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password here...',
              ),
              keyboardAppearance: Brightness.dark,
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AppBloc>().add(
                      AppEventRegister(
                        email: email,
                        password: password,
                      ),
                    );
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () {
                context.read<AppBloc>().add(
                      const AppEventGoToLogin(),
                    );
              },
              child: const Text('Already registired? Login here!'),
            ),
          ],
        ),
      ),
    );
  }
}
