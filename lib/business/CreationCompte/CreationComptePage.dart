

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Creationcomptepage extends ConsumerStatefulWidget{
  const Creationcomptepage({super.key});

  @override
  ConsumerState<Creationcomptepage> createState() => _CreationcomptepageState();
}

class _CreationcomptepageState extends ConsumerState<Creationcomptepage> {
  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(height: 20),
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
                  labelText: 'Password',
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