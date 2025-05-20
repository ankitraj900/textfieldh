# TextFieldH

A Flutter package that provides specialized text fields for common input types like email, password, and names.

## Features

- Email text field with validation
- Password text field with show/hide functionality
- Name text fields (First Name, Last Name, Middle Name) with validation
- Customizable styling and error messages
- Built-in validation rules

## Usage

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  textfieldh:
    path: ../path/to/textfieldh
```

### Email Text Field

```dart
import 'package:textfieldh/textfieldh.dart';

final emailController = TextEditingController();

EmailTextField(
  controller: emailController,
  onChanged: (value) {
    // Handle email changes
  },
)
```

### Password Text Field

```dart
import 'package:textfieldh/textfieldh.dart';

final passwordController = TextEditingController();

PasswordTextField(
  controller: passwordController,
  minLength: 8, // Optional: Set minimum password length
  onChanged: (value) {
    // Handle password changes
  },
)
```

### Name Text Fields

```dart
import 'package:textfieldh/textfieldh.dart';

final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final middleNameController = TextEditingController();

// First Name
NameTextField(
  controller: firstNameController,
  nameType: NameType.firstName,
  onChanged: (value) {
    // Handle first name changes
  },
)

// Last Name
NameTextField(
  controller: lastNameController,
  nameType: NameType.lastName,
  onChanged: (value) {
    // Handle last name changes
  },
)

// Middle Name (Optional)
NameTextField(
  controller: middleNameController,
  nameType: NameType.middleName,
  onChanged: (value) {
    // Handle middle name changes
  },
)
```

## Features

- Built-in validation for all field types
- Customizable error messages
- Show/hide password functionality
- Proper keyboard types for each field
- Consistent styling with Material Design
- Support for custom labels and hints
- Optional fields support (middle name)
- Focus node support for form navigation

## Contributing

Feel free to contribute to this project by creating issues or submitting pull requests.
