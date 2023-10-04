import 'package:flutter/material.dart';
import 'package:tic_tac_game/resources/socket_methods.dart';
import 'package:tic_tac_game/responsive/responsive.dart';
import 'package:tic_tac_game/screens/join_screen.dart';
import 'package:tic_tac_game/widget/custom_button.dart';
import 'package:tic_tac_game/widget/custom_text.dart';
import 'package:tic_tac_game/widget/custom_textfield.dart';

class CreateScreen extends StatefulWidget {
  static String routeName = 'createroom';
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

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
              ], text: 'Create Room', fontSize: 70),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                  controller: _nameController, hintText: "Enter Your Nickname"),
              SizedBox(
                height: size.height * 0.045,
              ),
              CustomButton(
                  onTap: () => 
                  _socketMethods.createRoom(_nameController.text),
                  text: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
