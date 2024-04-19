
import 'package:flutter/material.dart';
import 'package:omegaa/models/modelUtilisateur.dart';
import 'package:omegaa/view/auth/pageAuthentificationVendeur.dart';
import 'package:omegaa/elper/navigation.dart';
import '../models/modelClient.dart';
import '../models/modelPharmacie.dart';
import '../view/auth/pageAuthentificationClient.dart';
import '../view/auth/pageAuthentificationPharma.dart';
import '../view/espaceClient/accueilClient.dart';
import '../view/gestionPharmacie/adminPharmacie/AcceuilAdmin.dart';

class controllerAuth{
  var context;
  controllerAuth(this.context);
  authPhar(){
    navigation(context,pageAuthentificationPharma());
  }
  connecter(String login,String mot_de_passe)async{
    var val =await ModelUtilisateur.connecter(login, mot_de_passe);
    if(val[0]==true){
      if(val[1]=="cli"){
        print("connecter");
        navigation(context,accuilleClient([]));
      }
      else if(val[1]=="phar"){
        print("connecter");
        navigation(context,pageAccueille());
      }else {
        print("connection impossible ");
      }
    }
    }

  deconnecter(){
    ModelUtilisateur.deconnection();
    navigation(context,pageAuthentificationPharma());
  }
  }


