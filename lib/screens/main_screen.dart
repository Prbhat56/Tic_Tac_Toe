import 'package:flutter/material.dart';

import 'package:tic_tac_game/responsive/responsive.dart';
import 'package:tic_tac_game/screens/create_screen.dart';
import 'package:tic_tac_game/screens/join_screen.dart';
import 'package:tic_tac_game/widget/custom_button.dart';

class MainScreen extends StatelessWidget {
  static String routeName = 'mainmenu';
  const MainScreen({super.key});
  void CreateRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateScreen.routeName);
  }
    void JoinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () =>CreateRoom(context), text: "Create Room"),
          SizedBox(height: 15,),
          CustomButton(onTap: () =>JoinRoom(context), text: "Join Room")
        ],
      ),
    ));
  }
}
