import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/decorations.dart';
import 'package:mobile/app/data/models/agent.dart';
import 'package:mobile/app/widgets/agent_card.dart';
import 'package:mobile/app/widgets/card_section.dart';
import 'package:mobile/app/widgets/dropdown_picker.dart';

class AgentSelector extends StatefulWidget {
  AgentSelector({Key? key, required this.agents}) : super(key: key);

  final List<Agent> agents;

  @override
  State<AgentSelector> createState() => _AgentSelectorState();
}

class _AgentSelectorState extends State<AgentSelector> {
  final Set<Agent> selectedAgents = {};
  Agent? pickedAgent;
  @override
  Widget build(BuildContext context) {
    return CardSection(padding: true, title: 'Add Agent', children: [
      kSpaceVertical8,
      Row(
        children: [
          Expanded(
              child: DropDownPicker<Agent?>(
                  value: pickedAgent,
                  items:
                      widget.agents.toSet().difference(selectedAgents).toList(),
                  onItemSelected: (agent) {
                    setState(() {
                      pickedAgent = agent;
                    });
                  })),
          kSpaceHorizontal8,
          ElevatedButton(
            onPressed: pickedAgent != null
                ? () {
                    if (pickedAgent != null) {
                      setState(() {
                        selectedAgents.add(pickedAgent!);
                        pickedAgent = null;
                      });
                    }
                  }
                : null,
            child: Icon(Icons.add, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              // <-- Splash color
            ),
          ),
        ],
      ),
      if (selectedAgents.isNotEmpty) Text('Selected Agents'),
      ...selectedAgents.map((agent) => AgentCard(
            agent: agent,
            onDeleted: () {
              selectedAgents.remove(agent);
              setState(() {});
            },
          )),
    ]);
  }
}
