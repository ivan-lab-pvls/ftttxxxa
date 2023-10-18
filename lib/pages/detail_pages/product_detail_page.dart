import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantdelapp/utils/consts/texts.dart';
import 'package:restaurantdelapp/utils/enums/food_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurantdelapp/utils/states/busket_state.dart';

import '../../utils/consts/colors.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.index, required this.busketState}) : super(key: key);
  final int index;
  BusketState busketState;
  int count = 1;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp),
                    ),
                    Text(
                      'PRODUCT',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Image.asset(
                      FoodList.foodList[widget.index].image,
                    ),
                  ),
                ),
                FoodTitleText(text: FoodList.foodList[widget.index].title),
                SizedBox(
                  height: 10,
                ),
                FoodPriceText(text: FoodList.foodList[widget.index].price),
                SizedBox(
                  height: 15,
                ),
                FoodIngredText(
                    text: FoodList.foodList[widget.index].ingredients)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    if (widget.count > 1) {
                                      widget.count--;
                                    }
                                  },
                                );
                              },
                              icon: Icon(CupertinoIcons.minus),
                            ),
                          ),
                          Text(
                            widget.count.toString(),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    widget.count++;
                                  },
                                );
                              },
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.busketState.addToBusketCount(widget.index,widget.count);
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: Text('ADD TO ORDER',
                                style: TextStyle(color: Colors.white))),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
