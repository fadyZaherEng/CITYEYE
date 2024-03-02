enum QuestionType {
  text,
  image,
  number,
  date,
  singleChoice,
  multipleChoice,
  notFound,
}

QuestionType getQuestionType(String controlTypeCode) {
  switch (controlTypeCode) {
    case "text":
      return QuestionType.text;

    case "number":
      return QuestionType.number;

    case "date":
      return QuestionType.date;

    case "singleChoice":
      return QuestionType.singleChoice;
    case "multiChoice":
      return QuestionType.multipleChoice;
    case "image":
      return QuestionType.image;
    default:
      return QuestionType.notFound;
  }
}
