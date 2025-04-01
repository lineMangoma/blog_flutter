

import 'package:blog_mobile/business/pages/listArticles/listArticleState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Listarticlectrl extends StateNotifier <ListeArticlesState>{
  Listarticlectrl():super(ListeArticlesState()){
  //Init
  }
  Future<void> recupererArticles() async{}
  Future<void> rechercher(String text) async{}
  Future<void> liker(int articleId) async{}
  Future<void> partager(int id) async{}
  Future<void> filterParCategorie(int categorieId) async{}
  Future<void> trier(String colonne,String ordre) async{}
  Future<void> chargerPage() async{}
}