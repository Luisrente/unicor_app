import 'package:flutter/material.dart';

import '../../../context/export_context.dart';

class CustomSeleectLanguage extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final dynamic value;
  final Function(dynamic v)? onChangedF;
  final List<DropdownMenuItem> childrens;
  final bool isExpanded;

  const CustomSeleectLanguage({
    Key? key,
    this.label,
    required this.onChangedF,
    required this.childrens,
    this.hintText = '',
    this.errorMessage,
    this.value,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField(
            value: value,
            hint: Text(
              hintText!,
              style: const TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 16.0),
            ),
            decoration: InputDecoration(
              labelText: label,
              fillColor: Colors.white,
              errorText: errorMessage,
              errorStyle: TextStyle(color: Colors.red[900], fontSize: 16.0),
              hintStyle: const TextStyle(fontSize: 16.0),
              labelStyle:
                  TextStyle(fontSize: 16.0, color: AppAssets.blackColor),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppAssets.blackColor),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppAssets.blackColor),
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            isExpanded: isExpanded,
            elevation: 2,
            onChanged: onChangedF,
            items: childrens,
            style:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
