import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jedmgr/core/themes/theme_colors.dart';

import '../themes/theme.dart';

CustomTheme currentTheme = CustomTheme();
String baseUrl = "https://jedbat.com/api/v1";

const profilePHOTO =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6TaCLCqU4K0ieF27ayjl51NmitWaJAh_X0r1rLX4gMvOe0MDaYw&s';
const adminId = 'LNXzA3WdsrNuXs4PBNLiiBQkypF2';

successToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

errorToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

warningToastMessage({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.yellow,
      textColor: Colors.white,
      fontSize: 16.0);
}

bool validateForm(String accountNO, String name, String address,
    String lastPaymentDate, String band, String lastPaymentAmount) {
  if (name.isEmpty) {
    errorToastMessage(msg: 'name cannot be empty');
    return false;
  } else if (accountNO.isEmpty) {
    errorToastMessage(msg: 'account no cannot be empty');
    return false;
  } else if (lastPaymentDate.isEmpty) {
    errorToastMessage(msg: 'last payment date cannot be empty');
    return false;
  } else if (lastPaymentAmount.isEmpty) {
    errorToastMessage(msg: 'Last amount payed cannot be empty');
    return false;
  } else if (int.parse(lastPaymentAmount).isNaN) {
    errorToastMessage(msg: 'Last amount payed must be a number');
    return false;
  } else if (band.isEmpty) {
    errorToastMessage(msg: 'band cannot be empty');
    return false;
  } else if (address.isEmpty) {
    errorToastMessage(msg: 'address cannot be empty');
    return false;
  } else {
    return true;
  }
}

bool validateProfileEdit(
  String email,
  String name,
  String country,
  String dialCode,
  String code,
  String phone,
  String bio,
) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'email cannot be empty');
    return false;
  } else if (!email.contains('.')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (bio.isEmpty) {
    errorToastMessage(msg: 'Bio Cannot be Empty');
    return false;
  } else if (!email.contains('@')) {
    errorToastMessage(msg: 'invalid email id, @ is missing');
    return false;
  } else if (name.isEmpty) {
    errorToastMessage(msg: 'name cannot be empty');
    return false;
  } else if (country.isEmpty) {
    errorToastMessage(msg: 'country not selected');
    return false;
  } else if (phone.isEmpty) {
    errorToastMessage(msg: 'phone number cannot be empty');
    return false;
  } else if (code.isEmpty) {
    errorToastMessage(msg: 'country code is empty, please select again');
    return false;
  } else {
    return true;
  }
}

bool validatePhoneDescription(
  String phone,
  String description,
) {
  if (description.isEmpty) {
    errorToastMessage(msg: 'Description Cannot be Empty');
    return false;
  } else if (phone.isEmpty) {
    errorToastMessage(msg: 'phone number cannot be empty');
    return false;
  } else {
    return true;
  }
}

bool validatePhoneAddress(
  String phone,
  String address,
  String vendingDate,
  String serialNo,
) {
  if (address.isEmpty) {
    errorToastMessage(msg: 'Description Cannot be Empty');
    return false;
  } else if (phone.isEmpty) {
    errorToastMessage(msg: 'Address cannot be empty');
    return false;
  } else if (vendingDate.isEmpty) {
    errorToastMessage(msg: 'Vending date cannot be empty');
    return false;
  } else if (serialNo.isEmpty) {
    errorToastMessage(msg: 'Serial Number cannot be empty');
    return false;
  } else {
    return true;
  }
}

bool validateLogin(String email, String password) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'username cannot be empty');
    return false;
  } else if (password.isEmpty || password.length < 8) {
    errorToastMessage(msg: 'provide a password please');
    return false;
  } else {
    return true;
  }
}

