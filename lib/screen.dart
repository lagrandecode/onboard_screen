import 'package:flutter/material.dart';


class Screen {
  String img;
  String name;
  String description;

  Screen(this.img, this.name, this.description);
  static List<Screen> generateScreen(){
    return [
      Screen("assets/images/img1.svg", "Order Anything", "Now You can order anything right from your mobile."),
      Screen("assets/images/img2.svg", "Quick Delivery", "Just send me, I will deliver it to you in no time."),
      Screen("assets/images/img3.svg", "At your door step", "Pick up delivery at your door step and enjoy groceries."),
    ];
  }
}