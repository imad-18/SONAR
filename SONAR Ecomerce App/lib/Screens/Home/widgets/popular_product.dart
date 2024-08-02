import 'package:flutter/material.dart';

import '../../../models/popular_product_model.dart';
import 'Sub_Widgets/popular_product_items.dart';
import 'Sub_Widgets/section_title.dart';

class PopularProducts extends StatelessWidget {

  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //this column has both the 'sectionTitle' & the 'container Product' widgets
      children: [
        const SectionTitle(sec_Title: 'Popular Product'),
        const SizedBox(height: 1),
        SizedBox(
          width: double.maxFinite,
          //'Bottom Overflowed by 50 pixels ' error was because i hade only 100 the height
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: PopularProductList.length,
              itemBuilder: (context, index) {
                //this container contains the grey cont, title and the row of price & icon
                return PopularProductItems(myProducts: PopularProductList[index]);
              }),
        )
      ],
    );
  }
}

