import 'package:flutter/material.dart';
import 'package:mobile/app/modules/home/views/property_info/extra_info.dart';

class SecondaryAttributes extends StatelessWidget {
  const SecondaryAttributes(
      {Key? key, required this.title, required this.attributes})
      : super(key: key);

  final String title;
  final List<SecondaryAttribute> attributes;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          initiallyExpanded: true,
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
              ),
              shrinkWrap: true,
              itemCount: attributes.length,
              itemBuilder: (ctx, index) {
                final attribute = attributes[index];
                return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${attribute.title}: ',
                            maxLines: 2,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (attribute.isBool)
                          Icon(
                            attribute.value ? Icons.done : Icons.close,
                            color: attribute.value ? Colors.green : Colors.red,
                          )
                        else
                          Text(
                            attribute.value.toString(),
                            style: const TextStyle(fontSize: 12),
                          )
                      ],
                    ));
              },
            )
          ]),
    );
  }
}
