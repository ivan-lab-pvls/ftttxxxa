import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantdelapp/pages/order_page/order_page_model.dart';
import 'package:restaurantdelapp/utils/consts/colors.dart';
import 'package:restaurantdelapp/utils/enums/food_list.dart';
import 'package:restaurantdelapp/utils/states/busket_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/consts/texts.dart';
import '../../utils/samples/busket_card_sample.dart';

class OrderPageView extends StatefulWidget {
  OrderPageView({Key? key, required this.busketState}) : super(key: key);
  BusketState busketState;

  @override
  State<OrderPageView> createState() => _OrderPageViewState();
}

class _OrderPageViewState extends State<OrderPageView> {
  bool isEmpty = true;
  int countOfItems = 0;

  void Method() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.busketState.countOfBusketItems > 0) {
      setState(() {
        isEmpty = false;
      });
    }
    return !isEmpty
        ? SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const AppBarText(text: 'ORDER'),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 2000,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: FoodList.foodList.length,
                          itemBuilder: (context, index) {
                            if (widget.busketState.busketItems[index]! < 1) {
                              return Container();
                            }
                            return BasketCard(
                              index: index,
                              busketState: widget.busketState,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            if (widget.busketState.busketItems[index]! < 1) {
                              return Container();
                            }
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.busketState.cleanBusket();
                          });
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                color: secondColor,
                                height: 800,
                                child: ListView(children: [
                                  const SizedBox(
                                    height: 150,
                                  ),
                                  Image.asset('assets/abapp.png'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'THANK YOU FOR YOUR ORDER!!!',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        color: textColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: firstColor,
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          40, 0, 40, 0),
                                      child: const Center(
                                        child: Text('Return to app'),
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: secondColor,
                          ),
                          child: Center(
                            child: Text(
                              'ORDER',
                              style: GoogleFonts.montserrat(
                                  color: firstColor, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const AppBarText(text: 'ORDER'),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          height: 300, child: Image.asset('assets/empty.png')),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'CART IS NOT YET EMPTY',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Go to the menu and choose an offer for yourself',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: borderColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFE3E3E3),
                        ),
                        child: Text(
                          'ORDER',
                          style: GoogleFonts.montserrat(
                              color: firstColor, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
