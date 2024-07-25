import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogAlert extends StatelessWidget {
  final bool sucess;
  final String txt;
  final Map<int, VoidCallback> functions;
  String txtButton;
  String? txtButton2;
  double sizeWidth;
  DialogAlert({
    super.key,
    required this.txt,
    required this.sizeWidth,
    required this.functions,
    this.txtButton = 'OK!',
    this.txtButton2,
    this.sucess = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            sucess
                ? Lottie.asset(
                    'assets/lotties/success.json',
                    repeat: false,
                    width: sizeWidth * .25,
                  )
                : Lottie.asset(
                    'assets/lotties/error.json',
                    repeat: false,
                    width: sizeWidth * .25,
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sizeWidth * .05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (txtButton2 == null)
              ElevatedButton(
                onPressed: functions[1],
                child: Text(txtButton),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: functions[1],
                    child: Text(txtButton),
                  ),
                  ElevatedButton(
                    onPressed: functions[2],
                    child: Text(txtButton2!),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
