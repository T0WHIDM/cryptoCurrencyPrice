import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constant.dart';
import 'package:flutter_application_1/domain/entity/crypyo_model.dart';
import 'package:flutter_application_1/presentaion/coin_list/bloc/coin_list_bloc.dart';
import 'package:flutter_application_1/presentaion/coin_list/bloc/coin_list_event.dart';
import 'package:flutter_application_1/presentaion/coin_list/bloc/coin_list_state.dart';
import 'package:flutter_application_1/presentaion/coin_list/widgets/coin_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinCryptoScreen extends StatefulWidget {
  final List<Crypto>? cryptoList;
  const CoinCryptoScreen({super.key, this.cryptoList});
  @override
  State<CoinCryptoScreen> createState() => _CoinCryptoScreenState();
}

class _CoinCryptoScreenState extends State<CoinCryptoScreen> {
  List<Crypto>? cryptoList;
  bool loadingVisible = false;

  @override
  void initState() {
    super.initState();
    cryptoList = widget.cryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinListBloc(),
      child: BlocConsumer<CoinListBloc, CoinListState>(
        listener: (context, state) {
          if (state is CoinListFaildState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return BlocBuilder<CoinListBloc, CoinListState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: blackColor,
                  centerTitle: true,
                  automaticallyImplyLeading:
                      false, //برای اینکه دکمه بک رو نشون نده
                  title: Text(
                    'کریپتو بازار',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'morabee',
                    ),
                  ),
                ),
                backgroundColor: blackColor,
                body: Center(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              onChanged: (value) {
                                // _searchFilter(value);
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'نام رمز ارز معتبر خود را وارد کنید',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'morabee',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: greenColor,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: loadingVisible,
                          child: Text(
                            'درحال اپدیت قیمت رمز ارز ها',
                            style: TextStyle(
                              color: greenColor,
                              fontFamily: 'morabee',
                            ),
                          ),
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            backgroundColor: greenColor,
                            color: blackColor,
                            strokeWidth: 2,
                            onRefresh: () async {
                              context.read<CoinListBloc>().add(
                                RefreshCoinEvent(),
                              );
                            },
                            child: _buildByState(state),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildByState(CoinListState state) {
    switch (state) {
      case CoinListLoadingState():
        return Center(child: SpinKitWave(color: Colors.white, size: 30.0));
      case CoinListSucsessState():
        return BuildSuccessListWidget(cryptoList: state.cryptoList);
      case CoinListFaildState():
        return Center(child: Text(state.errorMessage));
    }
  }
}

class BuildSuccessListWidget extends StatelessWidget {
  const BuildSuccessListWidget({super.key, required this.cryptoList});

  final List<Crypto>? cryptoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: cryptoList!.length,
      itemBuilder: (context, index) {
        return coinListItem(cryptoList![index]);
      },
    );
  }
}
