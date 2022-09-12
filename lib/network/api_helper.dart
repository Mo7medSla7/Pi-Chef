import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foods_app/models/food_model.dart';
import 'package:foods_app/models/order_model.dart';
import 'package:foods_app/modules/categories_screen/categories_screen.dart';
import 'package:foods_app/modules/home_screen/home_screen.dart';
import 'package:foods_app/modules/orders_screen/orders_screen.dart';
import 'package:http/http.dart' as http;

class ProviderHelper extends ChangeNotifier {

  static List<Food> pizza = [];
  static List<Food> pasta = [];
  static List<Food> salads = [];
  static List<Food> dessert = [];
  static List<Food> drinks = [];
  static List<Food> sauces = [];
  static List<Food> sides = [];


  static getAllFoods() async {
    Uri path = Uri.https('gunter-food-api.herokuapp.com', '/pizza',);
    var response = await http.get(path);
    List items = jsonDecode(response.body);
    pizza = items.map((item) => Food.fromJson(item, 'pizza')).toList();

    path = Uri.https('gunter-food-api.herokuapp.com', '/pasta',);
    response = await http.get(path);
    items = jsonDecode(response.body);
    pasta = items.map((item) => Food.fromJson(item, 'pasta')).toList();

    path = Uri.https('gunter-food-api.herokuapp.com', '/salads',);
    response = await http.get(path);
    items = jsonDecode(response.body);
    salads = items.map((item) => Food.fromJson(item, 'salads')).toList();

    path = Uri.https('gunter-food-api.herokuapp.com', '/dessert',);
    response = await http.get(path);
    items = jsonDecode(response.body);
    dessert = items.map((item) => Food.fromJson(item, 'dessert')).toList();

    path = Uri.https('gunter-food-api.herokuapp.com', '/drinks',);
    response = await http.get(path);
    items = jsonDecode(response.body);
    drinks = items.map((item) => Food.fromJson(item, 'drinks')).toList();

    path = Uri.https('gunter-food-api.herokuapp.com', '/sauces',);
    response = await http.get(path);
    items = jsonDecode(response.body);
    sauces = items.map((item) => Food.fromJson(item, 'sauces')).toList();

    path = Uri.https('gunter-food-api.herokuapp.com', '/sides',);
    response = await http.get(path);
    items = jsonDecode(response.body);
    sides = items.map((item) => Food.fromJson(item, 'sides')).toList();
  }

  static List<Food> randomPizza = [];

  static getRandomPizza() {
    List tempPizza = List.from(pizza);
    randomPizza = List.generate(7, (index) {
      int random = Random().nextInt(tempPizza.length);
      var singlePizza = tempPizza[random];
      tempPizza.removeAt(random);
      return singlePizza;
    }
    );
  }

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    const CategoriesScreen(),
    OrdersScreen(),
  ];
  List<String> titles = [
    'Explore',
    'All Categories',
    'All Orders'
  ];

  void changeScreen(int index) {
    currentIndex = index;
    notifyListeners();
  }

  static List<Food> popularFoods = [
    pizza[2],
    pasta[0],
    pizza[10],
    pizza[15],
    dessert[3],
    sides[1],
  ];

  List<Order> orders = [];
  double totalPrice = 0;

  addOrder(Food food) {
    Order order = Order(food);
    Order? found = orders.firstWhere((element) => element.id==order.id,orElse: () => Order.dummyId(food),);
    if(found.id != 'dummy'){
     found.numberInStock++;
    }
    else{
      orders.add(order);
    }
    totalPrice+=found.item.price;
    notifyListeners();
    }

    increaseOrder(int index){
    orders[index].numberInStock++;
    totalPrice+=orders[index].item.price;
    notifyListeners();
    }

    reduceOrder(int index) {
      if(orders[index].numberInStock > 1) {
          orders[index].numberInStock--;
            totalPrice -= orders[index].item.price;
          } else {
        orders[index].numberInStock = 1;
          }
      notifyListeners();
    }

    removeOrder(int index) {
      totalPrice = totalPrice - (orders[index].item.price * orders[index].numberInStock);
      orders.removeAt(index);
      notifyListeners();
    }

    orderComplete(){
      orders.clear();
      totalPrice = 0.0;
      notifyListeners();
    }
}