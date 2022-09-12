import 'package:flutter/material.dart';
import 'package:foods_app/network/api_helper.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 10,
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.pizza))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.blue[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/pizza.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.only(left:8.0),
              child: Text('Pizza',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.pizza.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.pasta))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.purple[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/spaguetti.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child:  Text('Pasta',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.pasta.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.dessert))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.green[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/sweets.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child:  Text('Dessert',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.dessert.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.drinks))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.yellow[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/drinks.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child:  Text('Drinks',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.drinks.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.sauces))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.orange[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/sauce.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child:  Text('Sauce',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.sauces.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.salads))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.pink[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/salad.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child:  Text('Salad',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.salads.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>buildCategoryScreen(ProviderHelper.sides))),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  color: Colors.brown[300],
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/categories/onion_ring.png',height: 120,width: 120,),
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 8.0),
              child:  Text('Side',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${ProviderHelper.sides.length} Type',style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),
          ],
        ),
      ],
    );
  }
  
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
