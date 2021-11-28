import 'dart:convert';

import 'package:eta/config/constants.dart';
import 'package:eta/config/palette.dart';
import 'package:eta/models/word.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


var now = DateTime.now();
var formatter = DateFormat('yyyy-MM-dd');
String today = formatter.format(now);

final String urlKey = 'https://api.wordnik.com/v4/words.json/wordOfTheDay?date=' +
    today +
    '&api_key=' +
    apiKey;


var url = Uri.parse(urlKey);

Future<Word> fetchWord() async {
  final response = await http.get(url);

  if (response.statusCode == 200) {

    return Word.fromJson(json.decode(response.body));
  } else {

    throw Exception('Failed to load word.');
  }
}


class WordCard extends StatefulWidget {
  const WordCard({Key? key}) : super(key: key);


  @override
  _WordCard createState() => _WordCard();

}

class _WordCard extends State<WordCard>{

  late Future<Word> futureWord;
  @override
  void initState() {
    super.initState();
    futureWord = fetchWord();
  }

  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 280.h,
      decoration: BoxDecoration(
          color : primaryColor,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 20.w),
        child:  FutureBuilder<Word>(
        future: futureWord,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( '${snapshot.data!.word[0].toUpperCase()}${snapshot.data!.word.substring(1)}', style: GoogleFonts.poppins(
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
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/volume.svg', width: 20.w, height: 20.h,),
                    ),
                  ),
                ),
              ],
            ),
            Text(snapshot.data!.definitions[0].partOfSpeech, style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: pinkColor,
                fontWeight: FontWeight.w500
            ),

            ),
            SizedBox(height: 20.h,),
            Text( snapshot.data!.definitions[0].text, style: GoogleFonts.poppins(
                fontSize: 18.sp,
                color: darkerGrey,
                fontWeight: FontWeight.w400
            ),

            ),
          ],
        );
      }else if (snapshot.hasError) {
      return const Text('Could not fetch word of the day :(');
      } return const Center(
      child: CircularProgressIndicator(),
      );
    }
        )
      ),
    );
  }

}

