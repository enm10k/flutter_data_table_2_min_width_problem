import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final double _fixedWidth = 140;

  final n = 6;

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = List.generate(n, (i) => i)
        .map((e) => DataColumn2(
              label: Text('$e'),
              fixedWidth: _fixedWidth,
            ))
        .toList();

    final rows = List.generate(n, (i) => i)
        .map((e) => DataRow2(
              cells: List.generate(n, (i) => i)
                  .map((e) => DataCell(Text('$e')))
                  .toList(),
            ))
        .toList();
    // final screenWidth = MediaQuery.of(context).size.width;
    // print('screenWidth: $screenWidth');

    return Center(
      child: DataTable2(
        showCheckboxColumn: true,
        minWidth: _fixedWidth * n,
        columns: columns,
        rows: rows,
      ),
    );
  }
}
