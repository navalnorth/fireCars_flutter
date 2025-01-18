import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  String? carId, carName, carUrlImg, carUserId, carUserName;
  Timestamp? carTimeStap;
  bool? isMyFavoriteCar;
  int? carFavoriteCount;

  Car({
    this.carId,
    this.carName,
    this.carUrlImg,
    this.carUserId,
    this.carUserName,
    this.carTimeStap,
    this.isMyFavoriteCar,
    this.carFavoriteCount,
  });

}