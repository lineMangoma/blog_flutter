import 'package:blog_mobile/pages/CreationCompte/CreationComptePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'LoginController.dart';



class LoginPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends ConsumerState<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    var state =ref.watch(loginControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: FloatingActionButton(
                onPressed:(){
                  var ctrl = ref.read(loginControllerProvider.notifier);
                  ctrl.soumettreFormulaire();
                },
             child: Text(state.isLoading==true? "Chargement ..." :"se connecter"),
            )),
             SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: FloatingActionButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreationComptePage()),
                  );
                },
             child: Text('Creer un compte'),   ),
            )
        
          ],
        ),
      ),
    ),
  ),
);
  }
}