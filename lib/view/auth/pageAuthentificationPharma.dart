import 'package:flutter/material.dart';
import 'package:omegaa/view/pharmacie/pageEnregistrement.dart';
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';

import '../../controlers/controler_client.dart';
import '../../controlers/controler_pharmacie.dart';
import '../../controlers/controllerAuth.dart';
import 'package:omegaa/elper/navigation.dart';
import '../componentGenerale/ButtonCostom.dart';
import '../componentGenerale/Combobox.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/dialogue.dart';
import '../componentGenerale/entete.dart';
import '../componentGenerale/messageFlache.dart';
import '../leyouts/base.dart';
import 'component/Element.dart';
import 'component/blockAuth.dart';
import 'component/blockInt.dart';
import 'package:fluttertoast/fluttertoast.dart';


class pageAuthentificationPharma extends StatefulWidget {

  @override
  State<pageAuthentificationPharma> createState() => pageAuthentificationState();
}

class pageAuthentificationState extends State<pageAuthentificationPharma> {
 late  List<Widget> action;
 var valeurSecret=true;

 String login="";
 String password="";

 //couleurs utilisées
 var colorButton= Color.fromRGBO(50, 190, 166, 1);
 var colorInput=Color.fromRGBO(230, 230, 230,1);
 Color colorConnect=Colors.white24;

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size;
    double largInp=h.width-18;
    var longInp=55;

// les champs ici deux
    var login=  InputCostom(lar:longInp,long:largInp,couleurBorder: colorConnect,fonctions: (v){
     this.login=v;
    },
        value: "Entrez le login",
        couleur:colorInput
    );

    var mot_de_passe=   InputCostom(lar:longInp,changeAff:valeurSecret,estcache:true,long:largInp,couleurBorder: colorConnect,fonctions: (v){
      this.password=v;
    },
        value: "Entrez le mot de passe ",
        couleur:colorInput,fonctionCache: (){
          setState(() {
            if(valeurSecret==true){
              valeurSecret=false;
            }else{
              valeurSecret=true;
            }
          });

        }
    );


    return Scaffold(
        appBar:Entete(
            flecheR: false,
            context: context,
            title: "",
            pageCible: null,
            text: "",
          notification: false

        ).Demarrer(),

        body:Base(
            content:blockAuth(
              "Authentifiez-vous",
                blockInt(
                  [login.lancer(),
                    mot_de_passe.lancer()
                  ]
                ),
                ButtonCostom("Connexion",colorButton,(){

                     controllerAuth(context).connecter(this.login, this.password);

                }).lancer(),
            )  ,
            child: []
        ).lancer(390,h.width-25)
    );
  }


}











