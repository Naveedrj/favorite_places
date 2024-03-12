import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlaceView extends StatelessWidget {
  const PlaceView({
    required this.place,
    Key? key,
  }) : super(key: key);

  final Place place;



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: FileImage(place.image),
          ),
          title: Text(place.title),
          // You can add more widgets here to display additional information about the place
        ),
      ),
    );
  }
}
