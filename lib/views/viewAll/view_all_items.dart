import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes/utils/constants.dart';
import 'package:recipes/widgets/food_items_display.dart';
import 'package:recipes/widgets/icon_button.dart';
import 'package:recipes/widgets/item_text.dart';

class ViewAllItems extends StatefulWidget {
  const ViewAllItems({super.key});

  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  final CollectionReference allRecipes =
      FirebaseFirestore.instance.collection('recipes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          const SizedBox(width: 15),
          TIconButton(
            icon: Icons.arrow_back_ios_new,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          const Text(
            "Quick & Easy",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TIconButton(
            icon: Iconsax.notification,
            onPressed: () {},
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 5),
        child: Column(
          children: [
            const SizedBox(height: 10),
            StreamBuilder(
              stream: allRecipes.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return GridView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .60,
                      ),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Column(
                          children: [
                            FoodItemsDisplay(
                                documentSnapshot: documentSnapshot),
                            Row(
                              children: [
                                const Icon(Iconsax.star1,
                                    color: Colors.amberAccent),
                                const SizedBox(width: 5),
                                ItemText(
                                    documentSnapshot: documentSnapshot,
                                    text: documentSnapshot['rating']),
                                ItemText(
                                    documentSnapshot: documentSnapshot,
                                    text: "/5"),
                                const SizedBox(width: 5),
                                ItemText(
                                    documentSnapshot: documentSnapshot,
                                    text:
                                        "${documentSnapshot['reviews'].toString()} Reviews"),
                              ],
                            ),
                          ],
                        );
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
