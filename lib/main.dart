import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_game/provider/room_data_provider.dart';
import 'package:tic_tac_game/screens/create_screen.dart';
import 'package:tic_tac_game/screens/game_screen.dart';
import 'package:tic_tac_game/screens/join_screen.dart';
import 'package:tic_tac_game/screens/main_screen.dart';
import 'package:tic_tac_game/utilis/colors.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      
      create: ( context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor
        ),
        routes: {
          MainScreen.routeName:(context)=>const MainScreen(),
          CreateScreen.routeName:(context) => const CreateScreen(),
          JoinScreen.routeName:(context) => const JoinScreen(),
          GameScreen.routeName:(context) => const GameScreen(),
        },
        initialRoute: MainScreen.routeName,
      ),
    );
  }
}


