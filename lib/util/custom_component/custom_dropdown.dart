import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
class CustomDropdown extends StatelessWidget {
  final String lable;
  final List<String> dataList;
  var onTap;
  var validate;
  String? initialValue;

  CustomDropdown({
    Key? key,
    required this.lable,
    required this.dataList,
    required this.onTap, required this.validate,this.initialValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:validate,
      //  iconEnabledColor: Colors.red,
      icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey,),
      value: initialValue,
      onChanged: onTap,
      items: dataList.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: GoogleFonts.poppins(),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        label: Text(lable,style: GoogleFonts.poppins().copyWith(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500),),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border:outlineBorder,
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red,width: 1)),
      ),
    );
  }
}


