
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/classes/firebase_model.dart';

class GetData extends StatefulWidget {

  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  late Future<QuerySnapshot< FireBaseNew>> data =  FireBaseNew.collection().get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<FireBaseNew>>(stream:data.asStream(), builder:
            (context, snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }
              return SizedBox(
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder:  (context, index) {
                    FireBaseNew info = snapshot.data!.docs[index].data();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.teal
                        )
                      ),

                      subtitle: Text(info.PhoneNumber.toString()),
                      title: Text(info.FirstName.toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(info.ImageUrl.toString()),
                      ),
                    ),
                  );





                },),
              );

            },),

          ],
        ),
      ),
    );
  }
}
