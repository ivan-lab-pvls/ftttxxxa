import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurantdelapp/utils/consts/colors.dart';


class AppBarText extends StatelessWidget {
  const AppBarText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 28,
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
class PrevFoodTitleText extends StatelessWidget {
  const PrevFoodTitleText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class FoodTitleText extends StatelessWidget {
  const FoodTitleText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class FoodIngredText extends StatelessWidget {
  const FoodIngredText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        color: borderColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class PrevFoodPriceText extends StatelessWidget {
  const PrevFoodPriceText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        color: borderColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class FoodPriceText extends StatelessWidget {
  const FoodPriceText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        color: borderColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class InvText extends StatelessWidget {
  const InvText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: 13,

        color: textLowColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
