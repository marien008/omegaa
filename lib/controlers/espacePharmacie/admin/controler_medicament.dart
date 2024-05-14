
import 'package:omegaa/elper/navigation.dart';
import '../../../models/modelMedicament.dart';
import '../../../session/Session.dart';
import '../../../view/gestionPharmacie/adminPharmacie/medicament/EnregistrementMedicament/EnregistrementMedicament.dart';
import '../../../view/gestionPharmacie/adminPharmacie/medicament/stockProduit.dart';

class Controler_medicament{

  var context;
  Controler_medicament(this.context);

  ajouter(){
    navigation(context,EnregistrementMedicament());
  }
  Future<String> Enregistrer(nom, forme, prix, dose, unite) async{
      int verificationProd= await ModelMedicament(nom:nom,forme: forme,prix: prix,dose: dose,unite: unite).ajouter();
      if(verificationProd==0){

        return "le produit existe deja ou le champ est vide ";
      }else{
        ajouter();
        return  "produit  ajouter avec succes ";
      }

  }

  voirStock()async{
    var tab=await ModelMedicament.afficher();
    print(await ModelMedicament.afficher());
    navigation(context, StockProduit(await ModelMedicament.afficher()));
  }
  modifier(dateExpiration, quantite,id_pharmacie,id_medicament,{quantite_paquet=0}) async {
    ModelMedicament.modifier(id_medicament, id_pharmacie,dateExpiration: dateExpiration,quantite: quantite,quantite_paquet:quantite_paquet );
    navigation(context, StockProduit(await ModelMedicament.afficher()));
  }

  verificationDateExp(){


  }

}


