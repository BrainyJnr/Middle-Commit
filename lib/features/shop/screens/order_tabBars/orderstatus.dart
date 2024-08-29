import 'package:amazing/features/shop/screens/order_tabBars/widgets/order_controller.dart';
import 'package:amazing/features/shop/screens/order_tabBars/widgets/order_model.dart';
import 'package:amazing/utilis/constants/colors.dart';
import 'package:amazing/utilis/constants/sizes.dart';
import 'package:amazing/utilis/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../address/address_screen.dart';

class OrderStatusView extends StatelessWidget {
  final String status;

  const OrderStatusView(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.put(OrderController());

    return Scaffold(
      body: Obx(() {
        List<OrderModel> orders;

        switch (status) {
          case 'Oncoming':
            orders = controller.oncomingOrders;
            break;
          case 'Delivered':
            orders = controller.deliveredOrders;
            break;
          case 'Cancelled':
            orders = controller.cancelledOrders;
            break;
          default:
            orders = [];
        }

        if (orders.isEmpty) {
          return Center(child: Text("No $status orders found"));
        }



        return ListView.separated(
          itemCount: orders.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderCard(order: order);
          },
        );
      }),
    );
  }
}




class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = fHelperFunctions.isDarkMode(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.9;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (order.orderImageUrls.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(order.orderImageUrls.length, (index) {
                    final item = order.items[index]; // Each item for its specific image
                    return Container(
                      width: containerWidth,
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.only(bottom: 10), // Space between items
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.3), ),bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                       // border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(5),
                        color: dark ? fColors.black : fColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Thumbnail
                              Container(
                                height: 100,
                                width: 85,
                                padding: const EdgeInsets.all(fSizes.sm),
                                decoration: BoxDecoration(
                                  color: dark ? fColors.black : fColors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    order.orderImageUrls[index],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Center(
                                      child: Icon(Icons.error, color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: fSizes.sm),
                                      child: Text(
                                        item.title, // Display specific title for each item
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: fSizes.xs),
                                      child: Text(
                                        "Price: \u20A6${item.price.toStringAsFixed(0)}", // Display specific price for each item
                                        style: const TextStyle(color: fColors.error),
                                      ),
                                    ),Text(
                                      order.formattedOrderDate,
                                      style: TextStyle(
                                        color: dark ? fColors.white : fColors.black,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 5,left: 2,right: 2), // Space above the button
                          child: Row(
                            children:[
                             Container(
                              height: 37,width: 150,
                              decoration: BoxDecoration(
                                color: fColors.error,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: InkWell(
                                onTap: ()  => Get.to(addresscreen()),
                                  // Implement the action for the Recorder button

                                // child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cached, color: Colors.white), // Use appropriate icon
                                    const SizedBox(width: 5),
                                    const Text(
                                      "Recorder",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                              Spacer(),

                              Container(
                                height: 37,width: 150,
                                decoration: BoxDecoration(
                                  color: fColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: fColors.error)
                                ),
                                child: InkWell(
                                  onTap: () {
                                    // Implement the action for the Recorder button
                                  },
                                  // child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                     // Icon(Icons.cached, color: Colors.white), // Use appropriate icon
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Get help",
                                        style: TextStyle(color: fColors.error),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ]  ),
                        ),
]
                      ),
                    );
                  }),
                )
              else
                Container(
                  height: 100,
                  width: containerWidth,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
