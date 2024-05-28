import 'package:flutter/material.dart';

class InkWellCostum extends InkWell {

  String id;
  InkWellCostum({
    required this.id,
    Key? key,
    required GestureTapCallback? onTap(),
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCancelCallback? onTapCancel,
    Color? splashColor,
    BorderRadius? borderRadius,
    required Widget child,
  }) : super(
          key: key,
          onTap: (){
            onTap!();
},
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onTapCancel: onTapCancel,
          splashColor: splashColor ?? Colors.blue.withOpacity(0.3),
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          child: child,
        );
}
