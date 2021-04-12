import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 40,
              ),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  homeController.convert();
                },
                child: Text('CONVERSOR'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
