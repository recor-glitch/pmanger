import 'package:flutter/material.dart';
import 'package:pmanager/constants.dart';
import 'package:pmanager/presentation/components/CustomBottomBar.dart';
import 'package:intl/intl.dart';

List<String> routines = [
  'None',
  'Daily',
  'Every weekday (Mon-Fri)',
  'Weekly (Monday)',
  'Monthly (Every 15th)',
  'Yearly (15th May)'
];

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({super.key});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  late TextEditingController dateController, routineController, stepsController;
  late List<String> steps;
  int groupValue = 0;

  @override
  void initState() {
    steps = [
      "Write 100 words",
      "Write 100 words",
      "Write 100 words",
      "Write 100 words",
      "Write 100 words",
      "Write 100 words"
    ];
    dateController = TextEditingController();
    routineController = TextEditingController();
    stepsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    routineController.dispose();
    stepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration:
                      const BoxDecoration(color: Color.fromRGBO(40, 40, 40, 1)),
                  child: const Image(
                    image: AssetImage('assets/demo.png'),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: secondaryTextColor),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Project title',
                      hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: lightTextColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: secondaryTextColor),
                        onChanged: (value) {},
                        controller: dateController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(40, 40, 40, 1),
                            isDense: true,
                            prefixIcon: InkWell(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2024))
                                    .then((picked) {
                                  if (picked != null) {
                                    dateController.text =
                                        (DateFormat('yyyy-MM-dd')
                                                .format(picked))
                                            .toString();
                                  } else {
                                    return;
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.calendar_month,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Due date',
                            hintStyle:
                                const TextStyle(color: secondaryTextColor),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white60)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Expanded(
                      child: TextField(
                        // enabled: false,
                        style: const TextStyle(color: secondaryTextColor),
                        onChanged: (value) {},
                        controller: routineController,
                        decoration: InputDecoration(
                            focusColor: Colors.white60,
                            filled: true,
                            fillColor: secondaryBackgroundShadeColor,
                            isDense: true,
                            prefixIcon: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: primaryBackgroundColor,
                                    title: Row(children: [
                                      InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                          color: primaryTextColor,
                                        ),
                                      ),
                                      const Text(
                                        'Routine',
                                        style:
                                            TextStyle(color: primaryTextColor),
                                      )
                                    ]),
                                    content: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Do you want this project to repeat?",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Expanded(
                                              child: SingleChildScrollView(
                                            child: Column(children: [
                                              ...routines
                                                  .map((routine) =>
                                                      RadioListTile(
                                                          fillColor:
                                                              MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) =>
                                                                          Colors
                                                                              .pink),
                                                          value: routines
                                                              .indexOf(routine),
                                                          groupValue:
                                                              groupValue,
                                                          title: Text(
                                                            routine,
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color:
                                                                    primaryTextColor),
                                                          ),
                                                          onChanged: (value) {
                                                            setState(() {
                                                              groupValue =
                                                                  value!;
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          }))
                                                  .toList()
                                            ]),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.undo,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 24,
                              color: Colors.white,
                            ),
                            hintText: groupValue == 0
                                ? 'Routine'
                                : routines[groupValue],
                            hintStyle: TextStyle(color: secondaryTextColor),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white60)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: secondaryTextColor),
                        onChanged: (value) {},
                        controller: stepsController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(40, 40, 40, 1),
                            isDense: true,
                            hintText: 'Type to add a step',
                            suffixIcon: stepsController.text != ""
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        steps.add(stepsController.text);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.pink,
                                      size: 25,
                                    ))
                                : null,
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white60)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Steps',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: lighterTextColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      steps.isNotEmpty
                          ? Expanded(
                              child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: null,
                                            onChanged: (value) {}),
                                        Text(
                                          steps[index],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: primaryTextColor),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: const Divider(
                                        indent: 10,
                                        endIndent: 10,
                                        thickness: 0.5,
                                        height: 0.5,
                                        color: secondaryTextColor,
                                      ),
                                    );
                                  },
                                  itemCount: steps.length),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "No steps added",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: lighterTextColor),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
              CustomBottom(
                children: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(194, 14, 161, 1),
                              Color.fromRGBO(221, 45, 127, 1),
                              Color.fromRGBO(238, 76, 94, 1),
                              Color.fromRGBO(244, 109, 65, 1),
                            ]),
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.white54, width: 0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.rocket_launch,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              'Launch',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
