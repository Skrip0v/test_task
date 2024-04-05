import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_svg/svg.dart';

class AuthPhoneInputWidget extends StatelessWidget {
  const AuthPhoneInputWidget({
    super.key,
    required this.controller,
    this.focus,
  });
  final TextEditingController controller;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focus,
      onTapOutside: (event) {
        focus?.unfocus();
      },
      keyboardType: TextInputType.phone,
      autocorrect: false,
      inputFormatters: [
        MaskedInputFormatter('+# (###) ### ## ##'),
      ],
      style: const TextStyle(
        color: Colors.black,
        fontSize: 19,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: '+0 (000) 000 000',
        prefixIcon: SizedBox(
          width: 0,
          child: Center(
            child: SvgPicture.asset('assets/icons/phone.svg'),
          ),
        ),
        hintStyle: const TextStyle(
          color: Color.fromARGB(120, 123, 128, 154),
          fontSize: 19,
          fontWeight: FontWeight.w400,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFA73AFD),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFA73AFD),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFA73AFD),
          ),
        ),
      ),
    );
  }
}
