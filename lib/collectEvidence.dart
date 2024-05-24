//import 'package:image_picker_for_web/image_picker_for_web.dart';
//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(collectEvidence());

class collectEvidence extends StatefulWidget{
 

  @override
  _collectEvidenceState createState() => _collectEvidenceState();
}

class _collectEvidenceState extends State<collectEvidence>{

File? imageFile;
//late CameraController _controller;
 // late CameraDelegate _cameraDelegate;

Future<void> _pickImageFromCamera(ImageSource camera) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
  if(pickedFile == null) return;
   final imageTemporary = File(imageFile!.path);
    setState(() => this.imageFile = imageTemporary   );
//(pickedFile.path);
//_imageFile = File(pickedFile!.path);
//_imageFile = File(pickedFile.path).readAsBytesSync() as File?;
//_imageFile = pickedFile as File?;
    
  

  
}

Future<void> _saveNote() async {
  //combine text note and image path into one string
  var _noteController;
  String noteText = _noteController.text;

  var _imageFile;
  String imagePath = _imageFile != null? imageFile!.path:"";
  String combinedText = "$noteText\n$imagePath";

  //write to text file
 File file = File("your_file_path.txt");
 await file.writeAsString(combinedText);
}

@override
Widget build(BuildContext context){
  var _imageFile;
  var _noteController;
  return Scaffold(
    appBar: AppBar(
          title:const Text("POLICE ASSISTANT",style: TextStyle(
          color: Colors.white
        )),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _noteController,
            maxLines: null,
            decoration: InputDecoration(hintText: "Write Evidence Here..."),
          ),
          SizedBox(height: 20.0),
          if(_imageFile != null)
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: FileImage(imageFile!)
            ),
            ),
          )
          else
          Container(
            child: Text("Images Will appear here")
          ),

        //  _imageFile != null ? Image.file(File(_imageFile!)) : const Text("Please Select An Image"), //it was there initially when the code worked properly
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _pickImageFromCamera(ImageSource.camera);
            },
            child: Text("Add Picture"),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _saveNote,
            child: Text("Save Evidence"),
          ), 
        ],
      ),
    ),
  );
}
}
void _pickImageFromCamera(ImageSource camera) {
}