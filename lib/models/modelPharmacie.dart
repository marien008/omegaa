
import '../session/Session.dart';
import 'baseDeDonnee/BaseDeDonnee.dart';



class ModelPharmacie  {
  late   int ? id_pharmacie;
  String nom_pharmacie;
  String mot_de_passe;
  String login;

  String nomTable="pharmacie";
  static BaseDeDonnee base=new  BaseDeDonnee();

  ModelPharmacie(this.nom_pharmacie,this.login,this.mot_de_passe);

  ajouter() async{
    int id_phar=await ModelPharmacie.base.ajoutDonnees(this.nomTable,{"nom_pharmacie":this.nom_pharmacie,
      "login":this.login,
      "mot_passe":this.mot_de_passe,
    });
  }

  static affId(int id) {
    String requette="select * from pharmacie where id_pharmacie=$id";
    return ModelPharmacie.base.reccuperationDonnees(requette);
  }

  static existe() async{

    var test=false;
    String requette="select * from pharmacie ";
    var v= await ModelPharmacie.base.reccuperationDonnees(requette);

    if(v.isEmpty){
      test=true;
      await ModelPharmacie.base.ajoutDonnees("pharmacie",{"nom_pharmacie":"omega",
        "login":"omega",
        "mot_passe":"omega",
      });
    }

return test;

  }


}
