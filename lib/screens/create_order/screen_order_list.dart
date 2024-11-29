import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jindal_dealer/constants/color_properties.dart';
import 'package:jindal_dealer/constants/label_constant.dart';
import 'package:jindal_dealer/constants/text_style.dart';
import 'create_order_view.dart';
import 'package:jindal_dealer/model/create_order_model/create_order_model.dart';

class ScreenOrderList extends StatelessWidget {
  const ScreenOrderList({super.key});
  static const routeName = "orderList";

  @override
  Widget build(BuildContext context) {
    final RxList<Order> orderList = <Order>[].obs;

    void _addOrder(Order order) {
      orderList.add(order);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(Labels.orderList),
        backgroundColor: transparent,
      ),
      body: Obx(() => orderList.isEmpty
          ? Center(
        child: Text(
          Labels.noOrderCreatedYet,
          style: normal_400_regular_15,
        ),
      )
          : ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          final order = orderList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ${order.orderId}',
                    style: normal_400_regular_15,
                  ),
                  Text(
                    'Date: ${order.orderDate}',
                    style: normal_400_regular_15,
                  ),
                  Text(
                    'Plan: ${order.planName}',
                    style: normal_400_regular_15,
                  ),
                  Text(
                    'Status: ${order.orderStatus}',
                    style: normal_400_regular_15,
                  ),
                  SizedBox(height: Get.height * 0.002),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: Labels.action,
                          style: normal_400_regular_black_15,
                          children: [
                            TextSpan(
                              text: Labels.editDeleteSubmit,
                              style: normal_400_regular_blue_15,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          orderList.refresh();
                        },
                        child: Icon(
                          Icons.refresh,
                          size: Get.width * 0.04,
                          color: blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newOrder = await Get.toNamed(ScreenCreateOrder.routeName);
          if (newOrder != null) {
            _addOrder(newOrder);
          }
        },
        backgroundColor: greenAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
