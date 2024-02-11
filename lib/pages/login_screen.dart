import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/classes.dart';
import 'package:newfirebase_project/pages/RoundButton.dart';
import 'package:newfirebase_project/pages/post_page.dart';
import 'package:newfirebase_project/pages/signup.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});
  @override
  State<login_screen> createState() => _login_screenState();
}
class _login_screenState extends State<login_screen> {
  ValueNotifier<bool> toggle = ValueNotifier(false);
  String hinText = '';
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double = MediaQuery.sizeOf(context).height;
    final doubles = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Login Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                    autofillHints: Characters.empty,

                      autocorrect: true,
                      showCursor: true,
                      cursorColor: Colors.teal,
                      controller: emailController,
                      decoration: InputDecoration(

                        labelText: 'Enter Email',
                        labelStyle: TextStyle(
                          color: Colors.teal
                        ),
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.mail_outline_outlined,color: Colors.teal,),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {

                      },
                      autofillHints: Characters.empty,
                      obscureText: toggle.value,

                      autocorrect: true,
                      showCursor: true,
                      cursorColor: Colors.teal,
                      controller: passwordController,
                      decoration: InputDecoration(

                        labelText: 'Enter Password',
                        labelStyle: TextStyle(
                            color: Colors.teal
                        ),
                        hintText: 'password',
                        suffixIcon: InkWell(
                          onTap: () {
                           setState(() {
                             toggle.value=!toggle.value;
                           });
                          },
                            child: Icon(toggle.value?Icons.visibility_off:Icons.visibility,color: Colors.teal,)),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                      loading: loading,
                      title: 'Login ',
                      Ontap: () {
                        auth.signInWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString()).then((value) {
                              Utils().toastMessage(value.user!.email.toString());
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage(),));
                        }).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont hava an account?  '),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ));
                            },
                            child: Text('Sign up'))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
