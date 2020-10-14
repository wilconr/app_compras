import 'package:flutter/material.dart';

class ProductsModel {
  final String name;
  final String image;
  final Color color;
  final int price;
  int quantity;

  ProductsModel({this.name, this.image, this.color, this.price, this.quantity = 1});
}
