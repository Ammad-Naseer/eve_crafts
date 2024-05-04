// ignore_for_file: use_super_parameters

import 'package:eve_crafts/screens/details/details_screen.dart';
import 'package:eve_crafts/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eve_crafts/constants.dart';
import 'package:eve_crafts/models/Product.dart';
import 'package:eve_crafts/widgets/product_item.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  int itemCount = PersistentShoppingCart().getCartItemCount();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/userProfile');
                },
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('Profile'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.help),
                title: const Text('Help'),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/sellerProfile');
                },
                leading: const Icon(Icons.store),
                title: const Text('Seller Profile'),
              ),
              ListTile(
                onTap: () {
                  AuthService().signOut();
                  Navigator.pushNamed(context, '/login');
                },
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text(
                    'Terms of Service | Privacy Policy',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Eve Crafts'),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                "assets/search.svg",
                colorFilter:
                    const ColorFilter.mode(kTextColor, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
            PersistentShoppingCart().showCartItemCountWidget(
              cartItemCountWidgetBuilder: (itemCount) => IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Cart');
                },
                icon: Badge(
                  label: Text(itemCount.toString()),
                  child: SvgPicture.asset(
                    "assets/cart.svg",
                    colorFilter:
                        const ColorFilter.mode(kTextColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            const SizedBox(width: kDefaultPaddin / 2)
          ],
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(
                  image: 'assets/hand-made.png',
                  label: 'Handscraft',
                  onPressed: () {},
                ),
                CategoryButton(
                  image: 'assets/hand-made.png',
                  label: 'Painting',
                  onPressed: () {
                    // Navigate to painting category page
                  },
                ),
                CategoryButton(
                  image: 'assets/hand-made.png',
                  label: 'Crafting',
                  onPressed: () {
                    // Navigate to crafting category page
                  },
                ),
                CategoryButton(
                  image: 'assets/hand-made.png',
                  label: 'Artwork',
                  onPressed: () {
                    // Navigate to artwork category page
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to sell product page
          },
          tooltip: 'Sell Product',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String image;

  const CategoryButton({
    required this.image,
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 244, 242),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Transform.scale(
            scale: 0.6,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
