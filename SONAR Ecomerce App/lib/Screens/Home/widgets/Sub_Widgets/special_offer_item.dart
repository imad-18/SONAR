import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/special_offer_model.dart';

class SpecialOfferItem extends StatelessWidget {

  final SpecialOfferModel offer; //we must declare our class in lib/models/special_offer_model.dart

  const SpecialOfferItem({
    super.key, 
    required this.offer, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        //color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
      ),
      //we add stack widge to add other elements: image & text
      //but we wrapped it with 'ClipRRect' to reset 'borderRadius'
      //then we wrapped the 'image' with 'SizedBox' and copy the last pref(width & height)
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            SizedBox(
              width: 250,
              height: 100,
              child: Image.asset(offer.imagePath,
                fit: BoxFit.cover,  //So interesting, it makes the pic takes all the container shape
              ),
            ),
            //we add the shadow layer above the image
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            //Adding texts layer above all
            //to fix the text position, wrap 'text.rich' either with 'Positined' widget or 'Padding' widget
            //..& adjust padd & margins settings(left,top,...). Or Pading: EdgeInsets...
            //N.B: 'Positioned' is only used in case of 'stack' widget
            Positioned(
              left: 17,
              top: 15,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${offer.name}\n',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${offer.number} Brands\n',
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
