import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  bool loading;
  final VoidCallback?Ontap;
   RoundButton({ required this.loading, required this.title,required this.Ontap,super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: Ontap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.teal,
        ),
        child:loading ? CircularProgressIndicator(color: Colors.pinkAccent,strokeWidth: 4,):Text(title),


      ),
    );
  }
}
