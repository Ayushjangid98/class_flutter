bool emailValid(String val) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
// bool passwordValid(String val) => RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(val);

extension FormValidation on String {
  isValidEmail({required Function(String) onError}) {
    if (isEmpty) {
      onError('Please enter your email');
      return "";
    } else if (emailValid(this)) {
      onError('Please enter your valid email');
      return "";
    } else {
      onError("");
      return null;
    }
  }
}
