import 'food_model.dart';

class Order{
  Food item;
  int numberInStock = 1;
  late String id = item.name + item.id.toString();

  Order(this.item);
  Order.dummyId(this.item){
    id = 'dummy';
  }
}