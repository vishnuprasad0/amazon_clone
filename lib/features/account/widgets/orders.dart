import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Your Orders',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 18,
                    color: GlobalVariables.selectedNavBarColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        //display the orders
        Container(
          height: 180,
          padding: const EdgeInsets.only(left: 10, right: 0, top: 20),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return ;
            },
          ),
        )
      ],
    );
  }
}
