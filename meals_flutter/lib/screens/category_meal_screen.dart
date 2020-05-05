import 'package:flutter/material.dart';
import 'package:meals_flutter/widgets/meal_item.dart';
import '../dummy_data.dart';
import 'package:meals_flutter/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "CategoryMealsScreen";

  final List<Meal>  avaiableMeals;

  CategoryMealsScreen(this.avaiableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void initState() {
    super.initState();
  }

  bool _localMealLoaded = false;

  @override
  void didChangeDependencies() {
    if (!_localMealLoaded) {
      final rounteArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      this.categoryTitle = rounteArgs['title'];
      final categoryId = rounteArgs['id'];
      this.displayMeals = this.widget.avaiableMeals;
      _localMealLoaded = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            final ctgMeal = displayMeals[index];
            return MealItem(
              id: ctgMeal.id,
              title: ctgMeal.title,
              imageUrl: ctgMeal.imageUrl,
              affordability: ctgMeal.affordability,
              complexity: ctgMeal.complexity,
              duration: ctgMeal.duration,
              removeItem: () => _removeMeal(ctgMeal.id),
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
