
import '../elper/verificationDecimal.dart';
import '../session/Session.dart';
import '../session/panier.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';

class cPanier{
  var session=Session.id_connect;

  createPanier(){
    Session.panier=Panier([]);
  }
  ajouterElement(List<dynamic> element)async{

    if(!Session.panier.verifierExistance(element[1])){
      Session.increPanier+=1;
    }
    int id=int.parse(element[0]);
    int prix=int.parse(element[2].toString());
    int quantite=int.parse(element[3][0].toString());
    int capacitePaquet=int.parse(element[5].toString());
    bool piecePaquet=element[3][1];

    var quantDetailBd=await BaseDeDonnee().reccuperationDonnees("select quantite_detail"+
        " from medicamment_pharmacie  where id_pharmacie=$session and id_medicament=$id");

    var quantGroBd=await BaseDeDonnee().reccuperationDonnees("select quantite_gros"+
        " from medicamment_pharmacie  where id_pharmacie=$session and id_medicament=$id");
    int quant_gros_bd=int.parse(quantDetailBd[0]["quantite_detail"].toString());
    int quant_detail_bd=int.parse(quantDetailBd[0]["quantite_detail"].toString());


    if(quantite> quant_detail_bd && piecePaquet==false){
      if(capacitePaquet!=0){
        int piecedisponible= quantite- quant_detail_bd;
        int quantPaquetPossible= verification(piecedisponible / capacitePaquet);
        var piecemax=0;
        var pieceRestant=0;

        if(quantPaquetPossible <= quant_gros_bd){
          piecemax=(quantPaquetPossible * capacitePaquet) as int;
          pieceRestant=piecemax-piecedisponible;

          await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
              "quantite_detail=$pieceRestant where id_pharmacie=$session and id_medicament=$id");
          await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
              "quantite_gros=quantite_gros-$quantPaquetPossible where id_pharmacie=$session and id_medicament=$id");

          //Session.panier.ajouterElement([element[0],element[1],prix,[quantite,quantPaquetPossible],quantite*prix]);

        }
      }
    }else if(quantite <= quant_detail_bd && piecePaquet==false){
      await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
          "quantite_detail=quantite_detail-$quantite where id_pharmacie=$session and id_medicament=$id");

      //Session.panier.ajouterElement([element[0],element[1],prix,[quantite,0],quantite*prix]);

    }else if(quantite <= quant_gros_bd && piecePaquet==true){
      await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
          "quantite_gros=quantite_gros-$quantite where id_pharmacie=$session and id_medicament=$id");

     // Session.panier.ajouterElement([element[0],element[1],prix,[quantite,quantite*capacitePaquet],quantite*prix]);

    }
    return 0;
    }






  decrementationBd(var id,List<dynamic> quantite,int cap) async{

      var qte=quantite[0];
      var gros=quantite[1];
      var detail=quantite[0]-(gros*cap);

      await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
          "quantite_gros=quantite_gros-$gros where id_pharmacie=$session and id_medicament=$id");

      await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET "
          "quantite_detail=quantite_detail-$detail where id_pharmacie=$session and id_medicament=$id");
return 0;
  }

  afficheContenu(){
   var  v= Session.panier.afficheInfo();
    return [Session.panier.afficheInfo(),Session.panier.Fairetotal()];

  }
  viderPanier() {
    Session.panier=Panier([]);
    Session.increPanier=0;
  }

  remettreElement()async{

    print(Session.panier.contenue);
    for(int i=0; i<Session.panier.contenue.length; i++){


      int gros=Session.panier.contenue[i][3][1];

      int detail=int.parse(Session.panier.contenue[i][3][0])-(gros*int.parse(Session.panier.contenue[i][5] as String) );
      print(detail);
      var id=int.parse(Session.panier.contenue[i][0]);

    await  BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET quantite_gros=quantite_gros+$gros"
          " where id_pharmacie=$session and id_medicament=$id");

     await BaseDeDonnee().modifier("UPDATE medicamment_pharmacie SET quantite_detail=quantite_detail+$detail"
          " where id_pharmacie=$session and id_medicament=$id");
    }
    return 0;
  }

}