import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_api_flutter/controllers/superhero_view_model.dart';
import 'package:marvel_api_flutter/models/superhero_model.dart';

class SuperheroView extends StatelessWidget {
  const SuperheroView({super.key});

  @override
  Widget build(BuildContext context) {
    final SuperheroViewModel controller = Get.put(SuperheroViewModel());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Marvel Superheroes'),
      ),
      body: Obx(() {
        if (controller.fetchingData.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.superheros.isEmpty) {
          return const Center(child: Text("No superheroes found!"));
        }

        return ListView.builder(
          itemCount: controller.superheros.length,
          itemBuilder: (context, index) {
            return ListCard(character: controller.superheros[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchSuperheros,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

//class for List Card
class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.character});

  final SuperHero character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => CharacterDetailScreen(characterDetail: character));
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      character.imageUrl ?? "",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 100);
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.name ?? "",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                character.realName ?? "",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}

// class for hero detail screen
class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key, required this.characterDetail});

  final SuperHero characterDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(characterDetail.name ?? "")),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Image(
            image: NetworkImage(characterDetail.imageUrl ?? ""),
          ),
        ));
  }
}
