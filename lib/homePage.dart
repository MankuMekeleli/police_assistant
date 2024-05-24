import 'package:flutter/material.dart';
import 'package:police_assistant/firebase_auth_services.dart';
import 'signUp.dart';
import 'forgotPassword.dart';
import 'reportCrime.dart';
import 'policeWelcome.dart';
import 'policeStationWelcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class homePage extends StatefulWidget{

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {  

  
  final FirebaseAuthService _auth = FirebaseAuthService();
   bool passToggle = true;
  final TextEditingController _EmailTextController = TextEditingController();
  final TextEditingController _PasswordTextController = TextEditingController();
   final _formfield = GlobalKey<FormState>();
  final TextEditingController _RoleTextController = TextEditingController();
  
 // get url => null;
  
  get http => null;
   Uri? adminUrl;
   void _loginAndNavigate(BuildContext context) async {
    String email = _EmailTextController.text;
    try {
      // Authenticate user
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _EmailTextController.text.trim(),
        password: _PasswordTextController.text.trim(),
      );

      // Fetch user type from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(email)
          .get();

      if (userDoc.exists) {
        String role = userDoc['role'].toString().toLowerCase();
        Widget nextPage;

        if (role== 'police') {
          nextPage = policeWelcome();
        } else if (role == 'policestation') {
          nextPage = policeStationWelcome();
        } else if (role == 'citizen') {
          nextPage = reportCrime();
        }else{
       nextPage = homePage();
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      } else {
        // Handle user not found
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User not found.'),
        ));
      }
    } catch (e) {
      // Handle errors (e.g., authentication failed)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed. ${e.toString()}'),
      ));
    }
  }


 @override
 void dispose(){
 
 _EmailTextController.dispose();
 _PasswordTextController.dispose();
 _RoleTextController.dispose();
 
  super.dispose();
 }

  bool isPasswordVisible = false;
  

  @override
  void initState(){
    super.initState();
    isPasswordVisible = true;
  }
@override
  Widget build(BuildContext context) {
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(  
       
        body: SingleChildScrollView(
          child: Padding(  
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),  
              child: Form( 
                key: _formfield,
                   child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  SizedBox(height: 80),  
                    TextFormField( 
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                    controller: _EmailTextController, 
                      decoration: const InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'UserName',  
                        hintText: 'Email', 
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
                 SizedBox(height: 20),
                  TextFormField( 
                    obscureText: passToggle,
                      controller:  _PasswordTextController, 
                      decoration:  InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Password',  
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.security), 
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
                  Container(  
                 child: GestureDetector(
                         child: Text("Forgot Password?", style: TextStyle(fontSize: 15,color:Colors.blue)),
                         onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => forgotPassword() ));},
                        ) 
                
                  ), 
                 SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                          
                     
                             if(_formfield.currentState!.validate()){
                             _loginAndNavigate(context); 
                             _EmailTextController.clear();
                             _PasswordTextController.clear();
              }
                    },
                   child: const Text('Login',
                   style: TextStyle(fontSize: 20),
                   ),
                  ) ,
                   SizedBox(height: 50),
                       Container( 
                        child: GestureDetector(
                         child: Text("New User? Create Account", style: TextStyle(fontSize: 15,color:Colors.blue)),
                         onTap: () { Navigator.push(context, MaterialPageRoute(builder:(context) => signUp()));},
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
    void _logIn() async {
    String email = _EmailTextController.text;
    String password = _PasswordTextController.text;
    

    User? user = await _auth.logIn(email,password);

    if(user != null)
    print("User Successfully Registered");
    Navigator.pushNamed(context, "/main");
    // Navigator.push(context, MaterialPageRoute(builder:(context) => homePage() ));
  }
  
 // setState(Null Function() param0) {}  
}