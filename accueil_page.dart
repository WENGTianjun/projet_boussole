import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'E-mail',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: ()=>FirebaseAuth.instance.signOut(),
                child: Text('Déconnexion',style: TextStyle(fontSize: 20),))
          ],
        )
      )
    );
}


}
