import 'package:flutter/material.dart';
import 'package:lesson/controllers/list_controller.dart';
import 'package:lesson/data/character_model.dart';

class Cartoon extends StatefulWidget {
  const Cartoon({super.key});

  @override
  State<Cartoon> createState() => _CartoonState();
}

class _CartoonState extends State<Cartoon> {
  late Future<List<CharacterModel>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = ListController.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick&Morty'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: futureCharacters,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Ошибка загрузки'),
              );
            }

            final characters = snapshot.data!;

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];

                return ListTile(
                  onTap: () {
                    _showCharacterBottomSheet(context, character);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(character.imageUrl),
                  ),
                  title: Text(character.name),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showCharacterBottomSheet(
    BuildContext context,
    CharacterModel character,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  character.imageUrl,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                character.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text('Status: ${character.status}'),
              Text('Species: ${character.species}'),
              Text('Gender: ${character.gender}'),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
