import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_test/models/special_offer_model.dart';

import 'Sub_Widgets/section_title.dart';
import 'Sub_Widgets/special_offer_item.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
            sec_Title: 'Special for you'), //head to section_title.dart widget
        const SizedBox(height: 2),
        //we wrapped ListView.builder with sizedbox to contoll it (i.e:container)
        SizedBox(
          width: double.maxFinite,
          height: 100,
          child: ListView.builder(
            //takes 'itemBuilder' as argument, which takes 2 arg as well(context & index) and return a container in this case
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            //nmbre de carousel
            itemCount: specialOfferList.length,
            itemBuilder: (context, index) {
              //Head to 'special_offer_item.dart' widget
              return SpecialOfferItem(offer: specialOfferList[index]);
            },
          ),
        ),
      ],
    );
  }
}
