




int verification(double nombre){
  int transformeI=nombre.truncate();


  String reste=(nombre-nombre.truncate()).toString();
  reste=reste.replaceAll("0.", "");

  if(int.parse(reste)>0){
    transformeI= transformeI+1;
  }

  return transformeI;
}