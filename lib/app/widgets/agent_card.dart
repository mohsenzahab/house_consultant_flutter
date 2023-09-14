import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/data/models/agent.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    Key? key,
    required this.agent,
    this.onDeleted,
  }) : super(key: key);

  final Agent agent;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    Widget trailing = ActionChip(
        label: const Icon(
          Icons.phone_in_talk,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        labelPadding: kPaddingDefault,
        shape: const CircleBorder(
            side: BorderSide(
                width: 1, color: Colors.green, style: BorderStyle.solid)),
        onPressed: () {});
    if (onDeleted != null) {
      trailing = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          trailing,
          kSpaceHorizontal8,
          ActionChip(
              label: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              labelPadding: kPaddingDefault,
              shape: const CircleBorder(
                  side: BorderSide(
                      width: 1, color: Colors.red, style: BorderStyle.solid)),
              onPressed: onDeleted!)
        ],
      );
    }
    return Padding(
      padding: kPaddingDefault,
      child: ListTile(
        isThreeLine: true,
        tileColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusDefault),
        leading: const DecoratedBox(
            decoration: ShapeDecoration(
                shape: CircleBorder(
                    side: BorderSide(width: 1, color: Colors.white))),
            child: Padding(
              padding: kPaddingDefault,
              child: FlutterLogo(),
            )),
        title: Text(agent.name),
        trailing: trailing,
        subtitle: Text(
          '${agent.languages.join('/')}\nPoints:${agent.points}',
        ),
      ),
    );
  }
}
