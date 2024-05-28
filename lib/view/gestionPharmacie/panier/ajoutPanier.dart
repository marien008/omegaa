import 'package:flutter/material.dart';
import 'package:omegaa/elper/navigation.dart';
import '../../../controlers/espacePharmacie/admin/controler_medicament.dart';
import '../../../controlers/espacePharmacie/controlerMedicament.dart';
import '../../../controlers/espacePharmacie/controlerVente.dart';
import '../../../controlers/espacePharmacie/controler_panier.dart';
import '../../../elper/Stringifier.dart';
import '../../../models/modelMedicament.dart';
import '../../../session/Session.dart';
import '../../componentGenerale/ButtonCostom.dart';
import '../../componentGenerale/Combobox.dart';
import '../../componentGenerale/InputCostom.dart';
import '../../componentGenerale/InputRecherche.dart';
import '../../componentGenerale/SwitchCostum.dart';
import '../../componentGenerale/alertAjoutElement.dart';
import '../../componentGenerale/blockvente.dart';
import '../../componentGenerale/buttonNavigationClient.dart';
import '../../componentGenerale/dialogue.dart';
import '../../componentGenerale/elementBlock.dart';
import '../../componentGenerale/entete.dart';
import '../../leyouts/base.dart';
import '../adminPharmacie/AcceuilAdmin.dart';

class AjoutPanier extends StatefulWidget {
  var tampoProduit;
int index=0;

  AjoutPanier(this.tampoProduit,{index=0});

  @override
  State<AjoutPanier> createState() => PanierState(this.tampoProduit,indexParcour: index);
}

class PanierState extends State<AjoutPanier> {
  var recherche="";
  bool switchValue = false;
  int posCombo=0;
  int indexParcour = 0;
  var nom = "";
  int quantite = 0;
  List<ModelMedicament> tampoProduit = [];
  Color appBarColor = Color.fromRGBO(50, 190, 166, 1);
  late Color colorButton = Color.fromRGBO(50, 190, 166, 1);

  PanierState(this.tampoProduit,{this.indexParcour=0});

  @override
  Widget build(BuildContext context) {
    var long = MediaQuery.of(context).size.width;
    var larg = MediaQuery.of(context).size.height;
    double hauteur= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: Entete(
              flecheR: true,
              context: context,
              title: "Vendre",
              pageCible: () {
                navigation(context, pageAccueille());
              },
              text: "",
              )
          .Demarrer(),
      body: Base(
              child: [

          ],
              content: BlockVente([
                ElementBlock(
                        "Produit",
                        Combobox(
                                colorInterne: Color.fromRGBO(228, 228, 228, 1),
                                long: long - 160,
                                fonctions: (val, pos) {
                                  setState(() {
                                    indexParcour = pos;
                                    posCombo=indexParcour;
                                  });
                                },
                                elements: StringifierCombo(tampoProduit),
                                colorBordure: Color.fromRGBO(228, 228, 228, 1))
                            .lancer(i:indexParcour))
                    .afficheElement(),
                ElementBlock(
                        element3: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                      SwitchCostum(f:(bool){
                                        setState(() {
                                          if (tampoProduit[indexParcour]
                                              .quantite_gros ==
                                              0) {
                                            switchValue = false;
                                          } else {
                                            switchValue = bool;
                                          }
                                        });

                                      },value: switchValue
                                      ).lancer(),
                              ],
                            ),
                          ),
                        ),
                        "Quantite",
                        InputCostom(
                          negative: false,
                            type: TextInputType.number,
                            lar: 30,
                            couleurBorder: Colors.black,
                            fonctions: (e) {
                              int quantiteTest = 0;
                              if (switchValue == false) {
                                quantiteTest = tampoProduit[indexParcour]
                                        .quantite_detail +
                                    (tampoProduit[indexParcour].quantite_gros *
                                        tampoProduit[indexParcour]
                                            .quantite_paquet);
                              } else {
                                quantiteTest =
                                    (tampoProduit[indexParcour].quantite_gros);
                              }

                              if (int.parse(e) > quantiteTest) {
                                alerteVente(() {
                                  Controler_panier(context).ajouterAuPanier();
                                },
                                    (switchValue == false)
                                        ? "la quantité est suppérieure au stock !"
                                        : "paquet");
                              } else {
                                quantite = int.parse(e);
                              }
                            }).lancer()

                )
                    .afficheElement(),
                ElementBlock(
                        "Prix",
                        TextPesro(
                            (tampoProduit.length != 0)
                                ? tampoProduit[indexParcour].prix.toString() +
                                    " fc"
                                : "0" + "  fc ",
                            Colors.black))
                    .afficheElement(),
                ElementBlock(
                        "Reste",
                        TextPesro(
                            (tampoProduit.length != 0)
                                ? tampoProduit[indexParcour]
                                        .quantite_detail
                                        .toString() +
                                    " pcs " +
                                    tampoProduit[indexParcour]
                                        .quantite_gros
                                        .toString() +
                                    " pqts"
                                : "0" + "",
                            Colors.red))
                    .afficheElement()
              ], () {
                if (!tampoProduit.isEmpty && quantite != 0) {
                  int qteCalcul = quantite;

                  var element = [
                    tampoProduit[indexParcour].id.toString(),
                    tampoProduit[indexParcour].toString(),
                    (tampoProduit[indexParcour].prix.toString())
                        .toString(),
                    [qteCalcul, switchValue],
                    (qteCalcul)
                        .toString(),
                    tampoProduit[indexParcour].quantite_paquet
                  ];
                  Controler_panier(context).Enregistrer(element,indexParcour);
                  print("ajout avec succes");
                } else {
                  alerteVente(() {
                    Controler_panier(context).ajouterAuPanier();
                  }, "Entrer la quantite du produit !");
                }
              },
                      InputRecherche(context, (v){
                        this.recherche=v;

                        print(long);

                      }, long: long - 130, larg: 40,Recherche: (){
                        ControlerMedicament(context).rechercherVente(this.recherche);
                      })
                          .lancer())
                  .createBlock(MediaQuery.of(context).size.width))
          .lancer(350, MediaQuery.of(context).size.width - 30),
      bottomNavigationBar: ButtonNavigationClient(context: context, model: 1)
          .afficheBlock(MediaQuery.of(context).size.width),
    );
  }

  Widget TextPesro(String text, Color c) {
    return Padding(
      child: Text(
        text,
        style: TextStyle(fontSize: 16,fontFamily: "roboto_medium", color: c),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 8),
    );
  }


  alerteVente(Function action, String message) {
    return AlertDialogue(
            Title: "Alert",
            contenue: message,
            action: [
              ButtonCostom("fermer", Colors.red, () {
                //Controler_panier(context).ajouterAuPanier();
                action();
              }).lancer()
            ],
            fonctionExte: () {})
        .lancer(context);
  }
}
