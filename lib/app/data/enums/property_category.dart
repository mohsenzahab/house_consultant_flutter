import 'package:flutter/material.dart';

enum PropertyType {
  residential('assets/icons/residential.png', Colors.green),
  commercial('assets/icons/commercial.png', Colors.red),
  office('assets/icons/office.png', Colors.deepOrange),
  villa('assets/icons/hotel.png', Colors.orange),
  land('assets/icons/office.png', Colors.blue),
  hotel('assets/icons/office.png', Colors.purple),
  tourismFacilities(
      'assets/icons/office.png', Color.fromARGB(255, 165, 5, 5), Colors.white),
  allFiles('assets/icons/office.png', Colors.grey, Colors.white),
  residents('assets/icons/office.png', Colors.blueGrey, Colors.white),
  site('assets/icons/office.png', Colors.pink),
  normalApartment('assets/icons/office.png', Colors.orangeAccent),
  secondHand('assets/icons/second_hand.png', Colors.grey);

  const PropertyType(this.iconRes, this.color, [this.iconColor = Colors.black]);

  final String iconRes;
  final Color iconColor;
  final Color color;
}
