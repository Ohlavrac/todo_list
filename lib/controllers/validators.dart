class Validators {
  String? validateTitle (String? title) {
    if (title == "") {
      return "Fill in the title field";
    }
    return null;
  }
}