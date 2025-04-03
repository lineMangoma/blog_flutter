import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/pages/main.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'CreationCompte.dart';
import 'CreationCompteState.dart';

class CreationCompteController extends StateNotifier<CreationCompteState> {
  var blogServiceNetwork = getIt.get<BlogNetworkService>();
  var blogLocalService = getIt.get<BlogLocalService>();

  CreationCompteController() : super(CreationCompteState()) {
    //Init
  }

  bool valider(CreationCompte data) {
    if (data.password != data.password_confirmation) {
      state = state.copyWith(
        errorMsg: "le mot de passe ne correspond pas",
        isLoading: false,
      );
      return false;
    }
    return true;
  }

  Future<bool> soumettreFormulaire(CreationCompte data) async {
    state = state.copyWith(isLoading: true, );
    if (!valider(data)) return false;

    try {
      await blogServiceNetwork.creerCompte(data);
      state = state.copyWith(isLoading: false, isSucces: true);
      return true;
    } catch (e) {
      state = state.copyWith(errorMsg: e.toString(), isLoading: false);
    }
    return false;
  }
}

final CreerCompteControllerProvider =
    StateNotifierProvider<CreationCompteController, CreationCompteState>((ref) {
      return CreationCompteController();
    });
