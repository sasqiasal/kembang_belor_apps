import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Nama';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: !_viewPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Password';
                      }
                      return null;
                    },
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text(
                          'Registrasi',
                          style: TextStyle(fontSize: 16),
                        )),
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
                    text: 'Belum punya akun? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                  TextSpan(
                      text: 'Registrasi Sekarang',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Navigator.of(context).pushNamed('/registration'))
                ]))
          ],
        ),
      ),
    );
  }
}
