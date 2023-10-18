import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantdelapp/utils/enums/food_list.dart';

import '../consts/colors.dart';
import '../consts/texts.dart';
import '../states/busket_state.dart';

class BasketCard extends StatefulWidget {
  BasketCard({Key? key, required this.index, required this.busketState}) : super(key: key);
  final int index;
  BusketState busketState;
  @override
  State<BasketCard> createState() => _BasketCardState();
}

class _BasketCardState extends State<BasketCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: borderColor)),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(FoodList.foodList[widget.index].image),
          ),
           Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrevFoodTitleText(
                  text: FoodList.foodList[widget.index].title,
                ),
                PrevFoodPriceText(text: FoodList.foodList[widget.index].price),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: borderColor)),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(
                              () {
                                if(widget.busketState.busketItems[widget.index]! > 0){
                                  widget.busketState.removeFromBusket(widget.index);
                                }
                              },
                        );
                      },
                      icon: Icon(CupertinoIcons.minus),
                    ),
                  ),
                  Text(
                    widget.busketState.busketItems[widget.index].toString(),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                        setState(() {
                          widget.busketState.addToBusket(widget.index);
                        });});
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
