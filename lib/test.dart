int inputUser(inputUserr) {
  if (inputUserr == null || inputUserr.isEmpty) {
    print("Enter Valid Number :");
    return inputUser(inputUserr);
  } else {
    return int.parse(inputUserr);
  }
}
