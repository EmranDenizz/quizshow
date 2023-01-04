import 'package:flutter/material.dart';
import 'package:quizshow/constants.dart';

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
  int soruSayac = 0;
  List<Widget> secimler = [];
  List<Soru> soruBankasi = [
    Soru(soruMetni: 'Deniz atlarının erkeği doğurur', soruYanit: true),
    Soru(soruMetni: 'Cristiano Ronalda Portekizlidir.', soruYanit: true),
    Soru(soruMetni: 'İstanbul Türkiye^nin başkentidir.', soruYanit: false),
    Soru(soruMetni: 'Asya bir ülkedir.', soruYanit: false)
  ];

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
                soruBankasi[soruSayac].soruMetni,
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
                          soruBankasi[soruSayac].soruYanit ==
                                  true //ternary operatör
                              ? secimler.add(kDogruIconu)
                              : secimler.add(kYanlisIconu);
                          soruSayac++;
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
                        bool dogruButonu = soruBankasi[soruSayac].soruYanit;
                        setState(() {
                          if (dogruButonu == true) {
                            secimler.add(kDogruIconu);
                          } else {
                            secimler.add(kYanlisIconu);
                          }
                          soruSayac++;
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

class Soru {
  String soruMetni;
  bool soruYanit;

  Soru({required this.soruMetni, required this.soruYanit});
}
