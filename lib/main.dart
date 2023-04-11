import 'package:flutter/material.dart';
import 'package:lap1_mobile/personal_salary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Lap 20521976',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mobile Labs 02'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  final grossSalaryController = TextEditingController();
  List<PersonalSalary> listPersonalSalary = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: grossSalaryController,
            decoration: const InputDecoration(
              labelText: "Gross Salary",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: handleListPersonal,
            child: const Text("Calculate"),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listPersonalSalary.length,
            itemBuilder: (context, index) {
              return personSalWidget(listPersonalSalary[index]);
            },
          )
        ],
      ),
    );
  }

  Widget personSalWidget(PersonalSalary per) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(per.fullName ?? ""),
        const Text(": "),
        Text("${per.netSalary}"),
      ],
    );
  }
  void addPersonalSalaryToList() {
    // Tạo đối tượng PersonalSalary mới với thông tin từ các trường nhập liệu
    final newPersonalSal = PersonalSalary(
      fullName: nameController.text,
      grossSalary: int.parse(grossSalaryController.text),
    );

    // Thêm đối tượng PersonalSalary mới vào danh sách
    setState(() {
      listPersonalSalary.add(newPersonalSal);
    });

    // Xóa dữ liệu đang nhập trong các trường tên và mức lương
    nameController.clear();
    grossSalaryController.clear();
  }
