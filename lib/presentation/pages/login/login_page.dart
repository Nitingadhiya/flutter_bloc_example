import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/bloc/login/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginState) {
            // print("state.email:-- ${state.email}");
            // print("state.password:-- ${state.password}");
            print("Validation msg:-- ${state.passwordValidation}");

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: context.read<LoginBloc>().formKey,
                child: Column(
                  children: [
                    const Text('Login Screen'),
                    SizedBox(height: 100),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      controller: context.read<LoginBloc>().txtEmailController,
                      onChanged: (value) => context.read<LoginBloc>().add(EmailEvent(value)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        errorText: state.passwordValidation != null ? state.passwordValidation : null,
                      ),
                      controller: context.read<LoginBloc>().txtPasswordController,
                      onChanged: (value) => context.read<LoginBloc>().add(PasswordEvent(value)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginSubmitted());
                          // context.pushNamed('home');
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
