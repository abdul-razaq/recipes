import 'package:flutter/material.dart';

import 'recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.grey, secondary: Colors.black),
      ),
      home: const RecipeHome(title: "Recipe Calculator"),
    );
  }
}

class RecipeHome extends StatefulWidget {
  final String title;

  const RecipeHome({required this.title});

  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return buildRecipeCard(Recipe.recipes[index]);
          },
          itemCount: Recipe.recipes.length,
        ),
      ),
    );
  }

  void handleRecipeTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Text('Recipe Detail page');
        },
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return GestureDetector(
      onTap: handleRecipeTap,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(recipe.imageUrl),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                recipe.label,
                style: const TextStyle(
                    fontFamily: 'Palatino',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
