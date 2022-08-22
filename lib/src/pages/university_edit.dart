import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../models/university_model.dart';
import 'package:flutter/material.dart';

class UniversityEdit extends StatefulWidget {
  UniversityEdit({Key? key, required this.university}) : super(key: key);
  final University university;
  @override
  State<UniversityEdit> createState() => _UniversityEditState();
}

class _UniversityEditState extends State<UniversityEdit> {
  File? image = new File("assets/images/university.webp");
  final controllerUniverstiyStudents = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporal = File(image.path);

      setState(() {
        this.image = imageTemporal;
      });
    } on PlatformException catch (e) {
      print("Failed to load image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit University"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 30)),
            ClipRRect(
              child: retornarImagen(),
            ),
            Padding(padding: const EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.orange),
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 12.0, right: 10, left: 10),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(right: 30)),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.orange),
                  onPressed: () => pickImage(ImageSource.camera),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 12.0, right: 10, left: 10),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(top: 30)),
            Text(
              widget.university.name,
              style: TextStyle(fontSize: 30, color: Colors.orange),
              textAlign: TextAlign.center,
            ),
            Padding(padding: const EdgeInsets.only(top: 20)),
            Text(
              widget.university.country,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Padding(padding: const EdgeInsets.only(top: 30)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervisor_account),
                        labelText: "Number of students",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(76, 90, 193, 1)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color.fromRGBO(76, 90, 193, 1)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color.fromRGBO(76, 90, 193, 1)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    controller: controllerUniverstiyStudents,
                    inputFormatters: returnFormatters(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: const EdgeInsets.only(top: 30)),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(76, 90, 193, 1)),
                      onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                setState(() {}),
                              }
                          },
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, right: 72.0, left: 72.0),
                          child: Text("Save", style: TextStyle(fontSize: 20))))
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 30)),
            Text(
              "The number of students is: " + controllerUniverstiyStudents.text,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Widget retornarImagen() {
    if (image!.path != "assets/images/university.webp") {
      return Image.file(image!);
    } else {
      return Image.asset(
        'assets/images/university.webp',
        width: MediaQuery.of(context).size.width,
        height: 300,
      );
    }
  }

  List<TextInputFormatter> returnFormatters() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ];
  }
}
