
import 'package:blog_mobile/business/models/Authentification.dart';
import 'package:blog_mobile/business/models/User.dart';
import '../business/services/blogNetworkService.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

import '../pages/CreationCompte/CreationCompte.dart';

class BlogNetworkServiceImpl implements BlogNetworkService {
  @override
  Future<User> authentifier(Authentification data) async{
    //
    var url= Uri.parse("http://10.252.252.46:8000/api/login");
    var body=jsonEncode(data.toJson());
    var response= await http.post(
        url,
        body: body,
        headers: {"content-type":"application/json"}
    );

    var codes=[200,201];
    var resultat= jsonDecode(response.body) as Map; // Map

    if(!codes.contains(response.statusCode)){
      var error= resultat["error"];
      throw Exception(error);
    }
    var user=User.fromMap(resultat['data']);
    return user;
  }

  @override
  Future<User> creerCompte(CreationCompte donnee) async{
     var url= Uri.parse("http://10.20.20.227:8000/api/register");
    var body=jsonEncode(donnee.toMap());
    var response= await http.post(
        url,
        body: body,
        headers: {"content-type":"application/json"}
    );

    var codes=[200,201];
    var resultat= jsonDecode(response.body) as Map; // Map

    if(!codes.contains(response.statusCode)){
      var error= resultat["error"];
      throw Exception(error);
    }
    var user=User.fromMap(resultat['data']);
    return user;
  }

}

void main() async{
  var formulaire=Authentification(
      email: "test@gmail.com",
      password: "123456");
  var service=BlogNetworkServiceImpl();
  var user= await service.authentifier(formulaire);
  print(user.toMap());
}