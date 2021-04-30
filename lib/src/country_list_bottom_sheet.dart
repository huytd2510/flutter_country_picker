import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_theme_data.dart';
import 'country_list_view.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
void showCountryListBottomSheet({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  VoidCallback? onClosed,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode = false,
  CountryListThemeData? countryListTheme,
  String titleSearch = "",
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _builder(
      context,
      onSelect,
      exclude,
      countryFilter,
      showPhoneCode,
      countryListTheme,
        titleSearch,
    ),
  ).whenComplete(() {
    if (onClosed != null) onClosed();
  });
}

Widget _builder(
  BuildContext context,
  ValueChanged<Country> onSelect,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode,
  CountryListThemeData? countryListTheme,
    String titleSearch
) {
  final statusBarHeight = MediaQuery.of(context).padding.top;

  Color? _backgroundColor = countryListTheme?.backgroundColor ??
      Theme.of(context).bottomSheetTheme.backgroundColor;
  if (_backgroundColor == null) {
    if (Theme.of(context).brightness == Brightness.light) {
      _backgroundColor = Colors.white;
    } else {
      _backgroundColor = Colors.black;
    }
  }

  return Container(
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: _backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(10.0),),
    ),
    child:
    Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Text(titleSearch, style: TextStyle(fontSize: ScreenScale.convertFontSize(30), color: Color(0xff4B5574), fontWeight: FontWeight.w700,),),
        ),
        Container(
          height: ScreenScale.convertHeight(700),
          child: CountryListView(
            onSelect: onSelect,
            exclude: exclude,
            countryFilter: countryFilter,
            showPhoneCode: showPhoneCode,
            countryListTheme: countryListTheme,
          ),
        )
      ],
    )

  );
}
