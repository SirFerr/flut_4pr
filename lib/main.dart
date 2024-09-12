import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рецепты',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Навигация по спискам'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ColumnListScreen()),
                );
              },
              child: const Text('Список на Column'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListViewScreen()),
                );
              },
              child: const Text('Список на ListView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListViewSeparatedScreen()),
                );
              },
              child: const Text('Список на ListView.separated'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnListScreen extends StatefulWidget {
  const ColumnListScreen({Key? key}) : super(key: key);

  @override
  _ColumnListScreenState createState() => _ColumnListScreenState();
}

class _ColumnListScreenState extends State<ColumnListScreen> {
  List<String> recipes = ['Рецепт 1', 'Рецепт 2', 'Рецепт 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список рецептов (Column)'),
      ),
      body: Column(
        children: <Widget>[
          for (var recipe in recipes)
            ListTile(
              title: Text(recipe),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    recipes.remove(recipe);
                  });
                },
              ),
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                recipes.add('Рецепт '+(recipes.length+1).toString());
              });
            },
            child: const Text('Добавить рецепт'),
          ),
        ],
      ),
    );
  }
}

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> recipes = ['Рецепт 1', 'Рецепт 2', 'Рецепт 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список рецептов (ListView)'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  recipes.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            recipes.add('Рецепт '+(recipes.length+1).toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({Key? key}) : super(key: key);

  @override
  _ListViewSeparatedScreenState createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  List<String> recipes = ['Рецепт 1', 'Рецепт 2', 'Рецепт 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список рецептов (ListView.separated)'),
      ),
      body: ListView.separated(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  recipes.removeAt(index);
                });
              },
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            recipes.add('Рецепт '+(recipes.length+1).toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
