import 'package:flutter/material.dart';
import 'package:listanime/detail.dart';

class Anime {
  final String imagePath;
  final String title;
  final String genre;
  final String description;

  Anime(this.imagePath, this.title, this.genre, this.description);
}

class AnimeList extends StatelessWidget {
  AnimeList({Key? key}) : super(key: key);

  final List<Anime> animeList = [
    Anime('assets/anime1.jpeg', 'Attack on Titan', 'Action, Drama, Fantasy',
        'Attack on Titan atau Shingeki no Kyojin menceritakan tentang Eren Jaeger dan teman-temannya yang terkurung di balik tembok raksasa. Selama lebih dari seratus tahun, manusia hidup damai di dalam tembok yang terdiri tiga tembok besar, yaitu Tembok Maria, Rose, dan Sheena.'),
    Anime('assets/anime2.jpeg', 'One Piece', 'Action, Adventure, Comedy',
        'One Piece merupakan karya fiksi Eiichiro Oda yang menceritakan tentang seorang remaja (Luffy) yang ingin mewujudkan cita-citanya untuk mengarungi lautan dan menjadi seorang raja bajak laut.'),
    Anime('assets/anime3.jpeg', 'Naruto', 'Action, Adventure, Fantasy',
        'Naruto bercerita seputar kehidupan tokoh utamanya, Naruto Uzumaki, seorang ninja yang hiperaktif, periang, dan ambisius yang ingin mewujudkan keinginannya untuk mendapatkan gelar Hokage, atau juga disebut pemimpin dan ninja terkuat di desanya.'),
    Anime(
        'assets/anime4.jpeg',
        'Dragon Ball Z',
        'Action, Adventure, Martial Arts',
        'Dragon Ball menceritakan tentang seorang bocah bernama Goku yang hidup di tengah gunung sendirian. Dia lalu bertemu dengan Bulma, seorang gadis muda genius, yang berusaha mengumpulkan 7 bola ajaib yang katanya bisa mengabulkan semua keinginan. Bola-bola tersebut dinamakan Dragon Ball.'),
    Anime(
        'assets/anime5.jpeg',
        'Death Note',
        'Mystery, Psychological, Thriller',
        'Death Note menceritakan tentang Light Yagami, seorang remaja jenius yang menemukan buku catatan misterius yang disebut "Death Note", yang dimiliki oleh shinigami (dewa kematian) bernama Ryuk, dan memberikan penggunanya kemampuan supranatural untuk membunuh siapapun ketika menulis namanya di buku tersebut.'),
    Anime('assets/anime6.jpeg', 'Hunter x Hunter', 'Action, Adventure, Fantasy',
        'Hunter X Hunter merupakan anime yang bergenre petualangan. Berlatar cerita dunia fantasi, Hunter X Hunter sukses memikat hati para penggemar serial anime. Hunter X Hunter menceritakan kisah petuangan sekelompok anak yang memiliki impian untuk menjadi hunter andal dengan mengikuti proses seleksi asosiasi hunter.'),
    Anime(
        'assets/anime7.jpeg',
        'Demon Slayer: Kimetsu no Yaiba',
        'Action, Demons, Historical',
        'DEMON SLAYER atau KIMETSU NO YAIBA sendiri mengangkat kisah Tanjiro Kamado. Setelah adiknya yang bernama Nezuko Kamado diubah menjadi iblis dan keluarganya dibunuh, Tanjiro berambisi untuk menemukan obat agar Nezuko kembali normal. Ia kemudian bergabung dengan korps pemburu iblis untuk merealisasikan tujuannya.'),
    Anime(
        'assets/anime8.jpeg',
        'My Hero Academia',
        'Action, Comedy, Super Power',
        'My Hero Academia mengisahkan tentang Izuku Midoriya (nama pahlawan Deku), seorang anak lelaki tanpa kekuatan super (yang disebut quirk) di dunia tempat hal seperti itu sudah menjadi sesuatu yang umum, tetapi masih bercita-cita untuk menjadi seorang pahlawan.'),
    Anime('assets/anime9.jpeg', 'Your Name', 'Action, Adventure, Fantasy',
        'Your Name menceritakan tentang siswa sekolah menengah Taki Tachibana dan Mitsuha Miyamizu. Tiba-tiba tubuh keduanya tertukar meski terpisah jarak yang jauh. Suatu hari, Mitsuha terbangun di sebuah ruangan yang bukan ruangannya. Ia mendapati dirinya di Tokyo dengan tubuh lelaki.'),
    Anime('assets/anime10.jpeg', 'Tokyo Ghoul', 'Action, Mystery, Horror',
        'Tokyo Ghoul menceritakan tentang kehidupan Ken Kaneki yang hampir tidak bisa bertahan hidup setelah pertemuan dengan Rize Kamishiro. Usut punya usut, ternyata Rize Kamishiro adalah seorang ghoul perempuan. Ghoul adalah monster yang menyerupai manusia tetapi mereka suka makan dan berburu manusia.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List Anime',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth >= 300 && constraints.maxWidth < 1200) {
            crossAxisCount = 3;
          } else if (constraints.maxWidth >= 1200) {
            crossAxisCount = 6;
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3 / 4,
            ),
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(anime: animeList[index]),
                    ),
                  );
                },
                child: AnimeCard(
                  imagePath: animeList[index].imagePath,
                  title: animeList[index].title,
                  genre: animeList[index].genre,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String genre;

  const AnimeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        color: Colors.white,
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover, height: 130.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                genre,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
