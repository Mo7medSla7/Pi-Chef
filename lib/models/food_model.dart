class Food {
  late int id;
  late String name;
  late List<dynamic> ingredients;
  late bool spicy;
  late bool vegetarian;
  late dynamic price;
  late String image;
  late String type;

  Food.fromJson(Map<String,dynamic> json,this.type){
    id = json['id'];
    name = json['name'];
    ingredients = json['ingredients'];
    spicy = json['spicy'];
    vegetarian = json['vegetarian'];
    price = json['price'];
    image = json['image'];
  }
}