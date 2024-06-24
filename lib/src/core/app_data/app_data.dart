import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

Item apple = Item(
  itemName: 'Maçã',
  imgUrl: 'assets/images/maca.png',
  unit: 'kg',
  price: 5.5,
  description: 'A melhor Maçã da região!',
);

Item grapple = Item(
  itemName: 'Uva',
  imgUrl: 'assets/images/uva.png',
  unit: 'kg',
  price: 9.0,
  description: 'A melhor Uva da região!',
);

Item kiwi = Item(
  itemName: 'Kiwi',
  imgUrl: 'assets/images/kiwi.png',
  unit: 'kg',
  price: 55,
  description: 'O melhor Kiwi da região!',
);

Item abacaxi = Item(
  itemName: 'Abacaxi',
  imgUrl: 'assets/images/abacaxi.png',
  unit: 'un',
  price: 9.90,
  description: 'O melhor Abacaxi da região!',
);

Item pera = Item(
  itemName: 'Pera',
  imgUrl: 'assets/images/pera.png',
  unit: 'kg',
  price: 13.49,
  description: 'A melhor Pera da região!',
);

Item melancia = Item(
  itemName: 'Melancia',
  imgUrl: 'assets/images/melancia.png',
  unit: 'kg',
  price: 10,
  description: 'A melhor Melancia da região!',
);

List<Item> items = [apple, grapple, kiwi, abacaxi, pera, melancia];

List<CartItem> cartItems = [
  CartItem(item: apple, quantity: 2),
  CartItem(item: melancia, quantity: 5),
  CartItem(item: abacaxi, quantity: 3),
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];
