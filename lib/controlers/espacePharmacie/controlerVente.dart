

import 'package:flutter/material.dart';
import 'package:omegaa/session/Session.dart';

import '../../elper/Idratation.dart';
import '../../elper/formatDate.dart';
import '../../elper/navigation.dart';
import '../../models/modelMedicament.dart';
import '../../models/modelVente.dart';
import '../../models/panier.dart';
import '../../view/componentGenerale/messageFlache.dart';
import '../../view/gestionPharmacie/panier/ajoutPanier.dart';
import '../../view/gestionPharmacie/panier/panier.dart';
import '../../view/gestionPharmacie/vente/venteJour.dart';
import 'controler_panier.dart';

class ControlerVent{
  var context;
  var d=DateTime.now();
  String heure=ajoutzeroDate(DateTime.now().hour.toString())+":"+ajoutzeroDate(DateTime.now().minute.toString())+":"+ajoutzeroDate(DateTime.now().second.toString());
  String date=ajoutzeroDate(DateTime.now().day.toString())+"-"+ajoutzeroDate(DateTime.now().month.toString())+"-"+ajoutzeroDate(DateTime.now().year.toString());
  ControlerVent(this.context);


  ajouterVente(List<List<String>> ligneVente,String nom) async{
   if( await Vente(date,heure,nom,Session.panier.FaireQualntite(),Session.panier.Fairetotal(),ligneVente).ajouter()==0){
     cPanier().viderPanier();

     navigation(context, AjoutPanier(await ModelMedicament.afficher()));
   };



    MessageFlache(message: "Vente ajouter avec succès");

  }
  ajouterUnevente(List<List<String>> ligneVente,String nom) async{

    print(ligneVente);
    var id=int.parse(ligneVente[0][0]);
    var quantite=ligneVente[0][3];

    Vente(date,heure,nom,Session.panier.FaireQualntite(),Session.panier.Fairetotal(),ligneVente).ajouter();
    cPanier().decrementationBd(id, quantite as List ,ligneVente[0][5] as int,);
    navigation(context, AjoutPanier(await ModelMedicament.afficher()));


  }

  voirVenteJour()async{
    navigation(context, VenteJour(IdratationVente(await Vente.voirVente())));
    print(await Vente.voirVente());
  }





}