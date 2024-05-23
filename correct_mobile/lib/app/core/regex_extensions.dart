extension ExtString on String {
  bool get isValiCPF {
    final cpfRegExp = RegExp(r"(\d{3})+\.?(\d{3})+\.?(\d{3})+-?([\dxX]{1,2})+");
    return cpfRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^(?=.*[A-Z]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }
}
