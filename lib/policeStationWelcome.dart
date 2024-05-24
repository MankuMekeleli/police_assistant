import 'package:flutter/material.dart';
import 'homePage.dart';

void main() => runApp(policeStationWelcome());

class policeStationWelcome extends StatelessWidget{
  policeStationWelcome ({super.key});

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
          body: SafeArea(
           child: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   // SizedBox(height: 100),
                    Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tNew\nCase", style: TextStyle(fontSize: 15,color:Colors.white)),
                        )
                     //  onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => forgotPassword() ));},
                      ) 
                   
                    ),
                      Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                          child: GestureDetector(
                            child: Center(
                       child: Text("Case With\n\tEvidence", style: TextStyle(fontSize: 15,color:Colors.white)),
                            )
                     //  onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => forgotPassword() ));},
                      ) 
                    
                    ),
                  ], //children 
                ),
                 SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder:(context) => homePage() )); 
                  },
                 child: const Text('EXIT',
                 style: TextStyle(fontSize: 20),
                 ),
                ),
                
                  ],
                ),
            ], //children 
           ),
          ),
          
    ),
    ),
   );
  }
}