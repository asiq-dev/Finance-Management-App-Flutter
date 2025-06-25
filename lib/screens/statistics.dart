import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/data/top.dart';
import 'package:finance_app/data/utility.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<AddData> a = [];
  int indexColor = 0;
  ValueNotifier kj = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (context, dynamic value, child) {
            a = f[value];
            return custom();
          }
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Statistics",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexColor = index;
                              kj.value = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: indexColor == index ? Color.fromARGB(255, 47, 125, 121):Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              day[index],
                              style: TextStyle(
                                color: indexColor == index ? Colors.white: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                       },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Expenses',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),

                      )
                    ],
                  ),
                ),
                // this is for chart
                SizedBox(height: 20),
                Chart(indexx: indexColor),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Spending',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(
                        Icons.swap_vert,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset('images/${a[index].name}.png',
                  height: 40),
                ),
                title: Text(
                  a[index].name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  '${day[a[index].datetime.weekday -1 ]} ${a[index].datetime.year} -${a[index].datetime.day}-${a[index].datetime.month}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  a[index].amount,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: a[index].type == 'Expense' ? Colors.red : Colors.green,
                  ),
                ),
              );
            },
            childCount: a.length,
            ),
          ),
        ],
      );
  }
}
