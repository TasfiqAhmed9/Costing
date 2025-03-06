import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 65,
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent[100],
                      radius: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'
                            //       // "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"
                            ),
                        // AssetImage('assets/logo/pak.jpeg'),
                        radius: 100,
                        //   NetworkImage(
                        //       'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'
                        //       // "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"
                        //       ), //NetworkImage
                        //   radius: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -8,
                    right: -7,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                    ),
                    // left: 25,
                  )
                ],
              ),
            ),
            // Container()
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // controller: username,
                // keyboardType: TextInputType.phone
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.person_rounded),
                    labelText: 'Your Name',
                    hintText: 'Enter your Name'),
              ),
            ),

            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // controller: userPhone,
                // keyboardType: TextInputType.phone
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.add_ic_call_rounded),
                    labelText: 'Mobile Number',
                    hintText: 'Enter your Mobile number'),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // controller: userPhone,
                // keyboardType: TextInputType.phone
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.flag),
                    labelText: 'Country',
                    hintText: 'Enter your Country Name'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
