import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/auth/bloc/auth_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/login/bloc/login_bloc.dart';
import 'package:svg_flutter/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _viewPassword = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MultiBlocListener(
            listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Email Atau Passoword Anda Salah')));
              }
            },
          ),
          BlocListener<AuthBloc, AuthStates>(
            listener: (context, state) {
              if (state is AuthUserUnauthenticated) {
                Navigator.of(context).pushReplacementNamed('/login');
              }
              if (state is AuthUserAuthenticated) {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            },
          )
        ],
            child: Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'Hi, Welcome Back! 👋',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                'Email',
                                style: TextStyle(fontSize: 14),
                              )),
                          BlocBuilder<LoginBloc, LoginState>(
                            buildWhen: (previous, current) =>
                                current.email != previous.email,
                            builder: (context, state) {
                              return TextFormField(
                                controller: _emailController,
                                onChanged: (value) => context
                                    .read<LoginBloc>()
                                    .add(
                                        LoginEmailAddressChanged(email: value)),
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    errorText: state.email.hasError
                                        ? state.email.errorMessage
                                        : null,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                'Password',
                                style: TextStyle(fontSize: 14),
                              )),
                          BlocBuilder<LoginBloc, LoginState>(
                            buildWhen: (previous, current) =>
                                current.password != previous.password,
                            builder: (context, state) {
                              return TextFormField(
                                obscureText: !_viewPassword,
                                controller: _passwordController,
                                onChanged: (value) {
                                  context.read<LoginBloc>().add(
                                      LoginPasswordChanged(password: value));
                                },
                                decoration: InputDecoration(
                                    errorText: state.password.hasError
                                        ? state.password.errorMessage
                                        : null,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _viewPassword = !_viewPassword;
                                          });
                                        },
                                        icon: Icon(_viewPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              );
                            },
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text('Lupa Password'))),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                    onPressed: () =>
                                        state.isSubmitting() || !state.isValid
                                            ? null
                                            : context
                                                .read<LoginBloc>()
                                                .add(LoginButtonPressed()),
                                    child: Text(
                                      state.isSubmitting()
                                          ? 'Submitting'
                                          : 'Login',
                                      style: const TextStyle(fontSize: 16),
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Row(children: [
                            Expanded(child: Divider()),
                            Text("  Or With  "),
                            Expanded(child: Divider()),
                          ]),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  context
                                      .read<LoginBloc>()
                                      .add(GoogleButtonPressed());
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/google.svg',
                                  height: 20,
                                ),
                                label: const Text(
                                  'Login Dengan Google',
                                  style: TextStyle(fontSize: 16),
                                )),
                          )
                        ],
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: Theme.of(context).textTheme.titleSmall,
                            children: [
                          TextSpan(
                              text: 'Registrasi Sekarang',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamed('/registration'))
                        ]))
                  ],
                ),
              ),
            )));
  }
}
