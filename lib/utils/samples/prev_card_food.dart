import 'package:flutter/material.dart';
import 'package:restaurantdelapp/pages/detail_pages/product_detail_page.dart';
import 'package:restaurantdelapp/utils/states/busket_state.dart';

import '../consts/colors.dart';
import '../consts/texts.dart';
import '../enums/food_list.dart';

class PrevFoodCard extends StatefulWidget {
  PrevFoodCard({Key? key, required this.index, required this.busketState})
      : super(key: key);
  BusketState busketState;
  final int index;

  @override
  State<PrevFoodCard> createState() => _PrevFoodCardState();
}

class _PrevFoodCardState extends State<PrevFoodCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                      index: widget.index, busketState: widget.busketState),
                ),
              );
            },
            child: Image.asset(FoodList.foodList[widget.index].image),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            index: widget.index,
                            busketState: widget.busketState),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrevFoodTitleText(
                          text: FoodList.foodList[widget.index].title),
                      PrevFoodPriceText(
                          text: FoodList.foodList[widget.index].price)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        widget.busketState.addToBusket(widget.index);
                      },
                    );
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
