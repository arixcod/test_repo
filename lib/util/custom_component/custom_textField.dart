import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textField(
    {required String label,
      required controller,
      required validate,
      inputType = TextInputType.text,
      maxLength = null}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validate,
        controller: controller,
        // onChanged: (val){controller.text=val.trim();},
        keyboardType: inputType,
        maxLength: maxLength,
        cursorColor: Colors.grey.shade400,
        style:
        GoogleFonts.poppins().copyWith(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          //isDense: false,
          // isCollapsed: false,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          label: Text(
            label,
            style: GoogleFonts.poppins().copyWith(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500),
          ),
          counterText: '',
          border: InputBorder.none,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
        ),
      ),
    );