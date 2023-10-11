extension StringDateParsing on String {
  String timeAgoSinceNow() {
    DateTime date = DateTime.parse(this); // "2023-09-20T23:48:08" 형식을 DateTime으로 파싱
    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(date);

    if (difference.inMinutes < 1) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else {
      return "${difference.inDays} days ago";
    }
  }
}
