import 'package:flutter/material.dart';
import 'package:mobile/app/data/models/agent.dart';
import 'package:mobile/app/widgets/agent_card.dart';

class PhonesView extends StatelessWidget {
  const PhonesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AgentCard(
            agent: Agent(
                languages: ['Fa', 'Tr', 'En'], name: 'Mohammad', points: 1000)),
        AgentCard(
            agent: Agent(
                languages: ['Fa', 'Tr', 'En'], name: 'Sahar', points: 100)),
        AgentCard(
            agent:
                Agent(languages: ['Fa', 'Tr', 'En'], name: 'Babak', points: 0)),
      ],
    );
  }
}
