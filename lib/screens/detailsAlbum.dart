import 'package:flutter/material.dart';

class DetailsAlbum extends StatefulWidget {
  final String? nomAlbum;

  const DetailsAlbum({Key? key, this.nomAlbum}) : super(key: key);

  @override
  State<DetailsAlbum> createState() => _DetailsAlbumState();
}

class _DetailsAlbumState extends State<DetailsAlbum> {
  late String? album;
  List<Map<String, dynamic>> listAlbum = [
    {
      'nomAlbum': "Metallica",
      'nomGroupe': "Metallica",
      'description':
          "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
      'image': "Metallica.jpg",
    },
    {
      'nomAlbum': "Ride the Lightning",
      'nomGroupe': "Metallica",
      'description':
          "Ride the Lightning est le deuxième album du groupe de thrash metal américain Metallica. Il est sorti le 27 juillet 1984 chez Megaforce Records et Music for Nations. Il est sorti chez Elektra Records le 19 novembre 1984 après que le groupe a signé chez ces derniers en septembre 1984. Ride the Lightning a été vendu à plus de six millions d'exemplaires rien qu'aux États-Unis et a été crédité sept fois disque de platine. ",
      'image': "Ride the lightning.jpg",
    },
    {
      'nomAlbum': "Master of Puppets",
      'nomGroupe': "Metallica",
      'description':
          "Master of Puppets (littéralement Le Marionnettiste), sorti le 3 mars 19863, est le troisième album studio du groupe de thrash metal Metallica. C'est le dernier album du groupe avec le bassiste Cliff Burton, ce dernier décède en effet dans un accident de bus en Suède lors de la tournée de promotion de l'album.",
      'image': "Master of puppets.jpg",
    },
    {
      'nomAlbum': "…And Justice for All",
      'nomGroupe': "Metallica",
      'description':
          "…And Justice for All est le quatrième album studio du groupe de thrash metal Metallica sorti le 25 août 1988 par Elektra Records.",
      'image': "And justice for all.jpg",
    }
  ];

  @override
  void initState() {
    super.initState();
    album = widget.nomAlbum;
  }
  
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? selectedAlbum;
    for (var albumData in listAlbum) {
      if (albumData['nomAlbum'] == album) {
        selectedAlbum = albumData;
        break;
      }
    }

    var favoriAlbum = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedAlbum?['nomAlbum']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: favoriAlbum ? Colors.blue : Colors.grey, // Couleur de fond en fonction de l'état de favoriAlbum
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  favoriAlbum ? Icons.star : Icons.star_border,
                  color: favoriAlbum ? Colors.black : null,
                ),
              ),
              Image.asset("images/${selectedAlbum?['image']}"),
              Text(
                selectedAlbum?['nomAlbum'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(selectedAlbum?['nomGroupe']),
              const SizedBox(height: 10),
              Text(selectedAlbum?['description']),
            ],
          ),
        ),
      ),
    );
  }
}


