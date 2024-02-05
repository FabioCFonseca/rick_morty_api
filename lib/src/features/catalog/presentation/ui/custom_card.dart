import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';

import '../../../details/presentation/details_page.dart';
import '../../domain/catalog.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.selectedList,
    required this.favorites,
    required this.toggleFunction,
  });

  final List selectedList;
  final List favorites;
  final void Function({CatalogModel? character}) toggleFunction;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: selectedList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(35),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        selectedList[index].image,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(selectedList[index].name,
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.to(DetailsPage(
                          selectedCharacter: selectedList[index].id,
                        )),
                        child: const Text('Details'),
                      ),
                      GestureDetector(
                        onTap: () =>
                            toggleFunction(character: selectedList[index]),
                        child: Obx(() => Icon(
                              favorites.contains(selectedList[index])
                                  ? FontAwesome.heart
                                  : FontAwesome.heart_o,
                              color: Color(0xffA333C8),
                              size: 30,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
