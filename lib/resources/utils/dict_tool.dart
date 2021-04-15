/*

// import 'package:english_ron/resources/strings.dart';
// import 'package:english_ron/resources/theme.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
// import 'package:string_validator/string_validator.dart';

String formatResult(String result,  String searchKey)
{
  return toViewFormatCss(splitResult(result, searchKey), searchKey) ;
  //return toViewFormatHtml(splitResult(result), searchKey);
}

 formatResultWidget(String result,  String searchKey)
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: toViewFormatWidget(splitResult(result, searchKey), searchKey)

  );
  //return toViewFormatWidget(splitResult(result), searchKey) ;
  //return toViewFormatHtml(splitResult(result), searchKey);
}

formatResultWidgetInSmartTranslation(String result,  String searchKey)
{
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: toViewFormatWidgetInSmartTranslation(splitResult(result, searchKey), searchKey)

  );
  //return toViewFormatWidget(splitResult(result), searchKey) ;
  //return toViewFormatHtml(splitResult(result), searchKey);
}//

formatResultWidgetOnlymeaning(String result,  String searchKey)
{
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: toViewFormatWidgetOnlyMeaning(splitResult(result, searchKey), searchKey)

  );
  //return toViewFormatWidget(splitResult(result), searchKey) ;
  //return toViewFormatHtml(splitResult(result), searchKey);
}//
List<Widget> toViewFormatWidgetOnlyMeaning(List<String> strings, String searchKey)
{

  List<Widget> list = [];
  for (String string in strings) {
    if (string.length > 0) {
      switch (string[0]) {

        case '@':
          if (!(searchKey == (string.substring(1).trim()))) {

            list.add ( Container());


          }
          break;

        case '-':
          list.add (Text( string ,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
            textAlign: TextAlign.left,));
          break;
        case '/':
          if (string.length > 1) {

            list.add ( Container());

          }
          break;


        case '*':
          list.add (Text(string.substring(2),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.bold,
                color: Color(0xffb71c1c)
            ),));

          break;
        case '^':
          list.add (Text(  string.substring(1),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.bold,
                color: Color(0xff3f51b5)
            ),));

          break;
        case '=':

          if (isAlpha(string[1])) {
            list.add (Text( string.substring(1),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  color: Color(0xff607d8b),
                  fontStyle: FontStyle.italic
              ),));

          } else {
            list.add (Text( string,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.left,),
            );
          }
          break;
        case '+':
          list.add (Text( "->" + string.substring(1),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff607d8b),
                fontFamily: AppTheme.fontName,
                fontStyle: FontStyle.italic
            ),));

          break;
        default:
          list.add (Text(string,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
            textAlign: TextAlign.left,));
          break;
      }
    }
  }
  return list;

}
///
///
List<Widget> toViewFormatWidgetInSmartTranslation(List<String> strings, String searchKey)
{

  List<Widget> list = [];
  for (String string in strings) {
    if (string.length > 0) {
      switch (string[0]) {

        case '@':
          if (!(searchKey == (string.substring(1).trim()))) {

            list.add ( Text( string.substring(1) ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.left,));


          }
          break;

        case '-':
          list.add (Text( string ,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
            textAlign: TextAlign.left,));
          break;
        case '/':
          if (string.length > 1) {

            list.add (Text( string + "/" ,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontStyle: FontStyle.italic
              ),));

          }
          break;


        case '*':
          list.add (Text(string.substring(2),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.bold,
                color: Color(0xffb71c1c)
            ),));

          break;
        case '^':
          list.add (Text(  string.substring(1),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.bold,
                color: Color(0xff3f51b5)
            ),));

          break;
        case '=':

          if (isAlpha(string[1])) {
            list.add (Text( string.substring(1),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  color: Color(0xff607d8b),
                  fontStyle: FontStyle.italic
              ),));

          } else {
            list.add (Text( string,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.left,),
            );
          }
          break;
        case '+':
          list.add (Text( "->" + string.substring(1),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff607d8b),
                fontFamily: AppTheme.fontName,
                fontStyle: FontStyle.italic
            ),));

          break;
        default:
          list.add (Text(string,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
            textAlign: TextAlign.left,));
          break;
      }
    }
  }
  return list;

}
///

List<Widget> toViewFormatWidget(List<String> strings, String searchKey)
{

  List<Widget> list = [];
  for (String string in strings) {
    if (string.length > 0) {
      switch (string[0]) {

        case '@':
          if (searchKey == (string.substring(1).trim())) {
            list.add (Text(searchKey + "\n" ,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.left,));


          } else {
            list.add ( Text( "\n"+string.substring(1) ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.left,));
          }
          break;

        case '-':
          list.add (Text( string ,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
            textAlign: TextAlign.left,));
          break;
        case '/':
          if (string.length > 1) {

            list.add (Text( string + "/" + "\n",
              textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
              fontStyle: FontStyle.italic
            ),));

          }
          break;
        case '*':
          list.add (Text(string.substring(2),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.bold,
                color: Color(0xffb71c1c)
            ),));

          break;
        case '^':
          list.add (Text(  string.substring(1),
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.bold,
                color: Color(0xff3f51b5)
            ),));

          break;
        case '=':

          if (isAlpha(string[1])) {
            list.add (Text( string.substring(1),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  color: Color(0xff607d8b),
                  fontStyle: FontStyle.italic
              ),));

          } else {
            list.add (Text( string,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.left,),
            );
          }
          break;
        case '+':
          list.add (Text( "->" + string.substring(1),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff607d8b),
                fontFamily: AppTheme.fontName,
                fontStyle: FontStyle.italic
            ),));

          break;
        default:
          list.add (Text(string,
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
            textAlign: TextAlign.left,));
          break;
      }
    }
  }
  return list;

}

String toViewFormatCss(List<String> strings, String searchKey)
{
  String returnString = "<body>";
  for (String string in strings) {
    if (string.length > 0) {
      switch (string[0]) {
        case '@':
          if (searchKey == (string.substring(1).trim())) {
            returnString += "<p style = 'font-family:RobotoBlack;font-size:1em'>" + string.substring(1).toUpperCase() + "</p>";
          } else {
            returnString += "<br/><br/><p style = 'font-family:RobotoBlack;font-size:1em'>" + string.substring(1).toUpperCase() + "</p>";
          }
          break;
        case '-':
          returnString += "<br/>" + "<p style = 'font-family:RobotoBlack;font-size:1em'>" +string+"</p>";
          break;
        case '/':
          if (string.length > 1) {
            returnString += "<br/><p style='font-family:RobotoBlack;font-size:1em; font-style:italic' >" + string + "</p>";
          }
          break;
        case '*':
          returnString += "<br/><p style='font-family:RobotoBlack;font-size:1em;color:#b71c1c'>" + string.substring(2) + "</p>";
          break;
        case '^':
          returnString += "<br/><p style='font-family:RobotoBlack;font-size:1em; color:#3f51b5'>" + string.substring(1) + "</p>";
          break;
        case '=':

          if (isAlpha(string[1])) {
            returnString += "<br/><p style='font-family:RobotoBlack;font-size:1em; font-style:italic ;color:#607d8b'>" + string.substring(1) + "</p>";
          } else {
            returnString += "<p style = 'font-family:RobotoBlack;font-size:1em'>" +string+"</p>";
          }
          break;
        case '+':
          returnString += "<br/><p style = 'font-family:RobotoBlack;font-size:1em; font-style:italic ;color:#607d8b'>" + "->" + string.substring(1) + "</p>";
          break;
        default:
          returnString += "<p style = 'font-family:RobotoBlack;font-size:1em'>" +string+"</p>";
          break;
      }
    }
  }
  return returnString + "</body>";

}

String toViewFormatHtml(List<String> strings, String searchKey)
{
  String returnString = "";
  for (String string in strings) {
    if (string.length > 0) {
      switch (string[0]) {
        case '@':
          if (searchKey == (string.substring(1).trim())) {
            returnString += "<b>" + string.substring(1).toUpperCase() + "</b>";
          } else {
            returnString += "<br/><br/><b>" + string.substring(1).toUpperCase() + "</b>";
          }
          break;
        case '-':
          returnString += "<br/>" + string;
          break;
        case '/':
          if (string.length > 1) {
            returnString += "<br/><i>" + string + "/</i>";
          }
          break;
        case '*':
          returnString += "<br/><b><font color='#b71c1c'>" + string.substring(2) + "</font></b>";
          break;
        case '^':
          returnString += "<br/><font color='#3f51b5'><b>" + string.substring(1) + "</b></font>";
          break;
        case '=':

          if (isAlpha(string[1])) {
           returnString += "<br/><font color='#607d8b'><i>" + string.substring(1) + "</i></font>";
          } else {
            returnString += string;
          }
          break;
        case '+':
          returnString += "<br/><font color = '#607d8b'></i>->" + string.substring(1) + "</i></font>";
          break;
        default:
          returnString += string;
          break;
      }
    }
  }
  return returnString;

}

List<String> splitResult(String value, String word)
{
  // Split but hold Character : value.split(new RegExp(r'(?=\@)')); Ex: LoveYou@Sarha ==> ['LoveYou', '@Sarha']
  List<String> at = value.split(new RegExp(r'(?=\@)'));
  List<String> al = new List<String>();
  for (String tmpAt in at) {
   /// Convert Word(-) into Word(+)
    tmpAt = convertSplitCharacter(originalWord: word, stringNeedCheck: tmpAt, splitCharacter: "-", replacedSplitCharacter: "+") ;
    //print(word);
    //print(tmpAt);


    List<String> hyphen = tmpAt.split(new RegExp(r'(?=\-)'));


        for (String tmpHyphen in hyphen) {

          tmpHyphen = revertSplitCharacter(originalWord: word, stringNeedCheck: tmpHyphen, splitCharacter: "-", replacedSplitCharacter: "+") ;


          List<String> slash = tmpHyphen.split(new RegExp(r'(?=\/)'));
          for (String tmpSlash in slash) {
            List<String> equals = tmpSlash.split(new RegExp(r'(?=\=)'));
            for (String tmpEquals in equals) {
              List<String> plusSign = tmpEquals.split(new RegExp(r'(?=\+)'));
              for (String tmpPlusSign in plusSign) {
                List<String> asterisk = tmpPlusSign.split(
                    new RegExp(r'(?=\*)'));

                for (String tmpAsterisk in asterisk) {
                  //print(tmpAsterisk);
                  int n;
                  int pos = 0;
                  String x = tmpAsterisk;
                  while ((n = x.indexOf('!')) != -1) {
                    if (tmpAsterisk.length > n + pos + 1) {
                      if ((isAlpha(tmpAsterisk[n + pos + 1])) ||
                          (tmpAsterisk[n + pos + 1] == '[')) {
                        tmpAsterisk =
                            tmpAsterisk.substring(0, n + pos) + '^' +
                                tmpAsterisk.substring(n + pos + 1);
                      }
                    }
                    x = x.substring(n + 1);
                    pos += n + 1;
                  }
                  List<String> caret = tmpAsterisk.split(
                      new RegExp(r'(?=\^)'));
                  // al.addAll(caret);
                  for (String tmpCaret in caret) {
                    //print(tmpCaret);
                    al.add(tmpCaret);
                  }
                }
              }
            }
          }
        }

  }
  return al;

}

/// Convert all orignalWord to another
convertSplitCharacter({@required String originalWord,
  @required String stringNeedCheck,
  @required String splitCharacter,
  @required String replacedSplitCharacter})
{
  String tempString = stringNeedCheck;
  String tempStringItem = originalWord.replaceAll(splitCharacter, replacedSplitCharacter);
  tempString = tempString.replaceAll(originalWord, tempStringItem);

  return tempString;
}

/// Convert all orignalWord to another
revertSplitCharacter({@required String originalWord,
  @required String stringNeedCheck,
  @required String splitCharacter,
  @required String replacedSplitCharacter})
{
  String tempString = stringNeedCheck;
  String tempStringItem = originalWord.replaceAll(splitCharacter, replacedSplitCharacter);
  tempString = tempString.replaceAll(tempStringItem, originalWord);

  return tempString;
}*/
