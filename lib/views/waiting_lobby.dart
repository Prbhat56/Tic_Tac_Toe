import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tic_tac_game/provider/room_data_provider.dart';

import '../widget/custom_textfield.dart';

class WitingLobby extends StatefulWidget {
  const WitingLobby({super.key});

  @override
  State<WitingLobby> createState() => _WitingLobbyState();
}

class _WitingLobbyState extends State<WitingLobby> {
  late TextEditingController roomIdController;
  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']);
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for a player to join....'),
        SizedBox(
          height: 20,
        ),
        CustomTextField(controller: roomIdController, hintText: '',
        isReadOnly: true,)
      ],
    );
  }
}
