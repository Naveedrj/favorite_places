import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/place_views/list.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({Key? key}) : super(key: key);

  @override
  _NewPlaceScreenState createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  final _titleCtrl = TextEditingController();

  void _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleCtrl,
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: _uploadImage,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black54,
                  ),
                ),
                height: 250,
                width: double.infinity,
                child: _pickedImage != null
                    ? Image.file(
                  _pickedImage!,
                  fit: BoxFit.cover,
                )
                    : TextButton.icon(
                  onPressed: _uploadImage,
                  icon: const Icon(Icons.upload),
                  label: const Text('Upload an Image'),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black54,
              ),
              onPressed: (){
                
                if(_pickedImage == null || _titleCtrl == ''){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Something Went Wrong'))
                  );
                }
                
                ref.read(placeProvider.notifier).addPlace(Place(title: _titleCtrl.text, image: _pickedImage!));
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceList()));
              },
              child: const Text('Add place'),
            ),
          ],
        ),
      ),
    );
  }
}
