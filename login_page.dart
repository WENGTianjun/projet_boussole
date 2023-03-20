
import 'package:boussole/ForgotPasswordPage.dart';
import 'package:boussole/accueil_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boussole/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passewordController = TextEditingController();

  void disposee() {
    emailController.dispose();
    passewordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  const Text(
                    "Connexion",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),

                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passewordController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),

                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    child: Text(
                      'Mot de passe oublié?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 20,
                      )
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgotPasswordPage()))
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40)
                      ),
                      onPressed: () {
                        connecter();
                      },
                      child:
                      Text('Connecter ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                  ),
                  SizedBox(height: 30),
                  RichText(text: TextSpan(
                    text: "Créer un compte",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp
                  )
                  )

                ],
              )
          ),

        ],

      ),
    );
  }

  Future connecter() async {

    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passewordController.text.trim());
    /*FirebaseAuth.instance.authStateChanges().listen((User?user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.of(context).push(MaterialPageRoute(builder: (
            BuildContext context) => LoginPage()));
      } else {
        // !!!!! Here you know the user is signed-in !!!!!
        Navigator.of(context).push(MaterialPageRoute(builder: (
            BuildContext context) => Accueil()));
        print('User is signed in!');
      }
    });*/}on FirebaseException catch(e){
      print(e);
    }

  }
}
