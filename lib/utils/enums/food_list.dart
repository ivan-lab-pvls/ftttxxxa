import 'package:restaurantdelapp/utils/models/food_card_model.dart';

class FoodList {
  static List<FoodCardModel> foodList = [
    FoodCardModel(
        title: 'TOM YAM',
        image: 'assets/tom_yam.png',
        price: '\$8',
        ingredients:
            'Ingredients: chicken broth, tom yum pepper paste, lemon, fish sauce, sugar, lemongrass, ginger, lime, shrimp, mushrooms, coconut milk, cilantro, chili pepper'),
    FoodCardModel(
        title: 'RAMEN WITH SEAFOOD',
        image: 'assets/ramenws.png',
        price: '\$13',
        ingredients:
            'Ingredients: yellow onion, carrots, lemon, fish sauce, sugar, cloves garlic, chopped fresh parsley, Dijon mustard, tiger shrimp, chopped Taiwanese or napa cabbage'),
    FoodCardModel(
        title: 'WONTON SOUP',
        image: 'assets/wonton.png',
        price: '\$9.45',
        ingredients:
            'Ingredients: cloves garlic, tablespoons soy sauce, wonton wrappers, coconut milk, ounces ground pork, tablespoon soy sauce, teaspoon fresh ginger'),
    FoodCardModel(
        title: 'HULATAN SOUP',
        image: 'assets/hulatan.png',
        price: '\$9',
        ingredients: 'Ingredients: ginger, lime, shrimp, mushrooms, cloves garlic, yellow onion, cilantro, chili pepper'),
  ];
}
