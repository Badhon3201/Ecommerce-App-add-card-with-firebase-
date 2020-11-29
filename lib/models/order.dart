import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'cart.dart';
import 'dart:convert';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier{
  List<OrderItem> _orders =[];

  List<OrderItem> get order {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total)async{
    final url = 'https://food-20f61.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    try{
      final response = await http.post(
        url,
        body: json.encode({
          'id':DateTime.now().toString(),
          'amount': total,
          'dateTime':timeStamp.toIso8601String(),
          'products':cartProducts
          .map((cp) => {
            'id': cp.id,
            'title':cp.name,
            'quantity':cp.quantity,
            'price': cp.price,
          })
          .toList(),
        })
      );
      _orders.insert(0, OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          products: cartProducts,
          dateTime: timeStamp,
      ));
      notifyListeners();
    }catch(err){
      throw err;
    }

  }



}