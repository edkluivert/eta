import 'package:eta/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WordCard extends StatelessWidget{
  
  final String word;
  final String speechPart;
  final String definition;
  
  const WordCard({Key? key, required this.word, required this.speechPart, required this.definition}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 280.h,
      decoration: BoxDecoration(
        color : primaryColor,
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(word, style: GoogleFonts.poppins(
                    fontSize: 35.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 20.w,),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: SvgPicture.asset('assets/icons/volume.svg', width: 20.w, height: 20.h,),
                    ),
                  ),
                ),
              ],
            ),
            Text(speechPart, style: GoogleFonts.poppins(
              fontSize: 18.sp,
              color: pinkColor,
              fontWeight: FontWeight.w500
            ),

            ),
            SizedBox(height: 20.h,),
            Text(definition, style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: darkerGrey,
                fontWeight: FontWeight.w400
            ),

            ),
          ],
        ),
      ),
    );
  }
  
}