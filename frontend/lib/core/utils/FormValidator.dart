class FormValidator {
  String? validateEmail(String? value) {
    RegExp expression = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
        caseSensitive: false);

    if (value == null || value.isEmpty) {
      return "Email Address is Required";
    }

    if (!expression.hasMatch(value)) {
      return "Invalid Email Address. Please try again.";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Required";
    }

    if (value.length < 8) {
      return "Password must at least be 8 characters long.";
    }

    return null;
  }

  String? validateConfirmPassword(String?value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm Password is Required";
    }

    if (password != value) {
      return "Password does not match";
    }

    return null;
  }

  String? validateInput(String? value, String name, int minLength, int maxLength) {
    if (value == null || value.isEmpty) {
      return "$name is Required";
    }

    if (value.length < minLength) {
      return "$name must at least be $minLength characters long.";
    }

    if (value.length > maxLength) {
      return "$name must at least be $maxLength characters long.";
    }

    return null;
  }

  String? validateDigits(String? value, String name, int length) {
    if (value == null || value.isEmpty) {
      return "$name is Required";
    }

    if (!value.contains(RegExp(r'^[0-9]+$'))) {
      return "$name must contain only digits.";
    }

    if (value.length < length) {
      return "$name must at least be $length characters long.";
    }

    if (value.length > length) {
      return "$name must not exceed $length characters long.";
    }

    return null;
  }

  String? validateWeightPriceInput(String? value, String name, int length) {
    if (value == null || value.isEmpty) {
      return "$name is Required";
    }

    if (!RegExp(r'^[0-9.]+$').hasMatch(value)) {
      return "$name must contain only digits and/or a period.";
    }

    if (value.length < length) {
      return "$name must at least be $length characters long.";
    }

    return null;
  }
}
