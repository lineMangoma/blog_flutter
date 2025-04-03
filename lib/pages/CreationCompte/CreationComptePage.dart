import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'CreationCompte.dart';
import 'CreationCompteController.dart';

class CreationComptePage extends ConsumerStatefulWidget{
  const CreationComptePage({super.key});

  @override
  ConsumerState<CreationComptePage> createState() => _CreationComptePage();
}


class _CreationComptePage extends ConsumerState<CreationComptePage> {
  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final name = TextEditingController();
    final password_confirmation = TextEditingController();
    var state=ref.watch(CreerCompteControllerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un compte",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),


                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: password_confirmation,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),


                ),

                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:(){

                         var controller = ref.read(CreerCompteControllerProvider.notifier);
                      controller.soumettreFormulaire(CreationCompte(name:name.text,password: passwordController.text,password_confirmation: password_confirmation.text,email: emailController.text));

                      if(state.errorMsg != null){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg!)));
                     }

                    },
                 child: Text("Soumettre"),
                )),
                 SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
);
  }
}