import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';

Item apple = Item(
  itemName: 'Maçã',
  imgUrl: 'assets/images/maca.png',
  unit: 'kg',
  price: 5.5,
  description: 'A melhor maçã da região!',
);

Item grapple = Item(
  itemName: 'Uva',
  imgUrl: 'assets/images/uva.png',
  unit: 'kg',
  price: 9.0,
  description: 'A melhor uva da região!',
);

Item kiwi = Item(
  itemName: 'Kiwi',
  imgUrl: 'assets/images/kiwi.png',
  unit: 'kg',
  price: 55,
  description: 'O melhor kiwi da região!',
);

List<Item> items = [apple, grapple, kiwi];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Tenmperos',
  'Cereais',
];
