import 'package:dogs_app/services/dog_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogDetail extends StatelessWidget {
  final String? breed;

  const DogDetail({Key? key, this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dogsProvider = Provider.of<DogService>(context);
    if (dogsProvider.image == '') {
      dogsProvider.getDogImage(this.breed!);
    }
    dogsProvider.getSubBreeds(this.breed!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (dogsProvider.image == '')
              ? Icon(
                  Icons.home,
                  color: Colors.green,
                  size: 70,
                )
              : CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 65,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 64,
                    backgroundImage: NetworkImage(dogsProvider.image),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          Text(
            'SubRazas: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: dogsProvider.subbreeds.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(
                      dogsProvider.subbreeds[i],
                      style: TextStyle(color: Colors.indigo),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
