import 'package:flutter/material.dart';
import 'package:foods_app/constants.dart';
import 'package:foods_app/network/api_helper.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHelper>(
      builder: (context, model, child) =>model.orders.isEmpty?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children:  const[
                      Icon(Icons.shopping_cart_checkout,size: 80,color: Colors.grey,),
                      Text('You have no orders yet',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
               ],
              ),
                )
          :Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder:  (context ,index)=>Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onLongPress: () => showDialog(
                        context: context,
                        builder:(context) => AlertDialog(
                          title: const Text('Delete',style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),
                          content: Text('Are you sure you want to delete ${model.orders[index].numberInStock} ${model.orders[index].item.name}'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child:const  Text('Cancel')),
                            TextButton(onPressed: (){
                              model.removeOrder(index);
                              Navigator.pop(context);
                            }, child: const Text('Delete')),
                          ],
                        ),),
                    child: Card(
                      child: Row(
                        children: [
                          Image.network(model.orders[index].item.image,height: 50,width: 50,fit: BoxFit.contain,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(model.orders[index].item.name,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                                Text('${model.orders[index].item.price} \$',style: const TextStyle(fontSize: 12,color: Colors.grey),),
                                const SizedBox(height: 8,),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.all(8),
                            child: Row(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: TextButton(
                                        onPressed: (){
                                          model.reduceOrder(index);
                                        },

                                        child:const Text('-',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18) ,)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Text(model.orders[index].numberInStock.toString()),
                                  ),
                                  SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: TextButton(child:const Text('+',style:TextStyle(fontSize: 18) ,) ,
                                          onPressed: (){
                                        model.increaseOrder(index);
                                          })),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount:model.orders.length,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text('Total',style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('${model.totalPrice.toStringAsFixed(2)} \$',style: const TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(35),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => buildOrderScreen(model,context),));
                },
                  child: const Text('PLACE YOUR ORDER')),
            )
          ],
        ),
    );
  }

  Widget buildOrderScreen(model,context)=>Scaffold(
    appBar: AppBar(title: const Text('Checkout'),centerTitle: true,),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Delivery Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: const Text('Your Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
            child: Text(address,style: const TextStyle(color: Colors.grey,fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: const Text('Your Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
            child: Text(phoneNumber,style: const TextStyle(color: Colors.grey,fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: const Text('Payment Method',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
            child: const Text('Cash',style: const TextStyle(color: Colors.grey,fontSize: 14)),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cost',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text('${model.totalPrice} \$',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text('Delivery Fee',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              Text('10 \$',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ],),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              Text('${model.totalPrice + 10} \$',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ),
          ],),
          const Spacer(),
          ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(35),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                onPressed: (){
                  model.orderComplete();
                  Navigator.pop(context);
                },
                child: const Text('ORDER')),
        ],
      ),
    ),
  );
}
