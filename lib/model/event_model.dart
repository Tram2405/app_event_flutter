import 'package:app_event_flutter/model/category_model.dart';

class EventModel{
  int? id;
  String? title;
  String? date;
  String? avt;
  CategoryModel? category;
  Status? status;
  EventModel();
  bool? isCheck;
}

enum Status{
  yes, no, maybe
}

List<EventModel> events = [
  EventModel()..id = 1 ..title = 'Heniken Countdown Party'..date = '1969-07-20T20:18:04' ..avt = 'assets/images/avt2.jpg'..category = Categories[1]..status = Status.maybe,
  EventModel()..id = 2 ..title = 'Heniken Countdown Party' ..date = '1969-07-22T20:15:04'..avt = 'assets/images/avt3.jpg' ..category = Categories[2]..status = Status.maybe,
  EventModel()..id = 3 ..title =  'Heniken Countdown Party' ..date = '1969-10-14T14:18:30'..avt = 'assets/images/avt4.jpg'..category = Categories[3]..status = Status.no,
  EventModel()..id = 4 ..title = 'Heniken Countdown Party'..date = '1969-10-24T20:01:04' ..avt = 'assets/images/avt2.jpg'..category = Categories[4]..status = Status.yes,
  EventModel()..id = 5 ..title = 'Heniken Countdown Party' ..date = '1969-12-29T24:12:04'..avt = 'assets/images/avt3.jpg' ..category = Categories[5]..status = Status.maybe,
  EventModel()..id = 6 ..title =  'Heniken Countdown Party' ..date = '1969-12-30T20:20:04'..avt = 'assets/images/avt4.jpg'..category = Categories[6]..status = Status.yes,
];
