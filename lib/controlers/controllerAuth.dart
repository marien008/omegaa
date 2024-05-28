
import 'package:flutter/material.dart';
import 'package:omegaa/models/modelUtilisateur.dart';
import 'package:omegaa/view/auth/pageAuthentificationVendeur.dart';
import 'package:omegaa/elper/navigation.dart';
import '../models/modelClient.dart';
import '../models/modelPharmacie.dart';
import '../session/Session.dart';
import '../view/auth/pageAuthentificationClient.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/componentGenerale/messageFlache.dart';
import '../view/espaceClient/accueilClient.dart';
import '../view/gestionPharmacie/adminPharmacie/AcceuilAdmin.dart';
import 'controler_pharmacie.dart';
import 'espacePharmacie/controlerMedicament.dart';

class controllerAuth{
  var context;
  controllerAuth(this.context);
  authPhar(){
    navigation(context,pageAuthentificationPharma());

  }

   connecter(String login,String mot_de_passe)async{



    //var val =await ModelUtilisateur.connecter(login, mot_de_passe);
    if(login.toLowerCase() =="omega" && mot_de_passe.toLowerCase()=="omega"){
      Session.id_connect=1;
      MessageFlache(message: "Bienvenue");
      Controler_pharmacie.existe();
      ControlerMedicament.verificationQuantite();
        navigation(context,pageAccueille());
    }else{

      MessageFlache(message: "Pharmacie introuvable");
    }

    }

  deconnecter(){
    ModelUtilisateur.deconnection();
    navigation(context,pageAuthentificationPharma());
  }
  }


