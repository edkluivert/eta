import 'dart:ui';
import 'package:eta/config/constants.dart';
import 'package:eta/config/palette.dart';
import 'package:eta/config/resources.dart';
import 'package:eta/ui/controller/home_controller.dart';
import 'package:eta/ui/screens/home_screen/components/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';



class Body extends GetView<HomeController>{
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 150.h,),
            Center(
              child: Container(
                color: Colors.transparent,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur( sigmaY: 20,sigmaX: 20),
                  child:Image.asset('assets/images/hiring.png', width: 250.w, height: 150.h,
                    // fit: BoxFit.cover
                  ),
                ),
              ),
            ) ,
            SizedBox(height: 50.h,),
            Center(
              child: Text(appTitleText, style: GoogleFonts.poppins(
                fontSize: 35.sp,
                color: primaryColor,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Padding(
                padding : EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(appInfoText, style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: ashColor,
                    fontWeight: FontWeight.w500
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 70.h,),
             controller.obx((data)
             => WordCard(word: data!),
            onLoading: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              //enabled: true,
              child: Container(
                width: 380.w,
                height: 280.h,
                decoration: BoxDecoration(
                    color : primaryColor,
                    borderRadius: BorderRadius.circular(10.r)
                ),
              ),
            ),
            onError: (error)=>Text(error.toString(), style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),)
             )
          ],
        ),
      ),
    );
  }

}