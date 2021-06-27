import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Map<String, bool> curFilter;
  final Function saveFilters;

  FiltersScreen(this.curFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _LactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.curFilter['gluten'] as bool;
    _LactoseFree = widget.curFilter['lactose'] as bool;
    _vegan = widget.curFilter['vegan'] as bool;
    _vegetarian = widget.curFilter['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("You Filtes"),
          actions: [
            IconButton(
                onPressed: () {
                  final _selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _LactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters(_selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your Meal section",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                    title: Text("Gluten-Free"),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten-free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegetarian"),
                    value: _vegetarian,
                    subtitle: Text('Only include vagetarian meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Lactose-Free"),
                    value: _LactoseFree,
                    subtitle: Text('Only include loactose-free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _LactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegan"),
                    value: _vegan,
                    subtitle: Text('Only include vegan meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    })
              ],
            ))
          ],
        ));
  }
}
