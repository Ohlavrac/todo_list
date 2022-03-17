class Validators {
  String? validateTitle (String? title) {
    if (title == null || title.isEmpty) {
      return "Fill in the title field";
    }
    return null;
  }

  String? validateDescription (String? description) {
    if (description == null || description.isEmpty) {
      return "Fill in the description field";
    }

    return null;
  }
}