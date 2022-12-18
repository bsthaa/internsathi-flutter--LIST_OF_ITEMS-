import 'package:flutter/material.dart';

import 'package:list_of_items/widget/movie_list.dart';

import 'data.dart';
import 'model/movie_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: const MainPage(
          title: 'Movie list',
        ),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    super.key,
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.movieList);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: buildInsertButton(),
            ),
          ],
        ),
      );

  Widget buildItem(item, int index, Animation<double> animation) =>
      MovieItemWidget(
        item: item,
        onClicked: () => removeItem(index),
      );

  Widget buildInsertButton() => IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.green,
          size: 40,
        ),
        onPressed: () => insertItem(1, Data.movieList.first),
      );

  void insertItem(int index, MovieList item) {
    items.insert(index, item);
    key.currentState!.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState!.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }
}
