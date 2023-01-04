import 'package:quizshow/soru.dart';

class Sorular {
  int _soruSayac = 0; //dizinin index değerini tutar

  List<Soru> _soruBankasi = [
    Soru(soruMetni: 'Deniz atlarının erkeği doğurur', soruYanit: true),
    Soru(soruMetni: 'Cristiano Ronalda Portekizlidir.', soruYanit: true),
    Soru(soruMetni: 'İstanbul Türkiye^nin başkentidir.', soruYanit: false),
    Soru(soruMetni: 'Asya bir ülkedir.', soruYanit: false)
  ];

  String getSoruMetniDondur()
  //geriye döndürecek.
  {
    return _soruBankasi[_soruSayac].soruMetni;
  }

  bool getSoruYanitDondur() {
    return _soruBankasi[_soruSayac].soruYanit;
  }

  void sonrakiSoru() {
    //lengt saymaya 1'den başladığı için _soruSayac+1 yaparız.
    if (_soruSayac + 1 < _soruBankasi.length) {
      _soruSayac++;
    }
  }
}
