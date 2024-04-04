import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'prodi.dart';

class ProdiDetail extends StatelessWidget {
  final Prodi prodi;

  const ProdiDetail({Key? key, required this.prodi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prodi.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image(
                        image: AssetImage(prodi.imageUrl),
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prodi.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Palationo',
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        // Add other details here if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prodi.profile,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Visi Keilmuan:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prodi.visi,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Misi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: prodi.misi
                  .map(
                    (misi) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        title: Text(misi.misi),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kepala Program Studi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prodi.kaprodi,
                style: TextStyle(fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (await canLaunch(prodi.lamanWebsite)) {
                  await launch(prodi.lamanWebsite);
                } else {
                  throw 'Could not launch ${prodi.lamanWebsite}';
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  prodi.lamanWebsite,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Prestasi Mahasiswa:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: prodi.prestasiMahasiswa
                  .map(
                    (prestasi) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        title: Text(prestasi.prestasiMahasiswa),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dosen:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: prodi.dosens
                  .map(
                    (dosen) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        title: Text(dosen.name),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
