import 'package:flutter/material.dart';
import 'package:quizshow/constants.dart';
import 'package:quizshow/soruBankasi.dart';

void main() {
  runApp(QuizShow());
}

class QuizShow extends StatelessWidget {
  const QuizShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffE0F7FA),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> secimler = []; //ikonları tutacak olan boş listemiz
  Sorular sorular = Sorular(); //Soruları tutan sınıfımız

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                sorular.getSoruMetniDondur(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 15, //yatayda boşluk verir.
          runSpacing: 15, // dikeyde boşluk verir
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.green,
                          size: 35,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          sorular.getSoruYanitDondur() ==
                                  true //ternary operatör
                              ? secimler.add(kDogruIconu)
                              : secimler.add(kYanlisIconu);
                          sorular.sonrakiSoru();
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.thumb_down,
                          size: 35,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        bool dogruButonu = sorular.getSoruYanitDondur();
                        setState(() {
                          if (dogruButonu == false) {
                            secimler.add(kYanlisIconu);
                          } else {
                            secimler.add(kYanlisIconu);
                          }
                          sorular.sonrakiSoru();
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
