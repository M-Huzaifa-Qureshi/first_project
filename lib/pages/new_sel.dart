import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase_project/classes.dart';
import 'package:newfirebase_project/pages/add_cart.dart';
import 'package:newfirebase_project/provider/provider_class.dart';
import 'package:provider/provider.dart';

class NewSel extends StatefulWidget {
  final String? image, text;
  late final String? price;
  final Color? color;
  NewSel({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
    required this.color,
  }) : super(key: key);

  @override
  State<NewSel> createState() => _NewSelState();
}

class _NewSelState extends State<NewSel> {
  bool isHover = false;
  int Itemcount = 1;

  void add() {
    setState(() {
      Itemcount++;
    });
  }

  void remove() {
    if (Itemcount > 1) {
      setState(() {
        Itemcount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<huzaifa>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState((){
                
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCart()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(

                  color: widget.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     InteractiveViewer(

                       boundaryMargin: EdgeInsets.only(left: 5,right: 5),
                         scaleEnabled: true,
                         maxScale: 11.0,
                         minScale: 0.01,
                         child: CachedNetworkImage(imageUrl: widget.image.toString(),)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.text.toString()),
                          Text(widget.price.toString()),
                        ],
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star_purple500,
                            color: Colors.yellow,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('order Delicious Food'),
                  Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            remove();
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$Itemcount',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            add();
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                " when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              ),
              SizedBox(height: 10),
              InkWell(
                onHover: (value) {
                  setState(() {
                    isHover=value;
                  });
                },

                onTap: () {
                  int price = int.tryParse(widget.price.toString()) ?? 0;

                  CardProduct item = CardProduct(
                    title: widget.text.toString(),
                    price: double.parse(widget.price!),
                    quantity: Itemcount,
                    imageUrl: widget.image.toString(),
                  );
                  if(cartProvider.itemInCart(widget.text.toString())){
                    Utils().toastMessage("Item is already in cart");
                  }else{
                    cartProvider.addtoCart(item);
                    Utils().toastMessage("Item added to cart cart");

                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isHover == true? Colors.teal.shade700 : Colors.teal,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
