import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/classes/Gri.dart';
import 'package:newfirebase_project/pages/add_list.dart';
import 'package:newfirebase_project/pages/get_Image.dart';
import 'package:newfirebase_project/pages/login_screen.dart';
import 'package:newfirebase_project/pages/new_sel.dart';
import 'package:newfirebase_project/pages/signup.dart';
import 'package:provider/provider.dart';

import '../classes/model_class.dart';
import '../provider/favourite_class.dart';
import '../provider/provider_class.dart';
import 'bottom_navigation.dart';

class PostPage extends StatefulWidget {
  PostPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int muIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteClass>(context);

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.white,
              iconSize: 25,
              selectedItemColor: Colors.tealAccent,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              currentIndex: muIndex,
              onTap: (index) {
                setState(() {
                  muIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.teal,
                  label: 'home',
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.teal,
                  label: 'alarm',
                  icon: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => BottomNavigation(),));
                    },
                    child: Icon(
                      Icons.alarm_on_outlined,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.teal,
                  label: 'disable',
                  icon: Icon(
                    Icons.accessible_forward_rounded,
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.teal,
                  label: 'person',
                  icon: Icon(
                    Icons.account_circle_outlined,
                  ),
                ),
              ],
            ),
            appBar: AppBar(
              backgroundColor: Colors.teal,
              centerTitle: true,
              title: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                 animatedTexts: [
                  RotateAnimatedText('Hi! Flutter',textStyle: TextStyle(
                    color: Colors.white
                  ),duration: Duration(milliseconds: 1000))
                 ],
              ),
              actions: [
                CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    'images/perd.png',
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)

                      ),

                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('confirm LOgout'),
                                    content: Text(
                                        'are you sure want to logout your account'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => SignUp(),
                                              ));
                                        },
                                        child: Text('cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          auth.signOut();
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => login_screen(),
                                              ),
                                            );
                                          });
                                        },
                                        child: Text('logout'),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.logout),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddList(),));
                            },
                              child: Icon(Icons.favorite_border)),
                          SizedBox(height: 20),
                          Icon(Icons.account_circle),

                        ],
                      ),
                    ),
                  );

                },),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What do you want\nfor dinner',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetData(),
                            ),
                          );
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          Items[index].image.toString(),
                                        ),
                                      ),
                                      Text(Items[index].text.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Recommended',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('huzaifa')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('error');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: documents.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount:
                                (orientation == Orientation.portrait) ? 2 : 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =documents[index].data() as Map<String, dynamic>;
                            String foodType = data['foodType'];
                            String imageUrl = data['imageUrl'];
                            String title = data['title'];
                            String price = data['price'];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewSel(
                                        color: GridItems[index].color,
                                        price: price,
                                        image: imageUrl,
                                        text: title,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: GridItems[index].color,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 120,
                                            width: 200,
                                            child: CachedNetworkImage(
                                              imageUrl: imageUrl,
                                              fit: BoxFit.cover,
                                            )),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(title),
                                            InkWell(
                                                onTap: () {
                                                  FavouriteItem fav =
                                                      FavouriteItem(
                                                          title: 'title',
                                                          price: 33,
                                                          image: imageUrl,
                                                          title1: 'huzaifa');
                                                  favProvider.addfav(fav);
                                                },
                                                child:
                                                    Icon(Icons.favorite_border))
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(price.toString()),
                                            Text(foodType.toString())
                                            //  Text(GridItems[index].price.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
