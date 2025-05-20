import 'package:flutter/material.dart';

enum NameType { firstName, lastName, middleName }

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final NameType nameType;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  final bool enabled;
  final FocusNode? focusNode;

  const NameTextField({
    super.key,
    required this.controller,
    required this.nameType,
    this.labelText,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.enabled = true,
    this.focusNode,
  });

  String get _defaultLabel {
    switch (nameType) {
      case NameType.firstName:
        return 'First Name';
      case NameType.lastName:
        return 'Last Name';
      case NameType.middleName:
        return 'Middle Name';
    }
  }

  String get _defaultHint {
    switch (nameType) {
      case NameType.firstName:
        return 'Enter your first name (e.g., John)';
      case NameType.lastName:
        return 'Enter your last name (e.g., Doe)';
      case NameType.middleName:
        return 'Enter your middle name (optional)';
    }
  }

  IconData get _prefixIcon {
    switch (nameType) {
      case NameType.firstName:
        return Icons.person;
      case NameType.lastName:
        return Icons.person_outline;
      case NameType.middleName:
        return Icons.person_pin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: labelText ?? _defaultLabel,
        hintText: hintText ?? _defaultHint,
        errorText: errorText,
        prefixIcon: Icon(_prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red.shade500),
        ),
        helperText: nameType == NameType.middleName 
            ? 'Optional field'
            : 'Only letters allowed, must start with capital letter',
      ),
      validator: (value) {
        if (nameType == NameType.middleName) {
          if (value == null || value.isEmpty) {
            return null; // Middle name is optional
          }
        } else {
          if (value == null || value.isEmpty) {
            return 'Please enter your ${_defaultLabel.toLowerCase()}';
          }
        }

        // Check if the name starts with a capital letter
        if (!RegExp(r'^[A-Z]').hasMatch(value)) {
          return '${_defaultLabel} must start with a capital letter';
        }

        // Check if the name contains only letters
        if (!RegExp(r'^[A-Za-z]+$').hasMatch(value)) {
          return '${_defaultLabel} can only contain letters';
        }

        if (value.length < 2) {
          return '${_defaultLabel} must be at least 2 characters';
        }

        return null;
      },
      onChanged: onChanged,
    );
  }
}