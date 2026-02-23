import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';
import 'package:flutter_application_1/presentaion/coin_list/screens/crypto_list_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/logo.png')),
            SpinKitWave(color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }

  void getData(context) async {
    var response = await Dio().get(
      'https://rest.coincap.io/v3/assets?apiKey=e9bdb4d77f65c6e71957c233f65c40a585d6209aff09742c6edacb4305132e31',
    );
    List<Crypto> cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CoinCryptoScreen(cryptoList: cryptoList);
        },
      ),
    );
  }
}
