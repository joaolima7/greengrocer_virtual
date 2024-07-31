import 'package:greengrocer_virtual/src/layers/domain/entities/cart_item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/category.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/item.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/order.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';

Item apple = Item(
  itemName: 'Maçã',
  imgUrl: 'assets/images/maca.png',
  unit: 'kg',
  price: 5.5,
  description: 'A melhor Maçã da região!',
  category: Category(name: 'Fruta'),
);

Item grapple = Item(
  itemName: 'Uva',
  imgUrl: 'assets/images/uva.png',
  unit: 'kg',
  price: 9.0,
  description: 'A melhor Uva da região!',
  category: Category(name: 'Fruta'),
);

Item kiwi = Item(
  itemName: 'Kiwi',
  imgUrl: 'assets/images/kiwi.png',
  unit: 'kg',
  price: 55,
  description: 'O melhor Kiwi da região!',
  category: Category(name: 'Fruta'),
);

Item abacaxi = Item(
  itemName: 'Abacaxi',
  imgUrl: 'assets/images/abacaxi.png',
  unit: 'un',
  price: 9.90,
  description: 'O melhor Abacaxi da região!',
  category: Category(name: 'Fruta'),
);

Item pera = Item(
  itemName: 'Pera',
  imgUrl: 'assets/images/pera.png',
  unit: 'kg',
  price: 13.49,
  description: 'A melhor Pera da região!',
  category: Category(name: 'Fruta'),
);

Item melancia = Item(
  itemName: 'Melancia',
  imgUrl: 'assets/images/melancia.png',
  unit: 'kg',
  price: 10,
  description: 'A melhor Melancia da região!',
  category: Category(name: 'Fruta'),
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

User user = User(
  name: 'João Caetano Lima',
  email: 'joaocaetanodev@gmail.com',
  phone: 17982026102,
  cpf: 07774129189,
  password: '123',
);

List<Order> orders = [
  Order(
    id: '1',
    createdDateTime: DateTime.parse('2025-09-30 16:00:10.234'),
    overdueDateTime: DateTime.parse('2025-09-30 17:00:10.234'),
    items: cartItems,
    status: 'pending_payment',
    copyAndPaste: 'dbjdkjsbdks',
  ),
  Order(
    id: '2',
    createdDateTime: DateTime.parse('2024-07-01 16:00:10.234'),
    overdueDateTime: DateTime.parse('2024-07-01 17:00:10.234'),
    items: cartItems,
    status: 'delivered',
    copyAndPaste: 'dbjdkjsbdks',
  ),
];
