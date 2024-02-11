// import 'package:flutter/material.dart';
// import 'package:newfirebase_project/provider/favourite_class.dart';
// import 'package:provider/provider.dart';
//
// class AddList extends StatefulWidget {
//   const AddList({super.key});
//
//   @override
//   State<AddList> createState() => _AddListState();
// }
//
// class _AddListState extends State<AddList> {
//   @override
//   Widget build(BuildContext context) {
//   // final addProvider = Provider.of<FavouriteItem>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('add Lsit'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Consumer<FavouriteItem>(builder:
//                 (context, FavItem, child) {
//               return ListTile(
//               leading: Text(FavItem.title.toString()),
//               );
//
//                 },
//             )
//
//           ],
//         ),
//       ),
//
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/pages/RoundButton.dart';
import 'package:newfirebase_project/pages/check_out.dart';
import 'package:newfirebase_project/provider/favourite_class.dart';
import 'package:newfirebase_project/provider/provider_class.dart';
import 'package:provider/provider.dart';

class AddList extends StatefulWidget {
  AddList({Key? key}) : super(key: key);

  @override
  State<AddList> createState() => _AddCartState();
}

class _AddCartState extends State<AddList> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Favourite List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<FavouriteClass>(
          builder: (context, favtprovider, child) {
            return ListView.builder(
              itemCount: favtprovider.favt.length,
              itemBuilder: (context, index) {
                var items = favtprovider.favt[index];
                return  Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          child: CachedNetworkImage(imageUrl: items.image![index])),
                      title:  Text(items.title.toString()),
                      subtitle:  Text(items.price.toString()),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     IconButton(onPressed: (){
                    //       favtprovider.removeCart(favtprovider.favt[index]);
                    //     }, icon: Icon(Icons.delete)),
                    //     Container(
                    //       width: 130,
                    //       decoration: BoxDecoration(
                    //           border: Border.all()
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           IconButton(onPressed: (){
                    //             cartProvider.carditems[index].quantity--;
                    //             setState(() {
                    //
                    //             });
                    //           }, icon: Icon(Icons.remove)),
                    //           Text(cartProvider.carditems[index].quantity.toString()),
                    //           IconButton(onPressed: (){
                    //             cartProvider.carditems[index].quantity++;
                    //             setState(() {
                    //             });
                    //           }, icon: Icon(Icons.add)),
                    //
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: 20),


                  ],
                );
              },
            );
          },
        ),
      ),


    );
  }
}