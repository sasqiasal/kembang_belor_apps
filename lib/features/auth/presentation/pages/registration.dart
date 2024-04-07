import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kembang_belor_apps/features/auth/presentation/provider/register/bloc/register_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _viewPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                'Buat Akun',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return TextFormField(
                        onChanged: (value) => context
                            .read<RegisterBloc>()
                            .add(RegistrationNameChanged(value)),
                        decoration: InputDecoration(
                            hintText: 'Nama',
                            errorText: state.name.hasError
                                ? state.name.errorMessage
                                : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    buildWhen: (previous, current) =>
                        current.phoneNumber != previous.phoneNumber,
                    builder: (context, state) {
                      return TextFormField(
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegistrationPhoneNumberChanged(value)),
                          decoration: InputDecoration(
                              hintText: 'Nomor Telepon',
                              errorText: state.phoneNumber.hasError
                                  ? state.phoneNumber.errorMessage
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return TextFormField(
                        onChanged: (value) => context
                            .read<RegisterBloc>()
                            .add(RegistrationEmailAddressChanged(value)),
                        decoration: InputDecoration(
                            hintText: 'Email',
                            errorText: state.email.hasError
                                ? state.email.errorMessage
                                : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    buildWhen: (previous, current) =>
                        current.password != previous.password,
                    builder: (context, state) {
                      return TextFormField(
                        onChanged: (value) => context
                            .read<RegisterBloc>()
                            .add(RegistrationPasswordChanged(value)),
                        obscureText: !_viewPassword,
                        decoration: InputDecoration(
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
                            errorText: state.password.hasError
                                ? state.password.errorMessage
                                : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state.formSubmissionStatus ==
                            FormSubmissionStatus.success) {
                          Navigator.of(context).pop();
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              context
                                  .read<RegisterBloc>()
                                  .add(RegistrationRegisterButtonPressed());
                            },
                            child: Text(
                              state.isSubmitting() ? 'Submitting' : 'Register',
                              style: const TextStyle(fontSize: 16),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // SizedBox(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //       onPressed: () {},
                  //       icon: SvgPicture.asset(
                  //         'assets/images/google.svg',
                  //         height: 20,
                  //       ),
                  //       label: const Text(
                  //         'Registrasi Dengan Google',
                  //         style: TextStyle(fontSize: 16),
                  //       )),
                  // )
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                  TextSpan(
                      text: 'Login Sekarang',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pop())
                ]))
          ],
        ),
      ),
    );
  }
}
