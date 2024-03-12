import 'package:favorite_places/Screens/new_place_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/place_provider.dart';

import 'package:favorite_places/place_views/card.dart';
import 'package:favorite_places/models/place.dart';

class PlaceList extends ConsumerWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final places = ref.watch(placeProvider) as List<Place>;
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Favorite Places',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        ),
        actions: [
          TextButton.icon(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewPlaceScreen() )
                );
              },
              icon: const Icon(Icons.add),
              label: const Text(
                  'Add a place'
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount : places.length,
              itemBuilder: (context , index) => PlaceView(place: places[index]),
            ),
          )
        ],
      )
    );
  }
}
