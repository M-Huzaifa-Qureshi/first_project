import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newfirebase_project/classes.dart';
import 'package:newfirebase_project/classes/firebase_model.dart';
import 'package:newfirebase_project/pages/RoundButton.dart';
import 'package:newfirebase_project/pages/login_screen.dart';
import 'package:newfirebase_project/pages/post_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  File? _image;
  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage != null ? File(pickedImage.path) : null;
    });
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  final form = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Future<void> _uploadTask(BuildContext context) async {
    if (form.currentState?.validate() ?? false) {
      setState(() {
        loading = true;
      });

      try {
        // Upload image to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.png');

        final bytes = await _image?.readAsBytes();
        final Uint8List? list = bytes?.buffer.asUint8List();
        await storageRef.putData(list!, SettableMetadata(contentType: 'image/png'));

        final imageUrl = await storageRef.getDownloadURL();

        // Create Firestore document with image URL and other data
        FireBaseNew newUser = FireBaseNew(
          FirstName: firstNameController.text.trim(),
          LastName: lastNameController.text.trim(),
          PhoneNumber: int.parse(phoneNumberController.text.trim()),
          ImageUrl: imageUrl,
        );

        // Add the document to the Firestore collection
        await FireBaseNew.collection().add(newUser);

        setState(() {
          loading = false;
        });

        Utils().toastMessage('Account has been created successfully!');
      } catch (error) {
        Utils().toastMessage('Error uploading image: $error');
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: form,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      _getImage();
                    },
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey,
                        ),
                        child: _image != null
                            ? ClipOval(
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Icon(
                          Icons.photo,
                          size: 30,
                        )),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofillHints: Characters.empty,
                    autocorrect: true,
                    showCursor: true,
                    cursorColor: Colors.teal,
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'First Name',
                      suffixIcon: Icon(
                        Icons.create,
                        color: Colors.teal,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofillHints: Characters.empty,
                    autocorrect: true,
                    showCursor: true,
                    cursorColor: Colors.teal,
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: ' Last Name',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Last Name',
                      suffixIcon: Icon(
                        Icons.create,
                        color: Colors.teal,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofillHints: Characters.empty,
                    autocorrect: true,
                    showCursor: true,
                    cursorColor: Colors.teal,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Enter Phone Number',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Enter Phone Number',
                      suffixIcon: Icon(
                        Icons.phone_rounded,
                        color: Colors.teal,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofillHints: Characters.empty,
                    autocorrect: true,
                    showCursor: true,
                    cursorColor: Colors.teal,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Email',
                      suffixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.teal,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    autofillHints: Characters.empty,
                    autocorrect: true,
                    showCursor: true,
                    cursorColor: Colors.teal,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Enter Password',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Password',
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.teal,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RoundButton(
                    loading: loading,
                    title: 'Sign Up',
                    Ontap: () async {
                     await _uploadTask(context);

                      auth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString())..then((value) {
                          setState(() {
                            loading = false;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage(),));
                          });
                        })
                        .onError((error, stackTrace){
                          Utils().toastMessage(error.toString());
                          setState(() {
                            loading = false;
                          });
                        });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );co
  }
}
