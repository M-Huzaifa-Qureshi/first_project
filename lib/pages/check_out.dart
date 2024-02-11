import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newfirebase_project/classes.dart';
import 'package:newfirebase_project/classes/class_check.dart';
import 'package:newfirebase_project/pages/RoundButton.dart';
import 'package:provider/provider.dart';

import '../provider/provider_class.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut>{
  File?image;
  Future<void>getPic()async{
    final imagePicker= ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickImage !=null?File(pickImage.path):null;
    });
  }
  final loading = false;
  final forms = GlobalKey<FormState>();
  final emailController = TextEditingController();
   final  contactNumber = TextEditingController();
  final fullName = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();
  final countryName = TextEditingController();
  final state = TextEditingController();
   String? imageUrl;
  Future<void> UploadTask(BuildContext context)async{
    try{
      final FirebaseRef =FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.png');
      final bytes= await image?.readAsBytes();
      final Uint8List? list = bytes?.buffer.asUint8List();
      await FirebaseRef.putData(list!,SettableMetadata(contentType: 'image/png'));
       imageUrl = await FirebaseRef.getDownloadURL();
      // await Check.collection().add(checkout);

      setState(() {

      });
    }catch(e){}
  }
  @override
  Widget build(BuildContext context) {
    huzaifa cartProvider = Provider.of<huzaifa>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: Form(
        key: forms,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    getPic();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                  radius: 60,
                  backgroundImage: image!=null?FileImage(image!):null,
                  ),
                ),

                TextFormField(
                  controller: contactNumber,
                  decoration: InputDecoration(
                    hintText: 'Contact  Number',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: countryName,
                  decoration: InputDecoration(
                    hintText: 'Country name',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    hintText: 'Current address',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: state,
                  decoration: InputDecoration(
                    hintText: 'stata e.g islamabad',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller:emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10),
                RoundButton(
                  loading: loading,
                  title: 'Check out',
                  Ontap: ()async {
                  await  UploadTask(context);
                    Check checkout = Check(
                      date: DateTime.now(),

                      ImageUrl: imageUrl.toString(),
                        address: address.text.trim(),
                        FullName: fullName.text.trim(),
                        contactno: contactNumber.text.trim(),
                        Email: email.text.trim(),
                        CountryName: countryName.text.trim(),
                        State: state.text.trim(),
                        items: cartProvider.carditems.map((item){
                          return {
                            'title':item.title,
                            'imageUrl':item.imageUrl,
                            'price':item.price,
                            'quantity':item.quantity
                          };
                    }).toList());
                    await Check .collection().add(checkout);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
