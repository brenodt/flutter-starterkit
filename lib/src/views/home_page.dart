import 'package:flutter/material.dart';

import '../../localization.dart';
import '../../styles.dart';
import '../models/counter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalization.of(context)
                .translate(TranslationKey.homePageLabel)),
            Text(
              '${_counter.value}',
              style: AppStyles.basic,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(_counter.increment),
        tooltip: AppLocalization.of(context)
            .translate(TranslationKey.homePageTooltip),
        child: Icon(Icons.add),
      ),
    );
  }
}
