import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/nav_list.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Home'),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(NavigationRoutes.editProduct,
                    arguments: Product(
                        name: 'product_name',
                        price: '100',
                        imageUrl:
                            'https://aaveg.in/22/assets/images/team/110120090.jpg',
                        quantity: '100',
                        description: 'okay',
                        category: 'Two'));
              },
              child: const Text('Edit Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(NavigationRoutes.addProduct, arguments: Product());
              },
              child: const Text('Add Product'),
            ),
          ],
        )), //TODO : Need to remove After PR review
        bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 0,
            currentIndex: controller.selectedIndex.value,
            onTap: (value) {
              if (value < 3) {
                controller.selectedIndex.value = value;
                controller.onPageChanged();
              } else {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Wrap(
                        children: moreList
                            .map(
                              (e) => ListTile(
                                leading: e['icon'] as Widget,
                                title: Text(e['title'] as String),
                              ),
                            )
                            .toList()));
              }
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppTheme.navColor,
            unselectedItemColor: AppTheme.deSelected,
            selectedLabelStyle: TextStyle(color: AppTheme.textPrimary),
            showUnselectedLabels: false,
            selectedFontSize: 10,
            items: navList
                .map((e) => BottomNavigationBarItem(
                      icon: e['icon'] as Widget,
                      label: e['title'] as String,
                    ))
                .toList())),
      );
}
