import 'package:flutter/material.dart';
//import 'reportCrime.dart';

void main() => runApp(caseData());

class caseData extends StatelessWidget{
  caseData ({super.key});

  @override
  Widget build(BuildContext context){
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
           title:const Text("POLICE ASSISTANT",style: TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
        backgroundColor: Colors.blue,
        ),
          body: Center(child:Column(children: <Widget>
        [
         
        ]
          )
          )
    ),
   );
  }
}