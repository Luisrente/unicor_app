String? validateEmail(String email) {
  return _generalValidator(
      email,
      RegExp(
          r'^[\w-\.]+[\w-\.](\w)\@\w+((-\w+)|(\w))\.[a-z]{2,}(\.[a-z]{2,})*$'),
      "Debe ingresar un email electronico valido");
}

String? _generalValidator(String text, RegExp regExp, String errorMsj) {
  if (validateEmpty(text) != null) return validateEmpty(text);
  if (!regExp.hasMatch(text)) {
    return errorMsj;
  } else {
    return null;
  }
}

String? validateEmpty(String text) {
  if (text.isEmpty) {
    return "Este campo es obligatorio";
  } else {
    return null;
  }
}