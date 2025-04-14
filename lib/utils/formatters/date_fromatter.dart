import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatters {
  // Private constructor
  DateFormatters._privateConstructor();

  // Singleton instance variable
  static DateFormatters? _instance;

  //This code ensures that the singleton instance is created only when it's accessed for the first time.
  //Subsequent calls to DateFormatters.instance will return the same instance that was created before.

  // Getter to access the singleton instance
  static DateFormatters get instance {
    _instance ??= DateFormatters._privateConstructor();
    return _instance!;
  }

  //get date in mm/yyyy format
  String mmYYYYFormat({required DateTime date}) {
    String _formattedDate = DateFormat('MM/yyyy').format(date);
    return _formattedDate;
  }

  //get date in mm/yyyy format
  String formatStringDate({required String dateString}) {
    String _formattedDate = "";

    DateTime? date = convertStringIntoDateTime(dateString);

    if (date != null) {
      _formattedDate = DateFormat('dd-MM-yyyy').format(date);
    }

    return _formattedDate;
  }

  //get date in mm/yyyy format
  String formatStringDateRev({required String dateString}) {
    String _formattedDate = "";

    DateTime? date = convertStringIntoDateTime(dateString);

    if (date != null) {
      _formattedDate = DateFormat('yyyy-MM-dd').format(date);
    }

    return _formattedDate;
  }

  //method to get time ago
  //just pass the datetime object from which you want to get the time difference
  String getTimeAgo({required DateTime date}) {
    return timeago.format(date);
  }

  //method to get time difference in seconds (between two dateTime objects)
  int getTimeDifferenceInSec({required DateTime start, required DateTime end}) {
    Duration difference = end.difference(start);
    return difference.inSeconds;
  }

  //method to convert seconds into hours
  String convertSecondsToHours(double seconds) {
    double hours = seconds / 3600;
    return hours.toStringAsFixed(2);
  }

  //method to convert string into dateTime object
  DateTime? convertStringIntoDateTime(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);

      return dateTime;
    } catch (e) {
      return null;
    }
  }

  String formatTimeAsAmPm(DateTime date) {
    // Return formatted time
    return DateFormat.jm().format(date);
  }

  String formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  String getFormattedDuration(int duration) {
    if (duration < 60) {
      // Less than a minute, show in seconds
      return "$duration sec";
    } else if (duration < 3600) {
      // Less than an hour, show in minutes and seconds
      int minutes = duration ~/ 60;
      int seconds = duration % 60;
      return "$minutes min ${seconds > 0 ? '$seconds sec' : ''}".trim();
    } else {
      // One hour or more, show in hours, minutes
      int hours = duration ~/ 3600;
      int minutes = (duration % 3600) ~/ 60;
      return "$hours hr ${minutes > 0 ? '$minutes min' : ''}".trim();
    }
  }

  formatmmmmyyyy(DateTime dateTime) {
    return DateFormat("MMMM, yyyy").format(dateTime);
  }

  String getFormatDD(DateTime date) {
    return DateFormat('dd').format(date);
  }

  String getFormatMMM(DateTime date) {
    return DateFormat('MMM').format(date);
  }

  String getFormatEEEEMMMMddyyyy(DateTime date) {
    return DateFormat('EEEE, MMMM dd, yyyy').format(date);
  }

  String getFormatddMMMyyyy(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }

  String getFormatddMMMyyyyRange(DateTime date1, DateTime date2) {
    return '${DateFormat('dd MMM yyyy').format(date1)} - ${DateFormat('dd MMM yyyy').format(date2)}';
  }

  String getFormatddMMMyyyyHHmma(DateTime date) {
    return '${DateFormat('dd MMM yyyy | HH:mm a').format(date)}';
  }
}
