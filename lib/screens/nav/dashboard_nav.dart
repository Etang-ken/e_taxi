import 'package:e_taxi/screens/dashboard/home.dart';
import 'package:e_taxi/screens/dashboard/profile/settings.dart';
import 'package:e_taxi/screens/dashboard/transport/select_transport.dart';
import 'package:e_taxi/screens/dashboard/widgets/drawer.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';

class DashboardNav extends StatefulWidget {
  const DashboardNav({super.key});

  @override
  State<DashboardNav> createState() => _DashboardNavState();
}

class _DashboardNavState extends State<DashboardNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SelectTransportScreen(),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.blue,
    ),
    SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Builder(builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Image.asset(
                      "assets/images/icon-menu.png",
                      width: 40,
                    ),
                  );
                }),
                Expanded(
                  child: SizedBox(
                    width: 10,
                  ),
                ),
                Image.asset(
                  "assets/images/icon-search.png",
                  width: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/icon-notif.png",
                  width: 40,
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.60,
        backgroundColor: Colors.transparent,
        child: AppDrawer(),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/icon-home.png",
                  width: 30,
                  color: _selectedIndex == 0 ? null : AppColors.darkGrey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/icon-fav.png",
                  width: 30,
                  color: _selectedIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.darkGrey,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/icon-offer.png",
                  width: 30,
                  color: _selectedIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.darkGrey,
                ),
                label: 'Offer',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/icon-prifile.png",
                  width: 30,
                  color: _selectedIndex == 4
                      ? AppColors.primaryColor
                      : AppColors.darkGrey,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.darkColor,
            selectedLabelStyle: AppStyles.smallBodyText,
            unselectedLabelStyle: AppStyles.smallBodyText,
            backgroundColor: Colors.white,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
