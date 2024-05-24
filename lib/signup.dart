//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:police_assistant/firebase_auth_services.dart';

import 'homePage.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main () => runApp(signUp());

class signUp extends StatefulWidget{
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp>{
 //  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{1}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
   final _formfield = GlobalKey<FormState>();
   bool passToggle = true;
   bool passToggle2 = true;
   final FirebaseAuthService _auth = FirebaseAuthService();
   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

 TextEditingController _FirstNameTextController = TextEditingController();
 TextEditingController _LastNameTextController = TextEditingController();
 TextEditingController _IDNumberTextController = TextEditingController();
 TextEditingController _RoleTextController = TextEditingController();
 TextEditingController _EmailTextController = TextEditingController();
 TextEditingController _PasswordTextController = TextEditingController();
 TextEditingController _ConfirmPasswordTextController = TextEditingController();
 
 

 @override
 void dispose(){
 _FirstNameTextController.dispose();
 _LastNameTextController.dispose();
 _IDNumberTextController.dispose();
 _RoleTextController.dispose();
 _EmailTextController.dispose();
 _PasswordTextController.dispose();
 _ConfirmPasswordTextController.dispose();
  super.dispose();
 }

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
        body: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),

            child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
         TextFormField(
               controller: _FirstNameTextController,
              decoration: const InputDecoration(
                hintText: 'Enter FirstName',
                border: OutlineInputBorder(),
                labelText: 'FirstName'),
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter LastName";
                  }
                  }
            ),
            
          SizedBox(height: 20),
          TextFormField(
               controller: _LastNameTextController,
              decoration: const InputDecoration(
                hintText: 'Enter LastName',
                border: OutlineInputBorder(),
                labelText: 'LastName'),
                   validator: (value){
                  if(value!.isEmpty){
                    return "Enter LastName";
                  }
                  }
            ),
          
          SizedBox(height: 20),
          TextFormField(
              controller: _IDNumberTextController,
              decoration: const InputDecoration(
                hintText: 'Enter IDNumber',
                border: OutlineInputBorder(),
                labelText: 'IDNumber'),
                  validator: (value){
                  if(value!.isEmpty){
                    return "Enter IDNumber";
                  }
                  }
            ),
        
             SizedBox(height: 20),
           TextFormField(
               controller: _RoleTextController,
              decoration: const InputDecoration(
                hintText: 'Enter Description',
                border: OutlineInputBorder(),
                labelText: 'Description'),
                 validator: (value){
                  if(value!.isEmpty){
                    return "Enter Decription";
                  }
                 }
            ),
          
          SizedBox(height: 20),
          TextFormField(
               keyboardType: TextInputType.emailAddress,
               textCapitalization: TextCapitalization.none,
               controller: _EmailTextController,
              decoration: const InputDecoration(
               // hintText: 'Enter Email',
                border: OutlineInputBorder(),
                labelText: 'Email'),
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
          
          SizedBox(height: 20),
           TextFormField(
              obscureText: passToggle,
               controller: _PasswordTextController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                border: OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon:  InkWell(
                  onTap: () {
                    
                    setState(() {
                  passToggle = !passToggle;
                    });
                  },
                  child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                ),
                ),
                   validator: (value){
                  if(value!.isEmpty){
                    return "Enter Password";
                  }
                  else if(_PasswordTextController.text.length < 7){
                    return "Password Should Be More Than 7 Characters!";
                  }
                }

            ),
        
          SizedBox(height: 20),
          TextFormField(
            obscureText: passToggle,
               controller: _ConfirmPasswordTextController,
              //textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
                suffixIcon:  InkWell(
                  onTap: () {
                    
                    setState(() {
                  passToggle = !passToggle;
                    });
                  },
                  child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter Password";
                  }
                  else if(_PasswordTextController.text.length < 7){
                    return "Password Should Be More Than 7 Characters!";
                  }
                }
            ),
          
          SizedBox(height: 20),
             ElevatedButton(
                  onPressed: () {
                   _signUp();
                 if(_formfield.currentState!.validate()){
                print("Success");
                _FirstNameTextController.clear();
                _LastNameTextController.clear();
                _IDNumberTextController.clear();
                _RoleTextController.clear();
                _EmailTextController.clear();
                _PasswordTextController.clear();
                _ConfirmPasswordTextController.clear();
              }
                  },
                 child: const Text('REGISTER',
                 style: TextStyle(fontSize: 20),
                 ),
                ),
         
               SizedBox(height: 15),
                 Container(  
               child: GestureDetector(
                       child: Text("GO BACK TO LOGIN IN", style: TextStyle(fontSize: 15,color:Colors.blue)),
                       onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => Home() ));},
                      ) 
                 ),
                ],
              ),
            ),
        ),
      ),
      ),
    );
       
     
  }

 void _signUp() async {
    String firstname = _FirstNameTextController.text;
    String lastname = _LastNameTextController.text;
    String idnumber = _IDNumberTextController.text;
    String role = _RoleTextController.text;
    String email = _EmailTextController.text;
    String password = _PasswordTextController.text;
    String confirmpassword = _ConfirmPasswordTextController.text;

    User? user = await _auth.signUp(email,password);
    if(user != null){
      firebaseFirestore.collection("Users").doc(email).set({
        "firstname":firstname,
        "lastname":lastname,
        "idnumber":idnumber,
        "role":role,
        "email":email,
        "password": password,
        "approved":false,
      });
    }

  }

  
  
}