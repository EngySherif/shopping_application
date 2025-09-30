import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  final List<String> featuredImages = [
    "assets/images/TheMerchantOfVenice.jpg",
    "assets/images/RichardIII.jpg",
    "assets/images/ATaleOfTwoCities.jpg",
  ];

  final products = [
    {"title": "Oliver Twist", "image": "assets/images/OliverTwist.jpg"},
    {"title": "David Copperfield", "image": "assets/images/DavidCopperfield.jpg"},
    {"title": "Great Expectations", "image": "assets/images/GreatExpectations.jpg"},
    {"title": "A Christmas Carol", "image": "assets/images/AChristmasCarol.jpg"},
    {"title": "Hamlet", "image": "assets/images/Hamlet.jpg"},
    {"title": "King Lear", "image": "assets/images/KingLear.jpg"},
  ];

  final offers = [
    {"Description": "The Pick Wick Papers by Charles Dickens", "image": "assets/images/ThePickWickPapers.jpg"},
    {"Description": "Macbeth by William Shakespeare", "image": "assets/images/Macbeth.jpg"},
    {"Description": "Romeo and Juliet by William Shakespeare", "image": "assets/images/Romeo&Juliet.jpg"},
    {"Description": "The Tempest by William Shakespeare", "image": "assets/images/TheTempest.jpg"},
    {"Description": "Twelfth Night by William Shakespeare", "image": "assets/images/TwelfthNight.jpg"},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: featuredImages.length, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handlePageViewChanged(int index) {
    _tabController.index = index;
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Our Products")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: featuredImages.length,
                onPageChanged: _handlePageViewChanged,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        featuredImages[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_left_rounded, size: 32),
                    onPressed: () {
                      if (_currentPageIndex > 0) {
                        _updateCurrentPageIndex(_currentPageIndex - 1);
                      }
                    },
                  ),
                  TabPageSelector(controller: _tabController),
                  IconButton(
                    icon: const Icon(Icons.arrow_right_rounded, size: 32),
                    onPressed: () {
                      if (_currentPageIndex < featuredImages.length - 1) {
                        _updateCurrentPageIndex(_currentPageIndex + 1);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(product["image"]!, fit: BoxFit.cover),
                      ),
                      Text(product["title"]!),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item added to the cart")),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hot Offers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        offer["image"]!,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(offer["Description"]!)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
