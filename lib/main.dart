import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Appbrain appbrain = Appbrain();
void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          'اختبار',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        )),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: ExamBage(),
        ),
      ),
    );
  }
}

class ExamBage extends StatefulWidget {
  const ExamBage({Key? key}) : super(key: key);

  @override
  State<ExamBage> createState() => _ExamBageState();
}

class _ExamBageState extends State<ExamBage> {
  int numOfRight = 0;
  List<Widget> iconslist = [];

  void checkAnswer(bool whatUserPiked) {
    setState(() {
      bool correctAnswers = (appbrain.getQuestionsAnswer());
      if (whatUserPiked == correctAnswers) {
        numOfRight++;
        iconslist.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              size: 30.0,
              color: Colors.green,
            ),
          ),
        );
      } else {
        iconslist.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            size: 30.0,
            color: Colors.red,
          ),
        ));
      }
      if (appbrain.isFinished() == true) {
        Alert(
          context: context,
          title: " انتهاء الاختبار ",
          desc: "لقد اجبت على $numOfRightمن اصل 7 أسئلة  ",
          buttons: [
            DialogButton(
              child: const Text(
                "ابدأ من جديد ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appbrain.resetNum();
        iconslist = [];
        numOfRight = 0;
      } else {
        appbrain.nextQuestions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: iconslist,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appbrain.getQuestionsImage()),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                appbrain.getQuestionsText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'صح',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FlatButton(
              color: Colors.orange,
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'خطأ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
