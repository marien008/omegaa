import 'package:flutter/material.dart';
import 'package:omegaa/view/pharmacie/pageEnregistrement.dart';
import '../../controlers/controler_client.dart';
import '../../controlers/controler_pharmacie.dart';
import '../../controlers/controllerAuth.dart';
import 'package:omegaa/elper/navigation.dart';
import '../componentGenerale/ButtonCostom.dart';
import '../componentGenerale/Combobox.dart';
import '../componentGenerale/InputCostom.dart';
import '../componentGenerale/dialogue.dart';
import '../componentGenerale/entete.dart';
import '../leyouts/base.dart';
import 'component/Element.dart';
import 'component/blockAuth.dart';
import 'component/blockInt.dart';



class pageAuthentificationPharma extends StatefulWidget {
  static String login="";
  static String password="";
  @override
  State<pageAuthentificationPharma> createState() => pageAuthentificationState();
}
class pageAuthentificationState extends State<pageAuthentificationPharma> {
 late  List<Widget> action;
  @override
  Widget build(BuildContext context) {
    action=[
      ButtonCostom("Client", Colors.red,taille: 2, (){

        Controler_client(context).ajouter();

      },
      ).lancer(),
      ButtonCostom("Pharm", Color.fromRGBO(50, 190, 166, 1),taille: 2, (){
        Controler_pharmacie(context).ajouter();

      },
      ).lancer(),
    ];

    var h=MediaQuery.of(context).size;
    double largInp=h.width-18;
    var longInp=55;

    var colorButton= Color.fromRGBO(50, 190, 166, 1);
    var colorInput=Color.fromRGBO(230, 230, 230,1);
    return Scaffold(
        appBar:Entete(
            flecheR: false,
            context: context,
            title: "",
            pageCible: null,
            text: "",
            logo: null
        ).Demarrer(),
        body:Base(
            content:blockAuth(
              "Authentifiez-vous",
                blockInt(
                    InputCostom(lar:longInp,long:largInp,fonctions: (v){
                      pageAuthentificationPharma.login=v;
                    },
                        value: "Entrez le login ",
                        couleur:colorInput
                    ).lancer(),
                    InputCostom(lar:longInp,long:largInp,fonctions: (v){
                      pageAuthentificationPharma.password=v;
                    },
                        value: "Entrez le mot de passe ",
                        couleur:colorInput
                    ).lancer(),
                  [
                    Elemt("Creer un compte",(){
                      AlertDialogue(
                          Title: "Message",
                          contenue: "Voulez-vous créer un compte ?",
                          action:action,fonctionExte: (){

                      }
                      ).lancer(context);

                    }),
                    Elemt("Mot de passe oublier ?",(){})
                  ]

                ),
                ButtonCostom("Connexion",colorButton,(){
                  controllerAuth(context).connecter( pageAuthentificationPharma.login,
                      pageAuthentificationPharma.password);
                }).lancer()
            )  ,
            child: [
//InkWell(
  //child: Text("Connecter Client?"),
//)

            ]
        ).lancer(390,h.width-25)
    );
  }


}











