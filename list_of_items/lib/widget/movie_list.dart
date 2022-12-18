import 'package:list_of_items/model/movie_list.dart';
import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieList item;

  final VoidCallback onClicked;

  const MovieItemWidget({
    required this.item,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200,
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(item.urlImage),
          ),
          title: Text(item.title, style: const TextStyle(fontSize: 19)),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red, size: 28),
            onPressed: onClicked,
          ),
        ),
      );
}
