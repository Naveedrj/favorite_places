import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceNotifier extends StateNotifier<List<Place>>{
  PlaceNotifier() : super([]);

  void addPlace(Place place){
    state = [...state , place];
  }

}

final placeProvider = StateNotifierProvider((ref) => PlaceNotifier());