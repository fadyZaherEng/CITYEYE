import 'package:city_eye/src/core/utils/validation/job_details_validation.dart';

class JopDescriptionValidationUseCase {
  List<JobDetailsValidationState> validateFormUseCase({
    required String problem,
    required String service,
    required int min,
  }) {
    List<JobDetailsValidationState> validations = List.empty(growable: true);
    JobDetailsValidationState validation;
    validation = validateProblemDescription(
      problem,
      min,
    );
    if (validation != JobDetailsValidationState.valid) {
      validations.add(validation);
    }
    validation = validateServiceDescription(
      service,
    );
    if (validation != JobDetailsValidationState.valid) {
      validations.add(
        validation,
      );
    }
    return validations;
  }

  JobDetailsValidationState validateProblemDescription(
    String text,
    int min,
  ) {
    return JobDetailsValidator.validateProblemDescription(text, min);
  }

  JobDetailsValidationState validateServiceDescription(String text) {
    return JobDetailsValidator.validateServiceDescription(text);
  }
}
