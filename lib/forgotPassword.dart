import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
void main() => runApp(forgotPassword());

class forgotPassword extends StatefulWidget{

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword>{

final TextEditingController _EmailTextController = TextEditingController();

  get _formfield => null;


@override
void dispose(){
  _EmailTextController.dispose();
  //super.dispose();
}

Future passwordReset() async {
  try{
await FirebaseAuth.instance.sendPasswordResetEmail(email: _EmailTextController.text.trim());
  showDialog(
   context: context,
   builder: (context){
    return AlertDialog(
      content: Text("\t\tCheck Your Email!\n Password Reset Link Sent!"),
    );
   }
    );
  } on FirebaseAuthException catch(e){
    print(e);
    showDialog(
   context: context,
   builder: (context){
    return AlertDialog(
      content: Text("Enter Your Email!"),
    );
   }
    );
  }
}

 @override
  void initState(){
   // super.initState();
  //  isPasswordVisible = true;
  }

@override
Widget build(BuildContext context)
{
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
          body:  SingleChildScrollView(
          child: Padding(  
              padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 60),  
              child: Form( 
                key: _formfield,
                   child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
    
              SizedBox(height: 20),
          Container(
            padding:EdgeInsets.all(20),
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                    controller: _EmailTextController, 
              decoration: const InputDecoration(
                hintText: 'Enter Email',
                border: OutlineInputBorder(),
                labelText: 'Email',
                 prefixIcon: Icon(Icons.mail), 
                 ),
                          validator: (value) 
                {
                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{1}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                 if(value!.isEmpty){
                 return "Enter Email";
                 }
                 else if(!emailValid){
                 return "Enter Valid Email";
                 }
                },
            ),
          ),
           SizedBox(height: 20),
            ElevatedButton(
                  onPressed: () {
                   passwordReset();
                     if(_formfield.currentState!.validate()){
                        
                             _EmailTextController.clear();
                     }
                  },
                 child: const Text('SEND',
                 style: TextStyle(fontSize: 20),
                 ),
                ),
                ],
                   ),
              ),
          ),
          ),
      

    ), //Scaffold
  );//MaterialApp
}

}