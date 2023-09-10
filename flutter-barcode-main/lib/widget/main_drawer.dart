import 'package:barcode_flutter/generate_barcode.dart';
import 'package:flutter/material.dart';



class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color: Colors.black87,
        child: ListView(
          padding:  const EdgeInsets.all(0.0),
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10),
                //color: Colors.green,
                child:const UserAccountsDrawerHeader(
                  accountName:  Text("Admin"),
                  accountEmail:  Text("admin@gmail.com"),
                  currentAccountPicture:  CircleAvatar(
                    backgroundColor: Colors.black,
                    child:  Icon(Icons.person_rounded, size: 70),
                  ),
                )
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded,
                  size: 22,
                  color: Colors.white),
              title: const Text('Dashboard',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ProfilePage())
                // );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.category_rounded, size: 22,
                  color: Colors.white),
              title: const Text('Category',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits_rounded, size: 22,
                  color: Colors.white),
              title: const Text('Product',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person_add_alt_1_rounded, size: 22,
                  color: Colors.white),
              title: const Text('Customer',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.sell_rounded, size: 22,
                  color: Colors.white),
              title: const Text('Supplier',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.outgoing_mail, size: 22,
                  color: Colors.white),
              title: const Text('Outgoing Products',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.outbond_rounded, size: 22,
                  color: Colors.white),
              title: const Text('Purchasing Products',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.supervised_user_circle_outlined, size: 22,
                  color: Colors.white),
              title: const Text('System Users',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),




          ],
        )
    ));
  }
}
