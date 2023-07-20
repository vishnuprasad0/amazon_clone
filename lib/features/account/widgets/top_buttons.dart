import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AccountButton(
              text: 'Your Orders',
              onTap: () {
                ;
              },
            ),
            AccountButton(
              text: 'Turn Seller',
              onTap: () {
                ;
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AccountButton(
              text: 'Log Out',
              onTap: () {
                ;
              },
            ),
            AccountButton(
              text: 'Your WishList',
              onTap: () {
                ;
              },
            )
          ],
        )
      ],
    );
  }
}
