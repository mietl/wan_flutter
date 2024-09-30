import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Future<void> showLoadingBox({bool canPop = true}) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return PopScope(
//             canPop: canPop,
//             child: Center(
//                 child: Container(
//               padding: const EdgeInsets.all(14),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: const Color.fromRGBO(00, 00, 00, 0.251)),
//               child: const CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation(Colors.white),
//                 strokeWidth: 1.4,
//               ),
//             )));
//       });
// }

Future<void> showLoadingBox({bool canPop = true}) async {
  return Get.dialog(
    Center(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(0, 0, 0, 0.251), // 背景色
        ),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 1.4,
        ),
      ),
    ),
    barrierDismissible: canPop, // 是否允许点击弹窗外部关闭弹窗
  );
}
