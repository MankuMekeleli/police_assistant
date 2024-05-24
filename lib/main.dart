import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home :Home()));
}

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("POLICE ASSISTANT",style: TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:homePage(),
    );
  }

 // scaffold({required AppBar appBar}) {}
}
