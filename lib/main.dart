import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:web_view_icon_helper/outlined_map.dart';
import 'package:web_view_icon_helper/regular_map.dart';
import 'package:web_view_icon_helper/rounded_map.dart';
import 'package:web_view_icon_helper/sharp_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var pageIndex = 1;
var list = list_map_regular.entries.toList();
var temp_list = list_map_regular.entries.toList();
TextEditingController controller = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var pagesCount = 102;
    var maxPages = (list.length / pagesCount).ceil();
    print("length" + list.length.toString());
    list = list.sublist(
        (pageIndex - 1) * pagesCount, pageIndex * pagesCount > list.length ? list.length : pageIndex * pagesCount);

    return Scaffold(
        body: Row(children: [
      Container(
        color: Colors.grey.shade200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.clear();
                  list = list_map_rounded.entries.toList();
                  temp_list = list_map_rounded.entries.toList();
                  pageIndex = 1;
                });
              },
              child: Container(
                width: 200,
                height: 30,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Center(
                  child: Text(
                    "Rounded",
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.clear();
                  list = list_map_outlined.entries.toList();
                  temp_list = list_map_outlined.entries.toList();
                  pageIndex = 1;
                });
              },
              child: Container(
                width: 200,
                height: 30,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Center(
                  child: Text(
                    "Outlined",
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.clear();
                  list = list_map_sharp.entries.toList();
                  temp_list = list_map_sharp.entries.toList();

                  pageIndex = 1;
                });
              },
              child: Container(
                width: 200,
                height: 30,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Center(
                  child: Text(
                    "Sharp",
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.clear();
                  list = list_map_regular.entries.toList();
                  temp_list = list_map_regular.entries.toList();

                  pageIndex = 1;
                });
              },
              child: Container(
                width: 200,
                height: 30,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Center(
                  child: Text(
                    "Regular",
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: width - 200,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: width / 3),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    pageIndex = 1;
                    list = temp_list;
                    list = temp_list.where((element) => element.key.contains(controller.text)).toList();
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade100,
                width: MediaQuery.of(context).size.width / 1.3,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6, // Sütun sayısı
                    ),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // İkona tıklama işlevi eklenebilir (isteğe bağlı)
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SelectableText(
                              '${list.elementAt(index).key}',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 10),
                            Icon(
                              list.elementAt(index).value,
                              size: 50,
                            ),
                            SizedBox(height: 5),
                            SelectableText(
                              '0x${list.elementAt(index).value.codePoint.toRadixString(16)}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 1; i <= maxPages; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                list = temp_list;
                                pageIndex = i;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: pageIndex == i ? Colors.green.shade200 : Colors.grey.shade200,
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  i.toString() + "  ",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            )),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
