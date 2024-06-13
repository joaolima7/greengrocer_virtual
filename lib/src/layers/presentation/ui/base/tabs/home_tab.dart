import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/category_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/item_tile.dart';
import 'package:greengrocer_virtual/src/layers/presentation/components/text_field_custom.dart';
import 'package:greengrocer_virtual/src/core/app_data/app_data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController _txtSearch = TextEditingController();

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
          Padding(
            padding: EdgeInsets.only(
              bottom: sizeScreen.width * .04,
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              height: sizeScreen.width * .063,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: appData.categories[index],
                    isSelected: appData.categories[index] == _selectedCategory,
                    sizeScreen: sizeScreen.width,
                    onPressed: () {
                      setState(() {
                        _selectedCategory = appData.categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) => SizedBox(
                  width: sizeScreen.width * .03,
                ),
                itemCount: appData.categories.length,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index],
                  size: sizeScreen.width,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
