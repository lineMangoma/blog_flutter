import 'package:blog_mobile/business/models/Authentification.dart';
import 'package:blog_mobile/business/models/User.dart';

import '../../pages/CreationCompte/CreationCompte.dart';

abstract class BlogNetworkService{
  Future<User> authentifier(Authentification data );
  Future<User> creerCompte(CreationCompte donnee);
}
