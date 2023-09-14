import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/data/models/property.dart';
import 'package:mobile/app/modules/home/widgets/picture_actions.dart';

class PropertySummary extends StatelessWidget {
  const PropertySummary({
    Key? key,
    required this.property,
    this.withIcons = true,
  }) : super(key: key);

  final Property property;
  final bool withIcons;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(property.imgRes),
        if (withIcons)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadiusDefault,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(bottom: 4),
                  alignment: Alignment.bottomCenter,
                  child: PictureActions(property: property),
                ),
              ),
            ),
          )
      ],
    );
  }
}
