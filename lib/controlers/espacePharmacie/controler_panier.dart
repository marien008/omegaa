
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:omegaa/controlers/controler_pharmacie.dart';
import '../../elper/navigation.dart';
import '../../models/modelMedicament.dart';
import '../../models/modelPharmacie.dart';
import '../../models/panier.dart';
import '../../view/componentGenerale/messageFlache.dart';
import '../../view/gestionPharmacie/panier/ajoutPanier.dart';
import '../../view/gestionPharmacie/panier/panier.dart';
import 'controlerMedicament.dart';

class Controler_panier{
  var context;

  Controler_panier(this.context);

creerPanier(){
  cPanier().createPanier();
}
 ajouterAuPanier()async{

    navigation(context, AjoutPanier(await ModelMedicament.afficher()));
  }

  Enregistrer(var element,int index) async{

      if(await cPanier().ajouterElement(element)==0){

        await navigation(context, AjoutPanier(await ModelMedicament.afficher(),index: 1,));
      }

  }

  voirPanier(){
    navigation(context,PanierVente(cPanier().afficheContenu()[0],cPanier().afficheContenu()[1]));
  }
  vider(){
    cPanier().viderPanier();
  }

  remettre()async{


  var val =await  cPanier().remettreElement();
  print(val);
    if(val==0){
      navigation(context, AjoutPanier(await ModelMedicament.afficher()));

      MessageFlache(message: "Vous avez annulé le panier");

    }


  }







}