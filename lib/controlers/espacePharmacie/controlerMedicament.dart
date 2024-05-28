

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../elper/navigation.dart';
import 'dart:async';
import '../../models/modelMedicament.dart';
import '../../view/gestionPharmacie/adminPharmacie/medicament/stockProduit.dart';
import '../../view/gestionPharmacie/notificationPharmacie.dart';
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
  VoirNotif() async {
    var notifcations= await ModelMedicament.voirNotification();

   navigation(context, Notification(notifcations));
  }


  static verificationQuantite()async{

    var t;
    Timer.periodic(Duration(seconds: 1), (timer)async {
     t=await ModelMedicament.verificationDateExp();


      if( t==true){

        FlutterRingtonePlayer.playNotification();
      }
    });

    return t;
}

}