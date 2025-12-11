class AppValidator {
  static String? emailValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Поле пустое";
    }
    if (!value.contains("@")) {
      return "Email должен содержать @";
    }
    if (!value.contains(".")) {
      return "Email должен содержать .";
    }
    if (value.trim().length < 5) {
      return "Минимум 5 символов";
    }
    return null;
  }

  static String? passwordValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Введите пароль";
    }
    if (value.trim().length < 6) {
      return "Минимум 6 символов";
    }
    return null;
  }
}