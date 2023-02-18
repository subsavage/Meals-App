import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class filtersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Function saveFilters;
  final Map<String, bool> currFilters;

  filtersScreen(this.currFilters, this.saveFilters);

  @override
  State<filtersScreen> createState() => _filtersScreenState();
}

class _filtersScreenState extends State<filtersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currFilters['gluten'];
    _lactoseFree = widget.currFilters['lactose'];
    _vegeterian = widget.currFilters['vegetarian'];
    _vegan = widget.currFilters['vegan'];
  }

  Widget _buildSwitchListTile(
    String title,
    String desc,
    bool currval,
    Function updateVal,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
      ),
      value: currval,
      subtitle: Text(
        desc,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegeterian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: mainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meals',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten-free",
                  "Display only Gluten free meals",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose-free",
                  "Display only Lactose free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Display only Vegan meals",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Display only Vegetarian meals",
                  _vegeterian,
                  (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
