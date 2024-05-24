import 'package:flutter/material.dart';
import 'collectEvidence.dart';
import 'reportCrime.dart';
//import 'homePage.dart';
void main() => runApp(policeWelcome());

class policeWelcome extends StatelessWidget{
  policeWelcome ({super.key});

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
                 // mainAxisSize: max,
                  children: [
                   // SizedBox(height: 100),
                    Container(
                      
                      width:150,
                      height: 100,
                      color: Colors.blue,
                      
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tCollect\nEvidence", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      ) 
                   
                    ),
                      Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                          child: GestureDetector(
                            child: Center(
                       child: Text("Files With\nEvidence", style: TextStyle(fontSize: 15,color:Colors.white)),
                        ),
                     //  onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => forgotPassword() ));},
                      ) 
                    
                    ),
                  ],
                ),
                SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder:(context) => reportCrime() )); 
                  },
                 child: const Text('EXIT',
                 style: TextStyle(fontSize: 20),
                 ),
                ),
                
                  ],
                ),
              ],
            ),
           ),
           ), 
           
      
    ),
   );
  }
  
          
          
  }