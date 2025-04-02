
import 'package:blog_mobile/business/CreationCompte/CreationCompte.dart';
import 'package:blog_mobile/business/CreationCompte/CreationCompteController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Creationcomptepage extends ConsumerStatefulWidget{
  const Creationcomptepage({super.key});

  @override
  ConsumerState<Creationcomptepage> createState() => _CreationcomptepageState();
}
final emailController = TextEditingController();
final passwordController = TextEditingController();
final name = TextEditingController();
final password_confirmation = TextEditingController();



class _CreationcomptepageState extends ConsumerState<Creationcomptepage> {
  @override
  Widget build(BuildContext context) {
    var state=ref.watch(CreerCompteControllerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an account",style: TextStyle(fontWeight: FontWeight.bold),),
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
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: emailController,
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
                
                controller: passwordController,
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
              width: 300,
              child: FloatingActionButton(
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