import 'package:flutter/material.dart';

import 'package:tic_tac_game/resources/socket_methods.dart';
import 'package:tic_tac_game/screens/game_screen.dart';
import 'package:tic_tac_game/widget/custom_text.dart';

import '../responsive/responsive.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class JoinScreen extends StatefulWidget {
  static String routeName = 'joinroom';
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController _gameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(shadows: [
                Shadow(
                  blurRadius: 40,
                  color: Colors.blue,
                )
              ], text: 'Join Room', fontSize: 70),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                  controller: _nameController, hintText: "Enter Your Nickname"),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _gameController,
                hintText: 'Enter your game id',
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              CustomButton(
                  onTap: () => 
                  _socketMethods.joinRoom(
                        _nameController.text,
                        _gameController.text,
                      ),
                  text: "Join")
            ],
          ),
        ),
      ),
    );
  }
}
