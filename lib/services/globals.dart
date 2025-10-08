import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/connection.dart';

// Color MainColor = Color(0xFF5753F1);
const Map<String, Color> ColorList = {
  'main': Color(0xFF006167),
  'main-text': Colors.white,
  'main-second': Color(0xFF5753F1),
};
class ColorLists  {
  static Color main = Color(0xFF006167);
  static Color main_text = Colors.white;
  static Color main_second = Color(0xFF5753F1);
}

const Map<String, String> ImageList = {
  'profile_empty': 'https://www.gbtps.org/wp-content/uploads/2015/08/blank-avatar.png',
  'group_empty': 'https://www.gbtps.org/wp-content/uploads/2015/08/blank-avatar.png',
  'image_empty': 'https://www.gbtps.org/wp-content/uploads/2015/08/blank-avatar.png',
  'ad_1':'https://images.squarespace-cdn.com/content/v1/54ec2161e4b01dbc251cbdae/8109841b-663b-476b-beee-e72bd234ee95/best-ideas-For-Successful-Banner-Advertising-30.jpg',
};

String urlImgProfileEmpty = 'https://www.gbtps.org/wp-content/uploads/2015/08/blank-avatar.png';
String urlImgGroupEmpty = 'https://www.gbtps.org/wp-content/uploads/2015/08/blank-avatar.png';

class Convert{
  static String countToString(int value) {
    // final NumberFormat numberFormat = NumberFormat.decimalPattern('id');
    // if (value >= 1000 && value < 1100) {
    //   return numberFormat.format(value);
    // } else 
    if (value >= 1000000000) {
      double result = value / 1000000000;
      return result % 1 == 0 ? result.toStringAsFixed(0) + 'B' : result.toStringAsFixed(1) + 'B';
    }else if (value >= 1000000) {
      double result = value / 1000000;
      return result % 1 == 0 ? result.toStringAsFixed(0) + 'M' : result.toStringAsFixed(1) + 'M';
    } else if (value >= 1000) {
      double result = value / 1000;
      return result % 1 == 0 ? result.toStringAsFixed(0) + 'K' : result.toStringAsFixed(1) + 'K';
    } else {
      return value.toString();
    }
  }
}


////////////////////////////////////// Map Variable ////////////////////////////////////////
class ListUser {
  String id;
  String name;
  String image;
  ListUser({required this.id, required this.name, required this.image});
}

class ListRecommended {
  String uuid;
  String title;
  String image;
  ListRecommended({required this.uuid, required this.title, required this.image});
}

class ListGroupBroadcast {
  String channel_uuid;
  String name;
  String? image;
  bool verified;
  String? body;
  String? time;
  int count = 0;
  ListGroupBroadcast({required this.channel_uuid, required this.name, required this.image, this.verified = false, this.body, this.time, required this.count });
}

class ListChannel {
  String uuid;
  String code;
  String name;

  int? group_id;
  String? group_name;
  String? group_photo;
  String? description;
  String? photo;

  bool private;
  bool verified;
  bool following;

  ListChannel({
    required this.uuid, 
    required this.code,
    required this.name,
    this.group_id,
    this.group_name,
    this.group_photo,
    this.description,
    this.photo,
    required this.private,
    required this.verified,
    required this.following,
  });
}


class ListChannelPost {
  int id;
  String? posted_type;
  String? posted_id;
  String? posted_name;
  String? posted_photo;
  String? title;
  String? body;
  String? body_image;
  String? body_link;
  String? body_document;
  String created_at; 
  String updated_at; 

  ListChannelPost({
    required this.id, 
    this.posted_type,
    this.posted_id,
    this.posted_name,
    this.posted_photo,
    this.title,
    this.body,
    this.body_image,
    this.body_link,
    this.body_document,
    required this.created_at,
    required this.updated_at,
  });
}


String formatDatetimeToReadeble(String dateTimeString) {
  DateTime dateTimeUTC = DateTime.parse(dateTimeString);
  DateTime dateTime = dateTimeUTC.toLocal();
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime yesterday = today.subtract(const Duration(days: 1));

  if (dateTime.isAfter(today)) {
    // Jika hari ini, tampilkan jam
    return DateFormat('HH:mm').format(dateTime);
  } else if (dateTime.isAfter(yesterday)) {
    // Jika kemarin, tampilkan 'Yesterday'
    return 'Yesterday';
  } else {
    // Jika lebih lama, tampilkan format tanggal
    return DateFormat('dd/MM/yy').format(dateTime);
  }
}



class ShowToast{
  static void info(String message){
    Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 14.0
          );
  }
  static void error(String message){
    Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 14.0
          );
  }
}

class ShowMessage{
  static void show(BuildContext context, String msg, {Color? color = Colors.green}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ),
    );
  }
  static void error(BuildContext context, String msg, {Color? color = Colors.red}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ),
    );
  }
}

ConnectionService Backend = ConnectionService();

// class BackendA extends ConnectionService{
//   static bool Checks(Response? response){
//     switch (response?.statusCode) {
//       case 200:
//         return true;
//       case 401:
//         ShowToast.error("Can't access this channel");
//         break;
//       case null:
//         ShowToast.error("Check your connection!");
//         break;
//       default:
//         ShowToast.error("Something wrong");
//     }
//     return false;
//   }
// }