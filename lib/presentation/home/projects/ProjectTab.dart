import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late TextEditingController searchController;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleSearch(String value) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              const Text(
                'Projects',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/add'),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.pink,
            controller: controller,
            tabs: [
              Tab(
                icon: Text('Progress'),
              ),
              Tab(icon: Text('Completed')),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(controller: controller, children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: handleSearch,
                        controller: searchController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(40, 40, 40, 1),
                            isDense: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 24,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                            hintText: 'search projetcs',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(40, 40, 40, 1)),
                          child: Icon(
                            Icons.filter_list,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                        ))
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(context, '/detail'),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: 30.0,
                                lineWidth: 3.0,
                                percent: 0.76,
                                center: const Text(
                                  "76%",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                progressColor: Colors.pink,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Project X',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Due: 06-07-2023',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white60),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )
                            ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    );
                  },
                  itemCount: 4)
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: handleSearch,
                        controller: searchController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(40, 40, 40, 1),
                            isDense: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 24,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                            hintText: 'search username',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(40, 40, 40, 1)),
                          child: Icon(
                            Icons.filter_list,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                        ))
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.pushNamed(context, '/detail'),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: 30.0,
                                lineWidth: 3.0,
                                percent: 0.76,
                                center: const Text(
                                  "76%",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                progressColor: Colors.pink,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Project X',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Due: 06-07-2023',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white60),
                                    )
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )
                            ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    );
                  },
                  itemCount: 4)
            ],
          ),
        ]))
      ],
    );
  }
}
