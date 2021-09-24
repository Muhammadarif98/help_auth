import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dialog_card.dart';
import 'data/countries.dart';

class PhoneFieldModule extends StatefulWidget {
  const PhoneFieldModule({
    this.initialCountryCode,
    this.keyboardType = TextInputType.number,
    this.decoration,
    this.textStyle,
    this.validator,
    required this.onChange,
  });

  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialCountryCode;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final void Function(String number) onChange;

  @override
  _PhoneFieldModuleState createState() => _PhoneFieldModuleState();
}

class _PhoneFieldModuleState extends State<PhoneFieldModule> {
  late List<Map<String, dynamic>> _countryList;
  late Map<String, dynamic> _selectedCountry;

  final InputDecoration _decoration = InputDecoration(
    isCollapsed: true,
    border: InputBorder.none,
    counterText: '',
    hintText: '',
  );

  void setCountry(int index) {
    setState(() => _selectedCountry = _countryList[index]);
    Navigator.pop(context);
  }

  @override
  void initState() {
    _countryList = countries;
    _selectedCountry = _countryList.firstWhere(
      (item) => item['code'] == (widget.initialCountryCode ?? 'US'),
      orElse: () => _countryList.first,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFlagsButton(),
          _divider(),
          _inputField(),
        ],
      ),
    );
  }

  Widget _buildFlagsButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => _PickerDialog(
          onPressed: (index) => setCountry(index),
          countryList: _countryList,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            FittedBox(
              child: Text(
                '+${_selectedCountry['dial_code']}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.only(left: 21, right: 24),
      height: 33,
      child: const VerticalDivider(thickness: 1),
    );
  }

  Widget _inputField() {
    return Expanded(
      child: TextFormField(
        onChanged: (value) {
          final _countryCode = _selectedCountry['dial_code'].toString();

          widget.onChange('+$_countryCode$value');
        },
        style: widget.textStyle,
        maxLength: _selectedCountry['max_length'],
        keyboardType: TextInputType.phone,
        // controller: widget.controller,
        decoration: widget.decoration ?? _decoration,
      ),
    );
  }
}

class _PickerDialog extends StatelessWidget {
  const _PickerDialog(
      {Key? key, required this.countryList, required this.onPressed})
      : super(key: key);

  final List<Map<String, dynamic>> countryList;
  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      height: 500,
      width: double.infinity,
      child: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (context, index) {
          final item = countryList[index];

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onPressed(index),
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['name'],
                      //style: bodyTextStyle1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '+${item['dial_code']}',
                    //style: bodyTextStyle1,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
