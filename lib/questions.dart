class Questions {
  late String questionText;
  late String questionImage;
  late bool questionAnswer;

  Questions({
    required String t,
    required String i,
    required bool a,
  }) {
    questionText = t;
    questionImage = i;
    questionAnswer = a;
  }
}
