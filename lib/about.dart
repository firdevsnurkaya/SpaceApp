import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT'),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text("Uzayı mı merak ediyorsun?"),
          SizedBox(
            height: 5,
          ),
          Text("O halde en doğru yerdesin! :)"),
          SizedBox(
            height: 5,
          ),
          Text(
              "Space App, siz kullanıcılara uzay hakkında birçok bilgi sunar."),
          SizedBox(
            height: 5,
          ),
          Text(
              "Uygulamayı açtığınızda sizi bir takvim ve seçtiğiniz tarihe uygun uluslararası uzay istasyonunun konum bilgisi ve o güne ait uzay görüntüsünün yanı sıra uzmanlar tarafından hazırlanan bilgilendirme metni karşılamaktadır."),
          SizedBox(
            height: 5,
          ),
          Text(
              "Uygulama sayesinde aynı zamanda gezegenler hakkında bilgi edinebilir, uzaya çıkan astronotlar hakkında bilgi sahibi olabilir, güncel spaceX görevlerini takip edebilir ve uzayın hava durumu hakkında da bilgi edinebilirsiniz."),
          SizedBox(
            height: 5,
          ),
          Text(
              "Space App, uygulama geliştiricilerimiz olan Birsen DALMIŞ ve Firdevs Nur KAYA sayesinde çok daha gelişmiş bir uygulama olup siz kullanıcılara daha kapsamlı hizmet sunmak için geliştirilmeye devam edecek... <3"),
        ],
      ),
    );
  }
}
