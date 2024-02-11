

import 'package:flutter/cupertino.dart';

class FavouriteClass extends ChangeNotifier{
  final List<FavouriteItem> _favouriteItems = [];
  List<FavouriteItem> get  favt => _favouriteItems;
  void addfav(FavouriteItem fav){
    _favouriteItems.add(fav);
    notifyListeners();
  }
  void removefav(FavouriteItem fav){
    _favouriteItems.remove(fav);
    notifyListeners();
  }
  bool InFav(String title){
    return _favouriteItems.any((fav) => fav.title==title );


  }

}

class FavouriteItem {

  String?title;
  String?image;
  double?price;
  String?title1;
  FavouriteItem({
    required this.title,required this.price,required this.image,required this.title1

});

}