import 'package:flutterme_credit_card/flutterme_credit_card/utils/constants.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/utils/validations.dart';
import 'package:flutter/material.dart';

class CardBody extends StatefulWidget {
  /// ## Card Body
  /// This contain all the data within the card. Such data include
  /// * Title
  /// * Title Style
  /// * Number
  /// * Number Style
  /// * Valid Thru
  /// * Valid Thru Style
  /// * CVV
  /// * CVV Style
  /// * Holder
  /// * Holder Style
  /// * Card Type
  const CardBody({
    super.key,
    required this.title,
    required this.titleStyle,
    required this.number,
    required this.numberStyle,
    required this.numberMaskType,
    required this.validThru,
    required this.validThruStyle,
    required this.validThruMaskType,
    required this.cvv,
    required this.cvvStyle,
    required this.cvvMaskType,
    required this.holder,
    required this.holderStyle,
  });
  final String title;
  final TextStyle titleStyle;
  final String number;
  final TextStyle numberStyle;
  final FMMaskType numberMaskType;
  final String validThru;
  final TextStyle validThruStyle;
  final FMMaskType validThruMaskType;
  final String cvv;
  final TextStyle cvvStyle;
  final FMMaskType cvvMaskType;
  final String holder;
  final TextStyle holderStyle;

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    String number = widget.number;
    String validThru = widget.validThru;
    String cvv = widget.cvv;
    String holder = widget.holder;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(title, number),
        body(number, validThru, cvv),
        footer(holder),
      ],
    );
  }

  /// ## Header
  /// ### **Type:** `Widget`
  /// The card header containing the *Card Title* and the *Card Type*
  Widget header(String title, String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: widget.titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            cardIcon(number: number),
            width: 60,
            fit: BoxFit.cover,
            package: "flutterme_credit_card",
          ),
        )
      ],
    );
  }

  /// ## Body
  /// ### **Type:** `Widget`
  /// The card body containing the *Card Number*, *Card Valid Thru* and the *Card CVV*
  Widget body(String number, String validThru, String cvv) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maskCardNumber(
              number: number.isEmpty ? "0000 0000 0000 0000" : number,
              maskType: widget.numberMaskType,
            ),
            style: widget.numberStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Valid Thru",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    maskValidThru(
                      validThru: validThru.isEmpty ? "****" : validThru,
                      maskType: widget.validThruMaskType,
                    ),
                    style: widget.validThruStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "CVV",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    maskCVV(
                      cvv: cvv.isEmpty ? "***" : cvv,
                      maskType: widget.cvvMaskType,
                    ),
                    style: widget.cvvStyle,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  /// ## Footer
  /// ### **Type:** `Widget`
  /// The card footer containing the *Card Holder Name*
  Widget footer(String holder) {
    return Text(
      holder.isEmpty ? "John Doe" : holder,
      style: widget.holderStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
