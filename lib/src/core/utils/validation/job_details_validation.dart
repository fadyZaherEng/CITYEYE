// ignore_for_file: prefer_is_empty

class JobDetailsValidator {
  static JobDetailsValidationState validateProblemDescription(
    String text,
    int min,
  ) {
    if (text.isEmpty || text.length < min) {
      return JobDetailsValidationState.problemNotValid;
    } else {
      return JobDetailsValidationState.valid;
    }
  }

  static JobDetailsValidationState validateServiceDescription(String text) {
    if (text.isEmpty ||
        text.length == 0 ||
        text.length < 0 ||
        text == "." ||
        text == "" ||
        text == null) {
      return JobDetailsValidationState.notValid;
    } else {
      return JobDetailsValidationState.valid;
    }
  }
}

enum JobDetailsValidationState {
  problemEmpty,
  serviceEmpty,
  valid,
  notValid,
  problemNotValid,
}
