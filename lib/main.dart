import 'package:dogs_app/helpers/helper.dart';
import 'package:dogs_app/screens/detail.dart';
import 'package:dogs_app/services/dog_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => new DogService())],
        child: MaterialApp(
          title: 'Material App',
          home: DogsScreen(),
        ));
  }
}

class DogsScreen extends StatefulWidget {
  @override
  _DogsScreenState createState() => _DogsScreenState();
}

class _DogsScreenState extends State<DogsScreen> {
  @override
  Widget build(BuildContext context) {
    final dogsProvider = Provider.of<DogService>(context);
    dogsProvider.getDogs();

    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView.builder(
            itemCount: dogsProvider.dogsMap.length,
            itemBuilder: (context, i) {
              var keys = dogsProvider.dogsMap.keys.toList();
              return InkWell(
                child: DogItem(keys[i]),
                onTap: () {
                  Navigator.push(
                      context,
                      navigateMapFadeIn(
                          context,
                          DogDetail(
                            breed: keys[i],
                          )));
                },
              );
            }));
  }
}

class DogItem extends StatelessWidget {
  final String breed;

  const DogItem(this.breed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          this.breed,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.chevron_right,
                              color: Colors.green,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
