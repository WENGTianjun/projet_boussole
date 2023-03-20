import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Initialiser le mot de passe'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Recevez un mail pour initialiser votre mot de passe.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: 'Email'),
                    /*autovalidateMode: (email) =>
                    email != null && !EmailValidator.Validate
                        ?'E-mail invalide'
                        : null,*/
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: resetPassword,
                      child: Text('Initialiser mot de passe'))
                ],
              ),
            )
        )
    );
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar('Réinitialisation de mot de passe a été envoyée');
    } on FirebaseException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }
}