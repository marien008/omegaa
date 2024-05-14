import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';

class InputCostom {
  Function? fonctions;
  String valeurInterne="";
  var long, lar, value="";
  Color couleur;
  Color couleurBorder;
  Function?  fonctionCache;
  double elevation;
  var type;
  var estcache = false;
  var changeAff=true;
  var exp=RegExp(r'^[A-Za-z]+$');
  var isvalid=false;


  InputCostom({
    this.fonctionCache,
    this.fonctions,
    this.long = 80,
    this.lar = 40,
    this.value="",
    this.type = TextInputType.text,
    this.couleur = Colors.white,
    this.estcache = false,
    this.couleurBorder = Colors.white24,
    this.elevation = 0,
    this.valeurInterne="",
    this.changeAff=false

  });

  Widget lancer() {
    return Container(
      child: Column(
        children: [ Container(
          height: lar.toDouble(),
          width: long.toDouble(),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(this.elevation, this.elevation),
                blurRadius: this.elevation * 2,
              )
            ],
            color: this.couleur,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: this.couleurBorder,width: 1.0),
          ),
          child: Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 8),
                  hintStyle: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                ),
              ),
              child:Center(
                child:TextField(
                  obscureText:(this.estcache==true)?changeAff:this.estcache,
                  keyboardType: this.type,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    this.fonctions!(value);

                    this.valeurInterne=value;

                    print(this.valeurInterne);


                    isvalid= exp.hasMatch(value);
                  },

                  decoration: InputDecoration(
                    suffixIcon:(this.estcache==false)?null:GestureDetector(
                    onLongPress: (){
                    this.fonctionCache!();
                  },onLongPressEnd: (s){
                      this.fonctionCache!();
                    },
                      child:InkWell(child:Icon(Icons.remove_red_eye_outlined),) ,
                    ) ,
                    fillColor: Colors.blue,
                    hintText: this.value,
                    border:OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ) ,
              )

          ),
        ),

         Center()
        ],
      ),
    ) ;
  }
}