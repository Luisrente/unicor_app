import 'dart:math';

import 'package:flutter/material.dart';

import '../../../context/export_context.dart';

class SearchBar extends StatelessWidget {
  final String labelTextField;
  final String labelButton;
  final EdgeInsets margin;
  final void Function(String value) onSearch;

  String valueTextField = '';

  SearchBar({
    Key? key, 
    required this.labelTextField, 
    required this.labelButton, 
    required this.onSearch,
    this.margin = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(labelTextField),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              onChanged: (value) {

                valueTextField = '$value';


              },
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppAssets.primaryColor),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 13)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              child: Text(
                labelButton,
                style: const TextStyle(
                  color: Colors.white,                
                ),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                onSearch(valueTextField);
              },
            ),
          )
        ],
      ),
    );
  }
}
