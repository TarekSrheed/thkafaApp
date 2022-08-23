import 'questions.dart';

class Appbrain {
  int _questionNumber = 0;
  final List<Questions> _questionGroup = [
    Questions(
      t: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب",
      i: 'images/image-1.jpg',
      a: true,
    ),
    Questions(
      t: "القطط هي حيوانات لاحمة",
      i: 'images/image-2.jpg',
      a: true,
    ),
    Questions(
        t: "الصين موجودة في القارة الافريقية",
        i: 'images/image-3.jpg',
        a: false),
    Questions(
      t: "الارض مسطحة وليست كروية",
      i: 'images/image-4.jpg',
      a: false,
    ),
    Questions(
      t: "يستطيع الانسان البقاء علي قيد الحياة بدون اكل اللحوم",
      i: 'images/image-5.jpg',
      a: true,
    ),
    Questions(
        t: 'الشمس تدور حول الارض والارض تدور حول القمر',
        i: 'images/image-6.jpg',
        a: false),
    Questions(
      t: "الحيوانات لا تشعر بالالم",
      i: 'images/image-7.jpg',
      a: false,
    ),
  ];
  void nextQuestions() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionsText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionsImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionsAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetNum() {
    _questionNumber = 0;
  }
}
