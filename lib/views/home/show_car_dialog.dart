import 'package:fire_cars/model/car_model.dart';
import 'package:fire_cars/services/services_db.dart';
import 'package:fire_cars/shared-ui/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CarDialog {
  User? user;
  CarDialog({ this.user });
  
  // Visualiser la boite de dialogue
  void showCarDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    if (_pickedFile == null) {
      showNotification(context, "Aucune image sélectionnée");
      return;
    }
    File _file = File(_pickedFile.path);
    final _keyForm = GlobalKey<FormState>();
    String _carName = '';
    String _formError = 'Veuillez fournir le nom de la voiture svp !';

    if (!_file.existsSync()) {
      showNotification(context, "Le fichier n'existe pas");
      return;
    }

    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
                image: DecorationImage(
                  image: FileImage(_file),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: _keyForm,
                    child: TextFormField(
                      maxLength: 20,
                      onChanged: (value) {
                        _carName = value;
                      },
                      validator: (value) => _carName == '' ? _formError : null,
                      decoration: const InputDecoration(
                        labelText: "Nom de la voiture",
                        border: OutlineInputBorder(),
                      ),
                    )
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, 
                          child: Text('Annuler')
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onSubmit(context, _keyForm, _file, _carName, user);
                          }, 
                          child: Text('Publier')
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }
    );
  }
  Future<void> onSubmit(context, keyForm, file, carName, user) async {
    if (keyForm.currentState!.validate()) {
      Navigator.of(context).pop();

      DataBaseServices db = DataBaseServices();
      String carUrlImg = await db.uploadFile(file);

      db.addCar(Car(
        carName: carName,
        carUrlImg: carUrlImg,
        carUserId: user!.uid,
        carUserName: user!.displayName ?? "utilisateur inconnu",
      ));

      showNotification(context, "Chargement...");
    }
  }
}