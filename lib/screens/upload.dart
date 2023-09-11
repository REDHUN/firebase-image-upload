import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  ImagePicker image = ImagePicker();
  File? file;

  Widget photo = Container(
    padding: const EdgeInsets.only(top: 40),
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1547721064-da6cfb341d50'),
        fit: BoxFit.cover,
      ),
      // color: Colors.blueAccent,
      border: Border.all(
        color: Colors.white,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    height: 90,
    width: 90,
  );
  void setview() {
    setState(() {
      photo = Container(
        padding: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 90,
        width: 90,
      );
    });
  }

  imageselection() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);

      photo = Container(
        //padding: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          // color: Colors.blueAccent,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        // height: 120,
        //width: 120,
        child: ClipOval(
          child: Image.file(
            file!,
            fit: BoxFit.fill,
            height: 90,
            width: 90,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload'),
        backgroundColor: Theme.of(context).copyWith().primaryColorLight,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).copyWith().primaryColorLight,
          //     gradient: LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 117, 4, 223),
          //     Color.fromARGB(31, 57, 37, 73)
          //   ],
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          // ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  photo,
                  Positioned(
                    top: 70,
                    left: 20,
                    bottom: 13,
                    child: IconButton(
                        onPressed: () {
                          imageselection();
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text(
                    'Name',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.white, width: 4.0)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                decoration: InputDecoration(
                  label: Text(
                    'Number',
                    style: TextStyle(color: Colors.white),
                    selectionColor: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.white, width: 4.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.white, width: 4.0)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    imageselection;
                  },
                  child: const Text('Upload')),
            ],
          ),
        ),
      ),
    );
  }
}
