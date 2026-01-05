import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Here lesson 14',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_downward_sharp,
                size: 40,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
                icon: Icon(
                  Icons.touch_app_outlined,
                  size: 60,
                  color: Colors.amber,
                ),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Spacer(),
                  Icon(Icons.arrow_forward_outlined,size: 40,),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cartoon');
                    },
                    icon: Icon(
                      Icons.movie_creation_outlined,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_outlined,
                    size: 40,
                  ),
                  Text(
                    'Here lesson 15',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Spacer(),
                  Icon(Icons.arrow_forward_outlined,size: 40,),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/counter');
                    },
                    icon: Icon(
                      Icons.control_point_duplicate_rounded,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_outlined,
                    size: 40,
                  ),
                  Text(
                    'Here lesson 16',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Spacer(),
                  Icon(Icons.arrow_forward_outlined,size: 40,),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tasks');
                    },
                    icon: Icon(
                      Icons.control_point_duplicate_rounded,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_outlined,
                    size: 40,
                  ),
                  Text(
                    'Here lesson 17',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/guitar');
                },
                icon: Icon(Icons.my_library_music, size: 50),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/details');
                },
                icon: Icon(Icons.details, size: 50),
              ),
              SizedBox(height: 5),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/settings',
                    arguments: 'From Home Screen',
                  );
                },
                icon: Icon(Icons.settings, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
