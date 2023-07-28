// import 'package:datn_version3/menu_bottom/home/notification.dart';
// import 'package:datn_version3/menu_bottom/home/search.dart';
// import 'package:datn_version3/menu_bottom/profile/add_team.dart';
// import 'package:flutter/material.dart';
// class Main_MyTeam extends StatefulWidget {
//   const Main_MyTeam({super.key});

//   @override
//   State<StatefulWidget> createState() => Main_MyTeam_State();
// }
// class Main_MyTeam_State extends State<Main_MyTeam>{
//   @override
//   Widget build(BuildContext context){
//     return DefaultTabController(
//   length: 2, // Số lượng tab
//   child: Scaffold(
//     appBar: AppBar(
//          iconTheme: const IconThemeData(
//           color: Colors.black,
//         ),
//           backgroundColor: Colors.white,
//             leading: IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: onSearch,
//         ),
//         centerTitle: true,
//         title: const Text(
//           'My Team',
//           style: TextStyle(color: Colors.black),
//         ),
//         actions: [
//           IconButton(
//             onPressed: onNotification,
//             icon: const Icon(Icons.notifications_rounded),
//           )
//         ],

//       bottom: TabBar(
//           labelColor: Colors.black, // Màu của văn bản được chọn
//           unselectedLabelColor: Colors.grey, // Màu của văn bản chưa được chọn
//         tabs: [
//           Tab(text: 'Đội của tôi'), // Tab "Tất cả"
//           Tab(text: 'Khám phá'), // Tab "Đã thu"
         
//         ],
//       ),
//     ),
//     body: SingleChildScrollView(
//       child: Container(
//         height: 600,
//         child: TabBarView(
//       children: [
//         // Nội dung của trang "Tất cả"
//         Center(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top:10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: (){}, 
//                       style:ButtonStyle(
//                          backgroundColor: MaterialStateProperty.all<Color>( Colors.green), // Màu nền của button
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Màu chữ của button
//                       ),
//                       child: Text('Đã tạo')
//                       ),
//                         ElevatedButton(
//                       onPressed: (){}, 
//                       style:ButtonStyle(
//                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 235, 235, 235)), // Màu nền của button
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Màu chữ của button
//                       ),
//                       child: Text('Được phân công')
//                       ),
//                         ElevatedButton(
//                       onPressed: (){}, 
//                       child: Text('Đang tham gia'),
//                       style:ButtonStyle(
//                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 235, 235, 235)), // Màu nền của button
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Màu chữ của button
//                       )
//                       ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left:10,right:10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Column(
//                         children: [
//                           Text('Số đội',style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             )),
//                             Text('2',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20))
//                         ]),
//                     ),
//                     Container(
//                       child: ElevatedButton(onPressed: (){
//                          Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Add_Team()));
//                       },
//                        child: Text('Thêm',style: TextStyle(fontSize: 20)),
//                         style:ButtonStyle(
//                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 194, 247, 194)), // Màu nền của button
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.green), // Màu chữ của button
//                       )),
//                     )
//                   ],
//                 )
//               ),
//             ],
//           )
//         ),
//         // Nội dung của trang "Đã thu"
//         Center(
//           child: Text('Nội dung của trang "Đã thu"'),
//         ),
//         // Nội dung của trang "Đã chi"
      
//       ],
//     ),
//       )
//     )
//   ),
// );

//   } 
//     void onSearch() {
//     setState(
//       () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const Search()),
//         );
//       },
//     );
//   }

//   void onNotification() {
//     setState(
//       () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const Notification_Scren()),
//         );
//       },
//     );
//   }
// }

