import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/category_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/text_field_custom.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController _txtSearch = TextEditingController();
  List<String> _categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Tenmperos',
    'Cereais',
  ];
  String _selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GreenGrocer',
          style:
              TextStyle(fontSize: sizeScreen.width * .065, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: sizeScreen.width * .03,
            ),
            child: InkWell(
              onTap: () {},
              child: const Badge(
                label: Text('1'),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
              sizeScreen.width * .05,
              sizeScreen.width * .05,
              sizeScreen.width * .05,
              sizeScreen.width * .05,
            ),
            child: TextFieldCustom(
              controller: _txtSearch,
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'Pesquise aqui...',
              containBorder: false,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            height: sizeScreen.width * .063,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: _categories[index],
                  isSelected: _categories[index] == _selectedCategory,
                  sizeScreen: sizeScreen.width,
                  onPressed: () {
                    setState(() {
                      _selectedCategory = _categories[index];
                    });
                  },
                );
              },
              separatorBuilder: (_, index) => SizedBox(
                width: sizeScreen.width * .03,
              ),
              itemCount: _categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
