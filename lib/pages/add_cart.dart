import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/pages/RoundButton.dart';
import 'package:newfirebase_project/pages/check_out.dart';
import 'package:newfirebase_project/provider/provider_class.dart';
import 'package:provider/provider.dart';

class AddCart extends StatefulWidget {
  AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Add Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<huzaifa>(
          builder: (context, cartProvider, child) {
            final items = cartProvider.carditems;
            return ListView.builder(
              itemCount: cartProvider.carditems.length,
              itemBuilder: (context, index) {
                var items = cartProvider.carditems[index];
                return  Column(
                  children: [
                    ListTile(
                      leading: CachedNetworkImage(imageUrl: items.imageUrl),
                      title:  Text(items.title),
                      trailing:  Text((items.price * cartProvider.carditems[index].quantity).toString()),
                      subtitle:  Text(items.quantity.toString()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){
                          cartProvider.removeCart(cartProvider.carditems[index]);
                        }, icon: Icon(Icons.delete)),
                        Container(
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all()
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(onPressed: (){
                                cartProvider.carditems[index].quantity--;
                                setState(() {
                                  
                                });
                              }, icon: Icon(Icons.remove)),
                              Text(cartProvider.carditems[index].quantity.toString()),
                              IconButton(onPressed: (){
                                cartProvider.carditems[index].quantity++;
                                setState(() {
                                });
                              }, icon: Icon(Icons.add)),

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),


                  ],
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) => CheckOut(),));
          },
          child: Container(
            decoration:   BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            child: Text('Check Out'),
          ),
        ),
      ),

    );
  }
}