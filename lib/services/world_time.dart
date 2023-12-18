import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  final String location;
  late String time;
  final String flag;
  final String url;
  late bool isDayTime;

  WorldTime(this.url, this.location, this.flag);

  Future<void> getTime() async {
    try {
      String uri = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 4 && now.hour < 19 ? true : false;
    } catch (e) {
      print('Error catch: $e');
      time = 'cound not to get time.';
    }
  }
}
