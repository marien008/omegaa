

import '../../elper/navigation.dart';
import '../../models/modelMedicament.dart';
import '../../view/gestionPharmacie/adminPharmacie/medicament/stockProduit.dart';
import '../../view/gestionPharmacie/panier/ajoutPanier.dart';

class ControlerMedicament{
  var context;

  ControlerMedicament(context){
    this.context=context;
  }

  rechercherVente(String medoc)async{
    navigation(context, AjoutPanier(await ModelMedicament.rechercher(medoc)));

  }
  rechercherStock(String medoc)async{
    navigation(context, StockProduit(await ModelMedicament.rechercher(medoc)));

  }

  verificationQuantite(){

}

}