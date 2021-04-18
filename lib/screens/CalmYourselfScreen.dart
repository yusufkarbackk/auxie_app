import 'package:flutter/material.dart';
import '../bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/SharedStyle.dart';
import '../widgets/CalmYourselfCard.dart';

class CalmYourselfScreen extends StatefulWidget {
  final String id;

  CalmYourselfScreen(this.id);
  @override
  _CalmYourselfScreenState createState() => _CalmYourselfScreenState();
}

class _CalmYourselfScreenState extends State<CalmYourselfScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage(widget.id));
          return;
        },
        child: Scaffold(
          backgroundColor: auxieBlue,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  margin: EdgeInsets.only(bottom: 22),
                  child: Text(
                    "10 Cara Menenangkan Diri",
                    style:
                        titledText.copyWith(color: Colors.white, fontSize: 26),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "1. Seburuk apapun masalahnya, Tetaplah berpikir positif",
                  "Cara menenangkan hati yang paling ampuh tatkala Anda dilanda masalah hidup, yakni dengan tetap berpikiran positif. Seburuk apapun kondisinya, percayalah pasti akan ada jalan keluar.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "2. Mendekatkan Diri ke Tuhan",
                  """Kebanyakan orang berpikir bahwa bermain ke club malam, joget-joget dan mabuk bisa menjadi senjata untuk menenangkan hati yang gelisah. Padahal enggak sama sekali!Katakanlah Anda menemukan kesenangan dari aktivitas clubbing tersebut. Namun percaya deh, kesenangan itu hanya akan bertahan sesaat. Setelah itu, hati Anda bakal terasa hampa kembali. Daripada menghabiskan waktu dengan hal-hal tak berguna, lebih baik Anda mendekatkan diri kepada Tuhan. Beribadahlah!""",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "3. Jangan Terlalu Menyalahkan Diri Sendiri",
                  "Sebaiknya, jika Anda mengalami masalah, apapun itu, janganlah terlalu menyalahkan diri berlebihan. Bertanggung jawab memang perlu! Namun bukan berarti harus terus-menerus menyiksa batin, apalagi menganggap diri Anda tak pantas diampuni. Jangan pernah berpikir begitu, ya! Setiap orang pernah melakukan kesalahan, dan setiap orang berhak mendapatkan kesempatan. Maka itu, cobalah untuk memaafkan diri sendiri.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "4. Lakukan Senam Yoga Untuk Relaksasi Pikiran",
                  "Salah satu jenis olahraga yang bisa membantu Anda menghilangkan stres adalah senam yoga. Dalam ilmu medis, gerakan dalam senam yoga ini berguna untuk merenggangkan otot-otot tubuh, melancarkan aliran darah, sekaligus menenangkan sistem syaraf.Ketiga hal tersebut tentunya tak hanya berguna untuk menjaga kesehatan fisik, tapi juga membantu rileksasi pikiran.Dengan Anda melakukan senam yoga, itu dapat mengurangi kecemasan sekaligus menghilangkan pikiran yang tegang.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "5. Cari Partner Ngobrol Untuk Mengeluarkan Emosi di Hati",
                  "Ketika pikiran jenuh dan mood lagi nurun, sebaiknya jangan hanya berdiam diri di dalam kamar. Jangan memendam perasaan sendirian. Itu malah bikin Anda semakin stres dan galau berkepanjangan.Coba cari teman ngobrol. Bisa pasangan Anda, orang tua, sahabat, atau siapa pun yang Anda percayai. Sekalipun orang yang Anda ajakin ngobrol nggak bisa memberi solusi, tapi dengan mengutaran unek-unek itu saja sudah bisa membuat hati lebih lega. Percaya deh!Namun pastikan dulu bahwa orang tersebut bisa jaga rahasia. Jangan sampai Anda bercerita dengan orang yang ‘bermulut ember’. Wih itu bahaya, bisa-bisa rahasia Anda jadi nyebar kemana-kemana lho!",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "6. Rehat Sejenak Dari Kesibukan, Lakukan Perjalanan ke Tempat wisata Alam",
                  "Alam selalu menjadi jawaban tepat untuk menenangkan hati dan pikiran. Dengan melihat pemandangan hijau serta lautan biru akan membuat Anda merasa lebih damai. Melihat karya Tuhan yang begitu memesona itu sangat menyenangkan, guys! Jadi Anda harus mencobanya.Kalaupun Anda tidak punya cukup budget untuk pergi wisata, buat saja tenda di halaman rumah. Ajak teman-teman Anda untuk menginap. Lalu jangan lupa sediakan cemilan dan buat api unggun. Nggak repot, kan? Sederhana, tapi dijamin berkesan.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "7. Hibur Diri Dengan Shopping Atau Hunting Kuliner.",
                  "Trik berikutnya, cara menenangkan hati ketika ada masalah adalah dengan pergi jalan-jalan. Anda bisa pergi berbelanja sekaligus hunting kuliner untuk menghibur diri.Agar aktivitas Anda semakin menyenangkan, jangan lupa ajak teman-teman. Tapi ingat ya, jangan terlalu boros! Jangan sampai Anda khilaf, lalu membeli segala benda yang ada di depan mata. Duh, itu malah bikin dompet tipis dan efeknya malah semakin stres.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "8. Nonton Film Komedi.",
                  "Trik berikutnya, cara menenangkan hati ketika ada masalah adalah dengan pergi jalan-jalan. Anda bisa pergi berbelanja sekaligus hunting kuliner untuk menghibur diri.Agar aktivitas Anda semakin menyenangkan, jangan lupa ajak teman-teman. Tapi ingat ya, jangan terlalu boros! Jangan sampai Anda khilaf, lalu membeli segala benda yang ada di depan mata. Duh, itu malah bikin dompet tipis dan efeknya malah semakin stres.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "9. Yakinlah Badai Pasti Berlalu, Jadi Tak Perlu Terlalu Menyiksa Diri.",
                  "Yang namanya orang hidup pastinya akan selalu dihadapkan pada berbagai masalah. Itu wajar! Tidak ada satu manusia pun yang luput dari cobaan.Maka itu, untuk menyikapinya Anda tak perlu bersedih berlebihan. Yakinlah bahwa badai pasti berlalu. Tak peduli seberapa pahit dan seberapa sulit, semua itu pasti akan terlewati seiring berjalannya waktu. Anda hanya perlu bertahan untuk menjalaninya.",
                ),
                SizedBox(
                  height: 22,
                ),
                CalmYourselfCard(
                  "10. Jangan Pernah Lari Dari Masalah, Anda Harus Menghadapinya!",
                  "Ketika pikiran Anda terasa kacau dikarenakan suatu masalah, cara menenangkan diri yang paling efektif adalah dengan menghadapi masalah tersebut. Bukan dengan lari ataupun bersembunyi.Lari dari masalah tidak hanya membuat Anda seperti pengecut, tapi juga bikin hati semakin tidak tentram atau cemas. Oleh sebab itu, jadilah seseorang yang bertanggung jawab! Bila memang Anda salah, maka mengakulah. Selesaikan apa yang telah Anda perbuat.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
