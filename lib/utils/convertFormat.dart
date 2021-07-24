import 'package:intl/intl.dart';
import 'dart:math';

class ConvertFormat {
  static mdy2ymd(String date){
    final arr = date.split('/');
    final ymdDate = (arr[2]+"-"+arr[0]+"-"+arr[1]);

    return DateFormat('yyyy-MM-dd').format(DateTime.parse(ymdDate));
  }

  static datetime(DateTime date){
    return  DateFormat('yyyy/MM/dd h:mm a') .format(date).toString();
  }

  static currency(int number){
    final numberFomart = NumberFormat("#,###", "pt");
    
    return numberFomart.format(number);
  }

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";

    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }
}