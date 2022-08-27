import 'package:flutter/material.dart';

import '../../../data/network/dto/user/country_dto.dart';
import '../../../logic/constants/colors/app_colors.dart';
import '../../../logic/constants/dimens/dimens.dart';
import '../../../logic/constants/strings/strings.dart';
import 'country_code.dart';

enum InputState { init, focus, success, error }

class PhoneNumberInput extends StatefulWidget {
  String? lable;
  String description;
  TextDirection direction;
  TextInputType type;
  Icon? icon;
  bool isError;
  String? value;
  Function(String code, String number) onChange;
  Function(bool hasError) hasError;

  PhoneNumberInput(
      {Key? key,
      this.lable,
      required this.onChange,
      required this.hasError,
      this.description = '',
      this.direction = TextDirection.ltr,
      this.type = TextInputType.number,
      this.icon,
      this.value,
      this.isError = false})
      : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  TextEditingController _controller = TextEditingController();
  late bool isValue;
  String initialCountry = 'IR';
  String initNumber = "+98";
  String initHint = "9121234567";
  int minLength = 10;

  @override
  void initState() {
    isValue = true;
    _controller.addListener(() {
      if (_controller.value.text.length != minLength) {
        if (_controller.value.text.isNotEmpty) {
          setState(() {
            isValue = false;
            widget.hasError(isValue);
          });
        } else {
          setState(() {
            isValue = true;
            widget.hasError(isValue);
          });
        }
      } else {
        setState(() {
          isValue = true;
          widget.hasError(isValue);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          widget.lable != null ?Text(
            widget.lable!,
            style: TextStyle(
                color: isValue
                    ? AppColors.secondaryDarkColor
                    : AppColors.errorStateColor,
                fontWeight: FontWeight.w600),
          ) : Container(),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: widget.value != null
                      ? TextFormField(
                          textDirection: TextDirection.ltr,
                          keyboardType: widget.type,
                          maxLength: minLength,
                          onChanged: (value) {
                            widget.onChange(initNumber, value);
                          },
                          initialValue: widget.value,
                          cursorColor: AppColors.secondaryDarkColor,
                          cursorWidth: 1,
                          controller: _controller,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(fontSize: 0),
                              contentPadding: EdgeInsets.only(bottom: 3),
                              counter: SizedBox(
                                height: 0,
                              ),
                              border: InputBorder.none,
                              hintText: initHint,
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              hintTextDirection: TextDirection.ltr),
                        )
                      : TextFormField(
                          textDirection: TextDirection.ltr,
                          keyboardType: widget.type,
                          maxLength: minLength,
                          onChanged: (value) {
                            widget.onChange(initNumber, value);
                          },
                          cursorColor: AppColors.secondaryDarkColor,
                          cursorWidth: 1,
                          controller: _controller,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(fontSize: 0),
                              contentPadding: EdgeInsets.only(bottom: 3),
                              counter: SizedBox(
                                height: 0,
                              ),
                              border: InputBorder.none,
                              hintText: initHint,
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              hintTextDirection: TextDirection.ltr),
                        ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CountrySelection(onSelected: _onChange),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                                'assets/png100px/${initialCountry.toLowerCase()}.png'))
                      ],
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.inputBackgroundColor,
                borderRadius: Dimens.borderRadius,
                border: Border.all(
                  color: _controller.value.text.length == 0
                      ? AppColors.grey_6
                      : isValue
                          ? AppColors.successStateColor
                          : AppColors.errorStateColor,
                )),
            height: 48,
          ),
          Text(isValue ? widget.description : Strings.wrongPhoneNumber,
              style: TextStyle(
                  color: isValue ? AppColors.grey_3 : AppColors.errorStateColor,
                  fontSize: 12)),
        ]));
  }

  _onChange(CountryDto country) {
    setState(() {
      initialCountry = country.iso2_cc!;
      initNumber = "+${country.e164_cc!}";
      initHint = country.example!;
      minLength = country.example!.length;
    });
  }
}

class CountrySelection extends StatefulWidget {
  Function(CountryDto country) onSelected;
  CountrySelection({Key? key, required this.onSelected}) : super(key: key);

  @override
  _CountrySelectionState createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  late List<Map<String, dynamic>> _list;

  @override
  void initState() {
    _list = countryCodes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                child: SizedBox(
                  height: Dimens.height,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: AppColors.secondaryDarkColor,
                    cursorWidth: 1,
                    onChanged: _searchHandel,
                    style: TextStyle(
                        fontSize: 14,
                        height: 0.8,
                        color: AppColors.secondaryDarkColor),
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      filled: true,
                      fillColor: AppColors.inputBackgroundColor,
                      hintText: "کشور مورد نظر خود را انتخاب کنید ..",
                      hintStyle: TextStyle(
                        fontSize: 14,
                      ),
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: Dimens.borderRadius,
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: Dimens.borderRadius,
                          borderSide: BorderSide(
                            width: 1.5,
                            color: AppColors.secondaryDarkColor,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: Dimens.borderRadius,
                          borderSide: BorderSide(
                            width: 1.5,
                            color: AppColors.secondaryDarkColor,
                          )),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: Dimens.padding,
                      margin: Dimens.margin,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x10172A42),
                                blurRadius: 16,
                                offset: Offset(0, 6))
                          ]),
                      child: _listRender())),
              const SizedBox(
                height: 56,
              )
            ],
          ),
        ),
      ),
    );
  }

  _searchHandel(String value) {
    if (value.isEmpty) {
      setState(() {
        _list = countryCodes;
      });
      return;
    }

    String newValue =
        "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
    List<Map<String, dynamic>> newList = [];
    countryCodes.forEach((e) {
      var c = CountryDto.fromMap(e);
      if (c.name!.contains(newValue)) {
        newList.add(e);
      }
    });

    setState(() {
      _list = newList;
    });
  }

  Widget _listRender() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          CountryDto item = CountryDto.fromMap(_list[index]);
          return InkWell(
            onTap: () {
              widget.onSelected(item);
              Navigator.pop(context);
            },
            child: SizedBox(
              height: Dimens.height,
              child: ListTile(
                leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                        'assets/png100px/${item.iso2_cc!.toLowerCase()}.png')),
                title: Text(item.name!),
              ),
            ),
          );
        },
      ),
    );
  }
}
