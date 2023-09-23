import 'package:app_event_flutter/model/category_model.dart';
import 'package:app_event_flutter/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EventModel> eventList = [];
  List<CategoryModel> categoryList = [];
  int categogyIndex = 0;
  @override
  void initState() {
    super.initState();
    // Categories.insert(
    //     0,
    //     CategoryModel()
    //       ..name = 'All Categories'
    //       ..id = 0);
    // CategoryModel category = CategoryModel()
    //       ..name = 'All Categories'
    //       ..id = 0;
    // eventList = events;
    // categoryList = [category, ...Categories]; //add ptu vao vitri dau tien
    init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 1));
    CategoryModel category = CategoryModel()
      ..name = 'All Categories'
      ..id = 0;
    eventList = events;
    categoryList = [category, ...Categories];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff767676).withOpacity(0.1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('assets/images/avt4.jpg'),
                ),
                const SizedBox(width: 12.0),
                const Expanded(child: Text('Hi Rache 😶‍🌫️🖐️')),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Stack(
                    children: [
                      Icon(Icons.notification_important_rounded),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: CircleAvatar(
                          radius: 3.0,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18.0),
          SizedBox(
            height: 36.0,
            child: eventList.isEmpty
                ? CircularProgressIndicator()
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            categogyIndex = index;

                            eventList = events
                                .where((element) =>
                                    element.category?.id ==
                                    categoryList[index].id)
                                .toList();
                            if (index == 0) {
                              eventList = [...events];
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: categogyIndex == index
                                ? Colors.black
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.white.withOpacity(0.1)),
                            ],
                          ),
                          child: Text(
                            categoryList[index].name ?? '',
                            style: TextStyle(
                                color: categogyIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12.0);
                    },
                    itemCount: categoryList.length),
          ),
          const SizedBox(height: 20.0),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(index == 0 || DateFormat(' MMMM, yyyy').format(
                            DateTime.parse(eventList[index].date ?? '') )!= DateFormat(' MMMM, yyyy').format(
                            DateTime.parse(eventList[index-1].date ?? ''),))
                      Offstage(
                        // index > 0 &&
                        //         eventList[index - 1]
                        //                 .date
                        //                 .toString()
                        //                 .substring(0, 8)
                        //                 .toUpperCase() ==
                        //             eventList[index]
                        //                 .date
                        //                 .toString()
                        //                 .substring(0, 8)
                        //                 .toUpperCase(),
                                offstage: false,

                        child: Text(
                          DateFormat(' MMMM, yyyy').format(
                            DateTime.parse(eventList[index].date ?? ''),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: eventList[index].status == Status.maybe
                              ? Border.all(color: Colors.red)
                              : null,
                          color: eventList[index].status == Status.yes
                              ? Colors.red
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                eventList[index].avt ?? '',
                                width: 64.0,
                                height: 64.0,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eventList[index].category?.name ?? '',
                                  style: TextStyle(
                                    color: eventList[index].status == Status.yes
                                        ? Colors.white
                                        : Colors.red,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  eventList[index].title ?? '',
                                  style: TextStyle(
                                    color: eventList[index].status == Status.yes
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  // events[index].date ?? '', //them tvien intl
                                  DateFormat('dd MM, yyyy - HH:mm').format(
                                      DateTime.parse(events[index].date ?? '')),
                                  style: TextStyle(
                                    color: eventList[index].status == Status.yes
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12.0);
                },
                itemCount: eventList.length),
          )
        ],
      ),
    );
  }
}
