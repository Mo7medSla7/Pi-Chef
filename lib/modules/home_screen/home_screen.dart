import 'package:flutter/material.dart';
import 'package:foods_app/network/api_helper.dart';
import 'package:provider/provider.dart';

import '../../models/food_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'You May Like To Try',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildRandomSectionItem(ProviderHelper.randomPizza[index]),
              itemCount: ProviderHelper.randomPizza.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Top Categories',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              Spacer(),
              Consumer<ProviderHelper>(
                builder: (context, model, child) => TextButton(
                  onPressed: () {
                    model.changeScreen(1);
                  },
                  child: const Text('See all'),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(15).copyWith(top: 0),
            padding: const EdgeInsets.all(5),
            height: 190,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Card(
                          elevation: 10,
                          color: Colors.blue[300],
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/categories/pizza.png',
                              height: 120,
                              width: 120,
                            ),
                          )),
                      onTap:() =>Navigator.push(context, MaterialPageRoute(builder: (context)=> buildCategoryScreen(ProviderHelper.pizza))),
                    ),
                    const Text(
                      'Pizza',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Card(
                          elevation: 10,
                          color: Colors.yellow[300],
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/categories/drinks.png',
                              height: 120,
                              width: 120,
                            ),
                          )),
                      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> buildCategoryScreen(ProviderHelper.drinks))),
                    ),
                    const Text(
                      'Drinks',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Card(
                          elevation: 10,
                          color: Colors.purple[300],
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/categories/spaguetti.png',
                              height: 120,
                              width: 120,
                            ),
                          )),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.pasta))),
                    ),
                    const Text(
                      'Pasta',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Card(
                          elevation: 10,
                          color: Colors.green[300],
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'assets/images/categories/sweets.png',
                              height: 120,
                              width: 120,
                            ),
                          )),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.dessert))),
                    ),
                    const Text(
                      'Dessert',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0).copyWith(top: 10, bottom: 5),
            child: const Text(
              'Popular this week',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                buildPopularSectionItem(ProviderHelper.popularFoods[index]),
            itemCount: ProviderHelper.popularFoods.length,
          ),
        ],
      ),
    );
  }

  Widget buildRandomSectionItem(Food item) => Consumer<ProviderHelper>(
        builder: (context, model, child) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                  item.image,
                  height: 150,
                  width: 200,
                ),
                Row(
                  children: [
                    if (item.spicy)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '  Spicy  ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    if (item.vegetarian)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '  vegetarian  ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '${item.price} \$',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          model.addOrder(item);
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          size: 30,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildPopularSectionItem(Food item) => Consumer<ProviderHelper>(
      builder: (context, model, child) => Card(
            child: Row(
              children: [
                Image.network(
                  item.image,
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${item.price} \$',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    model.addOrder(item);
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 30,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ));

  Widget buildCategoryScreen(List foods)=>Scaffold(
    appBar: AppBar(title: Text(foods[0].type.toUpperCase()),),
    body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context,index)=>Card(
          child: Row(
            children: [
              Image.network(foods[index].image,height: 120,width: 120,fit: BoxFit.contain,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foods[index].name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('${foods[index].price} \$',style: const TextStyle(fontSize: 16,color: Colors.grey),),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        if(foods[index].spicy)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding:  EdgeInsets.all(5.0),
                              child:  Text('  Spicy  ',style: TextStyle(color: Colors.white,fontSize: 16),),
                            ),
                          ),
                        if(foods[index].vegetarian)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding:  EdgeInsets.all(5.0),
                              child:  Text('  vegetarian  ',style: TextStyle(color: Colors.white,fontSize: 16),),
                            ),
                          ),
                      ],),
                  ],
                ),
              ),
              const Spacer(),
              Consumer<ProviderHelper>(builder: (context, model, child) =>IconButton(
                onPressed: (){
                  model.addOrder(foods[index]);
                },
                icon: const Icon(
                  Icons.add_circle,
                  size: 30,
                  color: Colors.brown,
                ),
              ),
              )
            ],
          ),
        )
    ),
  );

}
