
import 'package:blog_mobile/business/CreationCompte/CreationCompteState.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreationCompteController extends StateNotifier<CreationCompteState>{
   CreationCompteController():super(CreationCompteState()){
  //Init
  }
  Future<void> ValidationForm()async{}
  Future<void> soumettreFormulaire()async{}

}
final loginControllerProvider = StateNotifierProvider<CreationCompteController,CreationCompteState>((ref) {
  
 return CreationCompteController();
});