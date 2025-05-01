import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: StadiumListPage()));

class StadiumListPage extends StatelessWidget {
  const StadiumListPage({super.key});

  final List<Map<String, String>> stadiums = const [
    {
      "name": "Melbourne Cricket Ground",
      "image":
          "assets/Melbourne.JPEG",
      "info":
          "Located in Melbourne, Australia, it's one of the largest stadiums in the world and hosts international cricket and AFL matches."
    },
    {
      "name": "Gaddafi Stadium",
      "image":
          "assets/Lords.JPEG",
      "info":
          "Situated in Lahore, Pakistan, this stadium is named after Libyan leader Muammar Gaddafi and is a major venue for Pakistan cricket."
    },
    {
      "name": "Eden Gardens",
      "image":
          "assets/Eden garden.JPEG ",
      "info":
          "Located in Kolkata, India, it's known as the 'Mecca of Indian Cricket' and one of the most iconic stadiums in the world."
    },
    {
      "name": "Lord's Cricket Ground",
      "image":
          "assets/Gaddafi.JPEG",
      "info":
          "Known as the 'Home of Cricket', Lord's is located in London, England and is home to the MCC and historical cricket matches."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cricket Stadiums")),
      body: ListView.builder(
        itemCount: stadiums.length,
        itemBuilder: (context, index) {
          final stadium = stadiums[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Hero(
              tag: stadium['name']!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  stadium['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(stadium['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StadiumDetailPage(
                    name: stadium['name']!,
                    imageUrl: stadium['image']!,
                    info: stadium['info']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StadiumDetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String info;

  const StadiumDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Hero(
            tag: name,
            child: Image.network(imageUrl, height: 250, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              info,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
