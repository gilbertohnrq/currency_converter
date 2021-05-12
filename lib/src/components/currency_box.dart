import 'package:currency_converter/src/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final double size = 15;

  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox({Key key, this.items, this.controller, this.onChanged, this.selectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 65,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              isExpanded: true,
              underline: Container(
                height: 2,
                color: Colors.amber,
              ),
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: size),
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
