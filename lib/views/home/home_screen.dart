import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes/utils/constants.dart';
import 'package:recipes/views/home/widgets/header_parts.dart';
import 'package:recipes/views/home/widgets/search_bar.dart';
import 'package:recipes/views/viewAll/view_all_items.dart';
import 'package:recipes/widgets/banner.dart';
import 'package:recipes/widgets/food_items_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = "All";
  //Categories
  final CollectionReference categoriesItems =
      FirebaseFirestore.instance.collection('Categories');
  //Items
  Query get filteredRecipes => FirebaseFirestore.instance
      .collection("recipes")
      .where('category', isEqualTo: category);
  Query get allRecipes => FirebaseFirestore.instance.collection("recipes");
  Query get selectedRecipes => category == "All" ? allRecipes : filteredRecipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderParts(),
                  const TSearchBar(),
                  // Banner
                  const BannerToExplore(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                  //Categories
                  selectedCategory(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quick & Easy",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: .1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ViewAllItems()));
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                              color: kBannerColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: selectedRecipes.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> recipes =
                      snapshot.data?.docs ?? [];
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: recipes
                            .map((e) => FoodItemsDisplay(documentSnapshot: e))
                            .toList(),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      )),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> selectedCategory() {
    return StreamBuilder(
      stream: categoriesItems.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                streamSnapshot.data!.docs.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      category = streamSnapshot.data!.docs[index]['name'];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color:
                          category == streamSnapshot.data!.docs[index]['name']
                              ? kPrimaryColor
                              : Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      streamSnapshot.data!.docs[index]['name'],
                      style: TextStyle(
                          color: category ==
                                  streamSnapshot.data!.docs[index]['name']
                              ? Colors.white
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
