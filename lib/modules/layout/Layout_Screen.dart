import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../network/api_helper.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title:Consumer<ProviderHelper>(builder: (context, model, child) => Text(
              model.titles[model.currentIndex],
              style: const TextStyle(color: Colors.black,) ,)
              ,)
        ),
        body: Consumer<ProviderHelper>(
        builder : (context,model,child){
          return model.screens[model.currentIndex];
        }),
        bottomNavigationBar: Consumer<ProviderHelper>(
          builder : (context,model,child){
            return BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: model.currentIndex,
              onTap: (index){
                model.changeScreen(index);
              },
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                const BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Stack(
                      alignment: Alignment.bottomRight,
                        children: [
                          const Icon(Icons.shopping_cart),
                          CircleAvatar(
                            child: Text(model.orders.length.toString(),style: TextStyle(fontSize: 12),),
                            radius:8,
                          ),
              ],
            ),
                label: 'Orders'
            ),
              ],
            );
          }
        ),
    );
  }
}
