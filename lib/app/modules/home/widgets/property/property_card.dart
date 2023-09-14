import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/data/models/profile.dart';
import 'package:mobile/app/data/models/property.dart';
import 'package:mobile/app/data/models/single_file.dart';
import 'package:mobile/app/modules/home/widgets/picture_actions.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    Key? key,
    required this.property,
    this.onTap,
  }) : super(key: key);

  final Property property;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      property.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    if (property is ProFile)
                      Text(
                        (property as ProFile)
                            .prices
                            .entries
                            .map((e) => '${e.key} ${e.value}')
                            .join('\n'),
                        textAlign: TextAlign.start,
                      )
                    else
                      () {
                        final file = property as SingleFile;
                        final text =
                            '${file.propertyType.name}/New Home/110\nNet /1+1/Sea View\nN/A\nTurkey-Istanbul-Kartal\nFor Sale';
                        return Text(text);
                      }.call(),
                    kSpaceVertical16,
                    PictureActions(
                      property: property,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: kBorderRadiusDefault,
                    child: PropertyImage(property: property),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class PropertyImage extends StatelessWidget {
  const PropertyImage({
    Key? key,
    required this.property,
  }) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kBorderRadiusDefault,
      child: CachedNetworkImage(
        imageUrl: property.imgRes,
        placeholder: (context, url) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              )),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
// 'https://is1-2.housingcdn.com/4f2250e8/7fe3f307b76520f1a126eba25ea4c70c/v5/fs/axis_pleasant_apartments-manikonda-hyderabad-axis_home_developers.jpg'