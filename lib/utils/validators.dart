String validateCardNumber(String cardNumber) {
  RegExp exp = RegExp(r'^[0-9]{10}$');
  if (exp.hasMatch(cardNumber)) {
    return null;
  }
  return "enter a valid card number";
}
