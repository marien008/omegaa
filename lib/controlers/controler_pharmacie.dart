


import '../elper/navigation.dart';
import '../models/modelPharmacie.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/gestionPharmacie/adminPharmacie/medicament/EnregistrementMedicament/EnregistrementMedicament.dart';
import '../view/pharmacie/pageEnregistrement.dart';

class Controler_pharmacie{

  var context;
  Controler_pharmacie(this.context);


  ajouter(){
    navigation(context,pageEnregistrement());
  }

  Enregistrer(nom_pharmacie,login,mot_de_passe,conf)async{


    ModelPharmacie("omega","omega","omega").ajouter();

    print(await ModelPharmacie.affId(2));
    navigation(context,pageAuthentificationPharma());
  }

}