// import 'package:counter_app_with_getx/controller/counter_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/theme_controller.dart';
//
// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final CounterController controller = Get.put(CounterController());
//     final ThemeController themeController = Get.find();
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Obx(() => Text('${controller.count}',style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),),
//           ),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               FloatingActionButton(
//                 onPressed: () {
//                 controller.decrement();
//               },child: Icon(Icons.remove,size: 30,
//               ),),
//               FloatingActionButton(
//                 onPressed: () {
//                   controller.increment();
//                 },child: Icon(Icons.add,size: 30,
//               ),),
//             ],
//           ),
//           SizedBox(height: 50,),
//           Card(
//             margin: EdgeInsets.all(20),
//             child: ListTile(
//               title: Text('Change Theme',style: TextStyle(fontWeight: FontWeight.w600),),
//               trailing: IconButton(onPressed: () {
//                 themeController.toggleTheme();
//               }, icon: Icon(Icons.light_mode)),
//             ),
//           ),
//           Card(
//             margin: EdgeInsets.all(20),
//             child: ListTile(
//               title: Text('Navigation',style: TextStyle(fontWeight: FontWeight.w600),),
//               trailing: IconButton(
//                 onPressed: (){
//                   Get.to(const SecondScreen(),transition: Transition.zoom);
//                 },
//                 icon: Icon(Icons.arrow_forward_ios),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:counter_app_with_getx/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/theme_controller.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SizedBox(
            height: 300,
            width: 400,
            child: Image.network('https://storage.googleapis.com/cms-storage-bucket/d83012c34a8f88a64e2b.jpg',fit: BoxFit.fitHeight,),
          ),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());
    final ThemeController themeController = Get.find();
    var selectedFunctionality = 0.obs; // 0: Counter, 1: Theme, 2: Image

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          switch (selectedFunctionality.value) {
            case 1:
              return Text('Change Theme');
            case 2:
              return Text('Second Screen');
            default:
              return Text('Counter Screen');
          }
        }),
      ),
      body: Obx(() {
        switch (selectedFunctionality.value) {
          case 1:
            return Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  title: Text(
                    'Change Theme',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      themeController.toggleTheme();
                    },
                    icon: Icon(Icons.light_mode),
                  ),
                ),
              ),
            );
          case 2:
            return Center(
              child: Card(
              margin: EdgeInsets.all(20),
              child: ListTile(
                title: Text('Navigation',style: TextStyle(fontWeight: FontWeight.w600),),
                trailing: IconButton(
                  onPressed: (){
                    Get.to(const SecondScreen(),transition: Transition.zoom);
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ),
                        ),
            );
          default:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Obx(
                        () => Text(
                      '${controller.count}',
                      style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        controller.decrement();
                      },
                      child: Icon(
                        Icons.remove,
                        size: 30,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        controller.increment();
                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            );
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: selectedFunctionality.value,
          onTap: (index) {
            selectedFunctionality.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.countertops),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.light_mode),
              label: 'Theme',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assistant_navigation),
              label: 'Navigation',
            ),
          ],
        );
      }),
    );
  }
}

