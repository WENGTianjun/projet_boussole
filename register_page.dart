import 'package:boussole/Utils.dart';
import 'package:boussole/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:boussole/main.dart';
class Register extends StatefulWidget {
  final Function() onClickedSignIn;
  const Register({
    Key? key,
    required this.onClickedSignIn,
}): super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passewordController = TextEditingController();

  void disposee() {
    emailController.dispose();
    passewordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)=> SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Text(
            'Inscription',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
          SizedBox(height: 40),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length<6
                ? 'Email invalide'
                : null,
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: passewordController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length<6
                ? 'Entrer au moins 6 caractères'
                : null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: signUp,
              child:
              Text('Inscrire', style: TextStyle(fontSize: 30))),
          SizedBox(height: 20),
          RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 20),
                text: 'Déja eu un compte?',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                    text: 'Connecter',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary
                    )
                  )
                ]
              ))
        ],
      ),
    )
  );
  Future signUp() async{
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passewordController.text.trim()
      );
    }on FirebaseAuthException catch(e){
      print(e);
      Utils.showSnackBar(e.message);
    }
  }
  }