import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txt = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  File? _imageFile;
  Uint8List? _webImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: txt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                  suffixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: _imageFile == null && _webImage == null
                    ? Text("No File Selected")
                    : kIsWeb
                        ? Image.memory(_webImage!)  // Display image on web
                        : Image.file(_imageFile!),  // Display image on mobile
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  if (kIsWeb) {
                    setState(() async {
                      _webImage = await pickedImage.readAsBytes();
                    });
                  } else {
                    setState(() {
                      _imageFile = File(pickedImage.path);
                    });
                  }
                }
              },
              child: Text('Select image'),
            ),
            FloatingActionButton(
              onPressed: () async {
                var imageName = DateTime.now().millisecondsSinceEpoch.toString();
                var storageRef = FirebaseStorage.instance.ref().child('driver_images/$imageName.jpg');

                if (kIsWeb) {
                  // For web, use putData
                  await storageRef.putData(_webImage!);
                } else {
                  // For mobile, use putFile
                  await storageRef.putFile(_imageFile!);
                }

                var downloadUrl = await storageRef.getDownloadURL();
                await db.collection("Demo").add({
                  "Name": txt.text,
                  "Image": downloadUrl.toString(),
                });
              },
              child: Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
