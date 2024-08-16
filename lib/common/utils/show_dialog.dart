import 'package:flutter/material.dart';

void showLoadingBox(BuildContext context,{ bool canPop = true }){
  showDialog(
    context: context,
    builder: (BuildContext context){
       return PopScope(
        canPop: canPop,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(00,00,00,0.251)
            ),
            child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 2,
            ),
          )
        )
      );
    }
  );
}


