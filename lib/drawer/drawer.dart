// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
class drawer extends StatelessWidget {
   drawer({super.key});
  final drawer_items_name = [
    'Items',
    'Settings',
    'account'
  ];
  final List<IconData> drawer_icons_name = [
    Icons.data_object,
    Icons.settings_outlined,
    Icons.person_2_outlined
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(children: [
                Container(
                  height: 100, 
                  width: 100,
                  margin: const EdgeInsets.only(top: 40,bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 6,color: Colors.white),
                    image: const DecorationImage(image: AssetImage('image/photo.jpg')),
                    shape: BoxShape.circle,
                  ),
                ),
                const Text(
                  "Robel Aklilu",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    )
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "robelakklilu100@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],),
            )
          ),
          SizedBox(
            height: 500,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListTile(
                      leading: Icon(drawer_icons_name[index],size: 25,color: Colors.black,), 
                      title: Text(
                        drawer_items_name[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index){
                  return const Divider(
                    height: 0,
                    thickness: 0,
                    color: Colors.white,
                  );
                },
                itemCount: drawer_items_name.length),
          )
        ],), 
    );
  }
}