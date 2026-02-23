import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constant.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';

Widget coinListItem(CryptoEntity crypto) {
  return ListTile(
    title: Text(crypto.name, style: TextStyle(color: greenColor)),
    subtitle: Text(crypto.symbol, style: TextStyle(color: greyColor)),
    leading: SizedBox(
      width: 30,
      child: Center(
        child: Text(crypto.rank.toString(), style: TextStyle(color: greyColor)),
      ),
    ),
    trailing: SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                crypto.priceUsd.toStringAsFixed(3),
                style: TextStyle(color: greyColor, fontSize: 14),
              ),
              Text(
                crypto.changePercent24Hr.toStringAsFixed(3),
                style: TextStyle(
                  color: _textChangeColor(crypto.changePercent24Hr),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
            child: Center(child: _iconChangeColor(crypto.changePercent24Hr)),
          ),
        ],
      ),
    ),
  );
}

Widget _iconChangeColor(double changePercent) {
  return changePercent <= 0
      ? Icon(Icons.trending_down, size: 30, color: redColor)
      : Icon(Icons.trending_up, size: 30, color: greenColor);
}

Color _textChangeColor(double changePercent) {
  return changePercent <= 0 ? redColor : greenColor;
}
