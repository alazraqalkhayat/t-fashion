import 'package:flutter/material.dart';
import 'package:t_fashion/core/others/Constants.dart';

class ProductPriceText extends StatelessWidget {

  late String oldPrice,newPrice;


  ProductPriceText({required this.oldPrice,required this.newPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(newPrice,style: TextStyle(color: kDarkOrange),),
        SizedBox(
          width: 20,
        ),
        Text(
          oldPrice,
          style: TextStyle(

              color: kDarkOrange,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid
          ),
        ),
      ],
    );
  }
}
