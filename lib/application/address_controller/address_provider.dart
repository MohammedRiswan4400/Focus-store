import 'package:flutter/material.dart';

import '../../presentation/extraS/LocationScreen/widgets/location_screen_widgets.dart';

class AddressPicker extends ChangeNotifier {
  ModelAddress? address;

  void selectedAddress(ModelAddress newAddress) {
    address = newAddress;
    notifyListeners();
  }
}
