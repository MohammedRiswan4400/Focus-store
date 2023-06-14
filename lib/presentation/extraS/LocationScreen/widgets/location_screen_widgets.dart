import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ModelAddress {
  String id;
  final String addressType;
  final String place;
  final String subLocality;
  final String locality;
  final String pin;

  ModelAddress({
    this.id = "",
    required this.addressType,
    required this.place,
    required this.subLocality,
    required this.locality,
    required this.pin,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": addressType,
        "addressName": place,
        "phoneNo": subLocality,
        "pin": locality,
        "city": pin,
      };

  static ModelAddress fromJson(Map<String, dynamic> json) => ModelAddress(
        addressType: json["name"],
        place: json["addressName"],
        subLocality: json["phoneNo"],
        locality: json["pin"],
        pin: json["city"],
        id: json["id"],
      );
}

Future addressData({
  required String addressType,
  required String place,
  required String sublocality,
  required String locality,
  required String pin,

  // required String
}) async {
  final docAddressData = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("address")
      .doc(addressType);

  final address = ModelAddress(
    id: docAddressData.id, addressType: addressType, locality: locality,
    pin: pin, place: place, subLocality: sublocality,
    // name: name,
    // addressName: addressName,
    // phoneNo: phoneNo,
    // pin: pin,
    // city: city,
    // state: state,
    // area: area,
    // houseNo: houseNo,
  );
  final json = address.toJson();
  await docAddressData.set(json);
}
