import 'package:flutter/material.dart';
import 'reportCrime.dart';
import 'policeStationWelcome.dart';

void main() => runApp(thankYou());

class thankYou extends StatelessWidget{
  thankYou ({super.key});

  @override
  Widget build(BuildContext context){
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
           title:const Text("POLICE ASSITANT",style: TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
        backgroundColor: Colors.blue,
        ),
          body: SingleChildScrollView(child: Center(child:Column(children: <Widget>
        [
              SizedBox(height: 100),
          Container(
            margin: EdgeInsets.all(15.0),
            padding:EdgeInsets.all(3),
           decoration: BoxDecoration(
           border: Border.all(color: Colors.blueAccent) 
           ),
           child: Text('Thank You For Reporting \n Crime To The Nearest \n Police Station\n FREE-TOLL:112\n\n\n #STOPWOMENANDCHILDABUSE! \n#REPORTCRIMETODAY!'),
            ),
          SizedBox(height: 90),
            ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => policeStationWelcome() ));
                  },
                 child: const Text('EXIT',
                 style: TextStyle(fontSize: 20),
                 ),
                ),
        ]
          )
          )
    ),
    ),
   );
  }
}