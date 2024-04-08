import 'package:flutter/material.dart';
import 'package:icreate_image/utils/colors.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          height: 300,
          width: 200,
          margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/ChemistCard.png'),
              )),
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          bottom: 10.0,
          child: Container(
            height: 20,
            width: 200,
            margin: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ),
            child: Center(
              child: Text("Chemist Card"),
            ),
          ),
        )
      ]),
    );
  }
}
