import 'package:flutter/material.dart';

class Tugas4MyWidgetDay10 extends StatelessWidget {
  const Tugas4MyWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Color(0xFFA59D84)),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: [
          Text(
            "Form User",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
            textAlign: TextAlign.center,
          ),

          Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(
              color: Color(0xFFB6AE9F),
              borderRadius: BorderRadius.circular(10),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text("Email"),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text("Phone Number"),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Your Phone Number",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text("Description"),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(40.0),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(),
                      ),
                      hintText: "Enter Your Description",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //buatlah nama produk,gambar,icon dan harga
          Text(
            "List Menu",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB6AE9F),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),

            child: ListTile(
              leading: Image(image: AssetImage("assets/images/americano1.jpg")),
              title: Text("Americano", style: TextStyle(fontSize: 17)),
              subtitle: Text("Rp15.000"),
              trailing: Icon(Icons.local_drink),
            ),
          ),

          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB6AE9F),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),

            child: ListTile(
              leading: Image(image: AssetImage("assets/images/kopisusu1.jpg")),
              title: Text("Latte", style: TextStyle(fontSize: 17)),
              subtitle: Text("Rp20.000"),
              trailing: Icon(Icons.local_drink),
            ),
          ),

          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB6AE9F),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),

            child: ListTile(
              leading: Image(image: AssetImage("assets/images/coklat11.jpg")),
              title: Text("Chocolate", style: TextStyle(fontSize: 17)),
              subtitle: Text("Rp20.000"),
              trailing: Icon(Icons.local_drink),
            ),
          ),

          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB6AE9F),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),

            child: ListTile(
              leading: Image(image: AssetImage("assets/images/icetea.jpg")),
              title: Text("Lemon Tea", style: TextStyle(fontSize: 17)),
              subtitle: Text("Rp20.000"),
              trailing: Icon(Icons.local_drink),
            ),
          ),

          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB6AE9F),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),

            child: ListTile(
              leading: Image(
                image: AssetImage("assets/images/mineralwater.jpg"),
              ),
              title: Text("Mineral Water", style: TextStyle(fontSize: 17)),
              subtitle: Text("Rp10.000"),
              trailing: Icon(Icons.local_drink),
            ),
          ),
        ],
      ),
    );
  }
}