bool validateEmail(String email) {
  if (email.isEmpty) {
    errorToastMessage(msg: 'email cannot be empty');
    return false;
  } else if (!email.contains('.')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else if (!email.contains('@')) {
    errorToastMessage(msg: 'invalid email id');
    return false;
  } else {
    return true;
  }
}

class Constants {
  Constants._();
  static const double padding = 10;
  static const double avatarRadius = 45;
}

const apiKey = 'AIzaSyBwtUGqZTCqrko-e6KCo2S1bGQsraAkmOQ';

List<String> eventTypes = ["Video Event", "Picture Event"];
List<String> questionCategory = ["Community", "Agree With Me", "Testimony"];

final createdAt = DateTime.now().toUtc().toString();

int getLikeCount(likes) {
  // if no likes, return 0
  if (likes == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  likes.values.forEach((val) {
    if (val == true) {
      count += 1;
    }
  });
  return count;
}

int getViews(views) {
  // if no likes, return 0
  if (views == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  views.values.forEach((val) {
    if (val == true) {
      count += 1;
    }
  });
  return count;
}

String getCount(int count) {
  String _stPosts = "0";
  double _dbPosts = 0.0;

  if (count < 1000) {
    _stPosts = count.toString() + " ";
  } else if (count >= 1000 && count < 1000000) {
    _dbPosts = count / 1000;
    _stPosts = _dbPosts.toStringAsFixed(1) + "K";
  } else if (count >= 1000000 && count < 1000000000) {
    _dbPosts = count / 1000000;
    _stPosts = _dbPosts.toStringAsFixed(1) + "M";
  } else {
    _dbPosts = count / 1000000000;
    _stPosts = _dbPosts.toStringAsFixed(1) + "B";
  }
  return _stPosts;
}

int getCommentCount(comments) {
  // if no likes, return 0
  if (comments == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  comments.values.forEach((val) {
    if (val == true) {
      count += 1;
    }
  });
  return count;
}

int getFollowingCount(comments) {
  // if no likes, return 0
  if (comments == null) {
    return 0;
  }
  int count = 0;
  // if the key is explicitly set to true, add a like
  comments.values.forEach((val) {
    count += 1;
  });
  return count;
}

String getTimestamp(String date) {
  String msg = '';
  var dt = DateTime.parse(date).toLocal();

  if (DateTime.now().toLocal().isBefore(dt)) {
    return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
  }

  var dur = DateTime.now().toLocal().difference(dt);
  if (dur.inDays > 0) {
    msg = '${dur.inDays} days ago';
    return dur.inDays == 1 ? '1d ago' : DateFormat("dd MMM").format(dt);
  } else if (dur.inHours > 0) {
    msg = '${dur.inHours} hrs ago';
  } else if (dur.inMinutes > 0) {
    msg = '${dur.inMinutes} m ago';
  } else if (dur.inSeconds > 0) {
    msg = '${dur.inSeconds} s ago';
  } else {
    msg = 'now';
  }
  return msg;
}

String? getDateTime(String? date) {
  if (date == null) {
    return null;
  } else {
    return DateFormat.yMMMMEEEEd()
        .format(DateTime.parse(date).toLocal())
        .toString();
  }
}

String? getTime(String? date) {
  if (date == null) {
    return null;
  } else {
    return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
  }
}

dynamic fromDateTimeToJson(DateTime date) {
  return date.toUtc();
}

showDownloadProgress(received, total) {
  if (total != -1) {
    //print((received / total * 100).toStringAsFixed(0) + "%");
  }
}

Future download2(Dio dio, String url, String savePath) async {
  try {
    Response response = await dio.get(
      url,
      onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    //print(response.headers);
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.write);
    // response.data is List<int> type
    raf.writeFromSync(response.data);
    await raf.close();
  } catch (e) {
    //print(e);
  }
}

Color getStyleColor(String style) {
  if (style == 'red') {
    return ThemeColors.redColor;
  } else if (style == 'green') {
    return ThemeColors.greenColor;
  } else if (style == 'ash') {
    return ThemeColors.ashColor;
  } else if (style == 'blue') {
    return ThemeColors.blueColor;
  } else if (style == 'orange') {
    return ThemeColors.orangeColor;
  } else if (style == 'yellow') {
    return ThemeColors.yellowColor;
  } else {
    return ThemeColors.blueColor;
  }
}
