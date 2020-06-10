

/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  String validateUsername(String value) {
    if (value.trim().isEmpty) {
      return 'cannot be empty';
    } else if (value.length <= 3) {
      return 'To0 Short';
    }
    return null;
  }

  String validateTextField(String value) {
    if (value.trim().isEmpty) {
      return 'cannot be empty';
    }
    return null;
  }
}
