import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_cars/model/car_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DataBaseServices {
  // declarer et initialiser
  final CollectionReference _cars = FirebaseFirestore.instance.collection('cars');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // upload l'image vers firabes storage
  Future<String> uploadFile(file) async {
    Reference reference = _storage.ref().child('cars/${DateTime.now()}.jpg');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  //ajout de la voiture dans la bdd
  void addCar(Car car) {
    _cars.add({
      "carName": car.carName,
      "carUrlImg":car.carUrlImg,
      "carUserID": car.carUserId,
      "carUserNme": car.carUserName,
      "carTimeStamp": FieldValue.serverTimestamp(),
      "carFavoriteCount": 0,
    });
  }
}