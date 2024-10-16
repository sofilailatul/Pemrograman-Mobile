import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendeklarasikan warna utama dari tema
    Color color = Theme.of(context).primaryColor;

    // Widget titleSection yang berisi struktur Row dan Column untuk title
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Air Terjun di Batu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );

    // Widget buttonSection yang berisi kolom-kolom dengan ikon dan teks
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Widget textSection yang berisi teks dengan padding
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Air Terjun Coban Talun yang merupakan Salah Satu Objek Wisata di Kota Batu Malang yang terkenal berasal dari aliran Sungai Brantas yang masuk ke dalam hutan lindung dengan kondisi air tanah yang masih baik dan memiliki aliran deras.'
        'Lokasi Coban Talun yang tidak jauh dari pusat Kota Malang dan berada di dalam hutan dengan suasana asri dan masih sejuk menjadi daya Tarik masyarakat dalam berkunjung/berwisata disana.'
        'Teks ini dibuuat oleh Sofi Lailatul A '
        'identitas hasil pekerjaan Anda. '
        'Selamat mengerjakan 🙂.',
        softWrap: true, // Membungkus teks jika melebihi lebar kolom
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout Demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'image/talun.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,    // Section untuk judul
            buttonSection,   // Section untuk tombol
            textSection,     // Section untuk teks
          ],
        ),
      ),
    );
  }

  // Method untuk membangun kolom tombol dengan ikon dan teks
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color), // Ikon dengan warna yang ditentukan
        Container(
          margin: const EdgeInsets.only(top: 8), // Jarak atas teks
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12, // Ukuran font untuk teks
              fontWeight: FontWeight.w400,
              color: color, // Warna teks sesuai parameter
            ),
          ),
        ),
      ],
    );
  }
}