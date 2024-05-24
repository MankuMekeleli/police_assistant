import 'package:flutter/material.dart';
import  "thankYou.dart";

void main() => runApp(reportCrime());

class reportCrime extends StatelessWidget{
  reportCrime ({super.key});

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
          body: SingleChildScrollView(child: SafeArea(
           child: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   // SizedBox(height: 100),
                    Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                      
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tCar\nTheft", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                    ),
                      Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                      
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tProperty\nDamage", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                    ),
                  ],
                ),
                  SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   // SizedBox(height: 100),
                    Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                      
                       child: GestureDetector(
                        child: Center(
                       child: Text("\t\tDrug\nOffenses", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                   
                    ),
                      Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                      
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tDomestic\nViolence", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                       child: Text("\tHouse/Shop\n\t\treak", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                    ),
                      Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tWanted\nPerson", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     //onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                  
                    ),
                  ],
                ),
                  SizedBox(height: 20),
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
                       child: Text("\t\t\tGun\n\t\tFight", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      
                      )
                    ),
                      Container(
                      width:150,
                      height: 100,
                      color: Colors.blue,
                      
                       child: GestureDetector(
                        child: Center(
                       child: Text("\tAnimal\n\t\tTheft", style: TextStyle(fontSize: 15,color:Colors.white,)),
                        ),
                     // onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => collectEvidence() ));},
                      )
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                      ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => thankYou()));
                    },
                 child: const Text('REPORT',
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
    ),
   );
  }
}