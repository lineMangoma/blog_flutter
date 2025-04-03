import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/pages/main.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'CreationCompte.dart';
import 'CreationCompteState.dart';

class CreationCompteController extends StateNotifier<CreationCompteState>{
  var blogServiceNetwork = getIt.get<BlogNetworkService>();
   var blogLocalService = getIt.get<BlogLocalService>();
   CreationCompteController():super(CreationCompteState()){
  //Init
  }
  Future<void> soumettreFormulaire(CreationCompte data)async{
    
    state = state.copyWith(isLoading: true);
    if(!data.email.isEmpty && !data.password.isEmpty && !data.name.isEmpty){
      if(data.password == data.password_confirmation){
       try{
        await blogServiceNetwork.creerCompte(data);
        state=state.copyWith(isLoading: false,isSucces: true);
       }catch(e){
         state=state.copyWith(errorMsg: e.toString(),isLoading: false);
       }
      }
      else{
        state=state.copyWith(errorMsg: "le mot de passe ne correspond pas",isLoading: false);
      }
    }
    else{
      state=state.copyWith(errorMsg: "Tous les champs sont requis",isLoading: false);
    }

  }

}
final CreerCompteControllerProvider = StateNotifierProvider<CreationCompteController,CreationCompteState>((ref) {
  
 return CreationCompteController();
});