import 'dart:io';

import 'package:bloc_practice/bloc/image%20bloc/image_bloc.dart';
import 'package:bloc_practice/bloc/image%20bloc/image_events.dart';
import 'package:bloc_practice/bloc/image%20bloc/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _showImageOptions(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Edit',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child:
              BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
                return state.file == null
                    ? Icon(
                  Icons.note_add_rounded,
                  color: Colors.white,
                  size: 30,
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(
                      state.file!.path.toString(),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}


_showImageOptions(BuildContext context) {
  showModalBottomSheet(context: context, builder: (context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ElevatedButton(onPressed: (){
        context.read<ImageBloc>().add(CaptureCameraImage());
      }, child: Row(
        children: [
          Icon(Icons.camera),
          Text('Camera'),
        ],
      ),),

      ElevatedButton(onPressed: (){
        context.read<ImageBloc>().add(PickGalleryImage());
      }, child: Row(
        children: [
          Icon(Icons.photo_library_sharp),
          Text('Gallery'),
        ],
      ),),
    ],
  ));
}