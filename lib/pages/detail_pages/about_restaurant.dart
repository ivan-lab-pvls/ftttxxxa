import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurantdelapp/utils/consts/colors.dart';

class AboutRestaurantPage extends StatefulWidget {
  const AboutRestaurantPage({Key? key}) : super(key: key);

  @override
  State<AboutRestaurantPage> createState() => _AboutRestaurantPageState();
}

class _AboutRestaurantPageState extends State<AboutRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  'ABOUT OUR RESTAURANT',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Image.asset('assets/abapp.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Once upon a time in a bustling city in China, there lived a young entrepreneur named Li...',
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: borderColor),
                'Once upon a time in a bustling city in China, there lived a young entrepreneur named Li. Li was passionate about two things: his love for Chinese culture and his fascination with the aroma of freshly brewed tea. He had a dream to share the richness of Chinese traditions with the world, one cup at a time.\n\nOne sunny afternoon, while wandering through the historic streets of his city, Li stumbled upon a quaint old building with traditional Chinese architecture. It was a place steeped in history, and it had a mystical charm that captured his heart. Li decided that this would be the perfect location to bring his dream to life.\n\nWith unwavering determination and a small nest egg of savings, Li purchased the old building. He meticulously renovated it, blending the traditional architectural elements with a modern touch. Inside, he created a serene oasis, adorned with Chinese art and furnishings that told stories of generations past.\n\nLi spent months researching and learning about various Chinese tea traditions. He traveled to remote tea plantations, met with tea masters, and honed his knowledge about tea preparation. He carefully curated a menu of teas that represented the vast diversity of Chinese tea culture, from delicate green teas to bold black teas.\n\nThe day finally arrived when Li opened the doors of his Chinese teahouse. The aroma of freshly brewed tea wafted through the air, drawing in curious passersby. As people entered, they were transported to a world where time seemed to slow down, and the rituals of tea drinking became a way to escape the hustle and bustle of modern life.\n\n\n\nLi\'s teahouse soon became a beloved haven for locals and a hidden gem for tourists. It wasn\'t just a place to sip tea; it was a place to connect with the heart')
          ],
        ),
      ),
    );
  }
}
