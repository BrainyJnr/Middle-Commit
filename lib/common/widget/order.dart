import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../features/shop/screens/order_tabBars/orderstatus.dart';
import '../../utilis/constants/enums.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'My Orders',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            bottom: const TabBar(
              labelColor: Colors.red,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.black,  indicatorSize: TabBarIndicatorSize.tab, // Can be TabBarIndicatorSize.tab or TabBarIndicatorSize.label
                indicatorWeight: 1,indicatorPadding: EdgeInsets.only(left: 16),
              indicatorColor: Colors.red,
              tabs: [
                Tab(text: 'Delivered'),
                Tab(text: 'Oncoming'),
                Tab(text: 'Cancelled'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              OrderStatusView(OrderStatus.delivered),
              OrderStatusView(OrderStatus.oncoming),
              OrderStatusView(OrderStatus.cancelled),
            ],
          ),
        ));
  }
}
