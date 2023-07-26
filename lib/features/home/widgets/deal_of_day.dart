import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  get product => 'https://www.amazon.in/b/?_encoding=UTF8&node=27983785031&pf_rd_p=cd26c2fa-f77e-43f7-bcbb-89d07c754d91&pd_rd_wg=Jbyjf&pf_rd_r=M7DGYX5DZGBAYB9N9A4K&content-id=amzn1.sym.cd26c2fa-f77e-43f7-bcbb-89d07c754d91&pd_rd_w=CuqV4&painterId=billboard-card&pd_rd_r=e03b7030-cbb4-41b3-b5f1-595907942298&ref_=pd_gwm_unk';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const SizedBox()
        : GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: const Text(
                    'Deal of the day',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.network(
                  product!.images,
                  height: 235,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    '\$5',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                  child: const Text(
                    'vishnu',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: product!.images
                        .map(
                          (e) => Image.network(
                            e,
                            fit: BoxFit.fitWidth,
                            width: 100,
                            height: 100,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ).copyWith(left: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'See all deals',
                    style: TextStyle(
                      color: Colors.cyan[800],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
