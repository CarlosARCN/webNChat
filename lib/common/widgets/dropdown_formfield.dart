import 'package:flutter/material.dart';

import 'package:newwhatsup/common/styles/dimensions.dart';
import 'package:newwhatsup/common/styles/typography.dart';

class DropdownFormField extends StatefulWidget {
  const DropdownFormField({
    Key? key,
    required this.options,
    this.decoration,
  }) : super(key: key);

  final List<String> options;
  final InputDecoration? decoration;

  @override
  State<DropdownFormField> createState() => _DropdownFormFieldState();
}

class _DropdownFormFieldState extends State<DropdownFormField> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.options.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          isDense: true,
          value: dropdownValue,
          borderRadius: BorderRadius.circular(
            Dimensions.x8,
          ),
          decoration: widget.decoration,
          style: TextStyles.textSmall.copyWith(fontWeight: FontWeight.w400),
          iconSize: Dimensions.x16,
          icon: const Icon(
            Icons.downhill_skiing,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
