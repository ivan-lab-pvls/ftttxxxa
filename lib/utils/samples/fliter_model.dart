import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/colors.dart';
import '../enums/filter_list.dart';

class FiltersWindow extends StatelessWidget {
  const FiltersWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 650,
      color: firstColor,
      child: ListView(
        children: [
          Center(
            child: Text(
              'FILTER',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: borderColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListView.separated(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(FilterList
                      .filters[index].title),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
              separatorBuilder: (context, index){
                return const SizedBox(
                  height: 20,
                );
              },
              shrinkWrap: true,
              itemCount: FilterList.filters.length),
        ],
      ),
    );
  }
}
