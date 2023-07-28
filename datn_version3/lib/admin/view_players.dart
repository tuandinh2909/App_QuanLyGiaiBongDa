// ignore_for_file: unused_import

import 'package:datn_version3/menu_bottom/my_team/DoiBong/add_players.dart';
import 'package:datn_version3/menu_bottom/my_team/detail_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:datn_version3/Object_API/object_api.dart';

class View_Players extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => View_Players_State();
}

class View_Players_State extends State<View_Players> {
  late List<Data> dataList = [];
  List<bool> isChecked = []; // Danh sách lưu trạng thái checkbox
  bool selectAll = false;
  int selectedCount = 0;
  String access_token = '';
  int nguoiquanlyid = 0;
  int itemCount = 0;
  int? idDoiBong = 0;
  String idGiaiDau = '';
  int selectedId = 0;
  List<Data> filteredDataList = []; // Danh sách cầu thủ đã lọc theo vị trí
List<Data> allDataList = []; // Danh sách tất cả cầu thủ (trước khi lọc)

  String selectedValue = 'Tất cả';
  void fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idDoiBong = prefs.getInt('viewDoiBong') ?? 0;
    access_token = prefs.getString('accessToken') ?? '';
    print(nguoiquanlyid);
    String url = 'http://10.0.2.2:8000/api/auth/football';
    final headers = {
      'User-Agent': 'MyApp/1.0',
      'Authorization': 'Bearer $access_token'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data'];

      // Lọc danh sách theo cột 'nguoi_quan_ly_id'
   final filteredDataList = data
      .where((item) =>
          item['doi_bong_id'] == idDoiBong)
      .toList();

      setState(() {
        dataList = filteredDataList.map((x) => Data.fromJson(x)).toList();

        isChecked = List.filled(
            dataList.length, false); // Khởi tạo danh sách trạng thái checkbox
      });
   if (dataList.isNotEmpty) {
  nguoiquanlyid = dataList[0].nguoiQuanLyId!;
}

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('idNguoiQL', nguoiquanlyid);

      // print(dataList);
      // print(dataList[0].id);
      // print(dataList[0].tenDoiBong);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchPlayer1();
  }

    void fetchPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    access_token = prefs.getString('accessToken') ?? '';
    nguoiquanlyid = prefs.getInt('idNguoiQL')??0;
    idDoiBong = prefs.getInt('viewDoiBong') ?? 0;
    print(nguoiquanlyid);
    String url = 'http://10.0.2.2:8000/api/auth/players';
    final headers = {
      'User-Agent': 'MyApp/1.0',
      'Authorization': 'Bearer $access_token'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data'];
        if(selectedValue=='Tất cả'){
 final filteredDataList =
          data.where((item) => item['doi_bong_id'] == idDoiBong).toList();

      setState(() {
        dataList = filteredDataList.map((x) => Data.fromJson(x)).toList();
        isChecked = List.filled(
            dataList.length, false); // Khởi tạo danh sách trạng thái checkbox
      });
        }else{
           final filteredDataList =
          data.where((item) => item['doi_bong_id'] == idDoiBong&&item['vi_tri']==selectedValue).toList();

      setState(() {
        dataList = filteredDataList.map((x) => Data.fromJson(x)).toList();
        isChecked = List.filled(
            dataList.length, false); // Khởi tạo danh sách trạng thái checkbox
      });
        }
      // Lọc danh sách theo cột 'nguoi_quan_ly_id'
      final filteredDataList =
          data.where((item) => item['doi_bong_id'] == idDoiBong&&item['vi_tri']==selectedValue).toList();

      setState(() {
        dataList = filteredDataList.map((x) => Data.fromJson(x)).toList();
        isChecked = List.filled(
            dataList.length, false); // Khởi tạo danh sách trạng thái checkbox
      });
      itemCount = dataList.length;
      for (var data in dataList) {
        print(data
            .ten_cau_thu); // In ra giá trị thuộc tính 'id' của mỗi phần tử trong mảng
        print(data
            .so_ao); // In ra giá trị thuộc tính 'ten_doi_bong' của mỗi phần tử trong mảng
               print('avatar: ${data.avatar}');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
  void fetchPlayer1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    access_token = prefs.getString('accessToken') ?? '';
    print(nguoiquanlyid);
    String url = 'http://10.0.2.2:8000/api/auth/players';
    final headers = {
      'User-Agent': 'MyApp/1.0',
      'Authorization': 'Bearer $access_token'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data'];
      // Lọc danh sách theo cột 'nguoi_quan_ly_id'
      final filteredDataList =
          data.where((item) => item['doi_bong_id'] == idDoiBong).toList();

      setState(() {
        dataList = filteredDataList.map((x) => Data.fromJson(x)).toList();
        isChecked = List.filled(
            dataList.length, false); // Khởi tạo danh sách trạng thái checkbox
      });
      itemCount = dataList.length;
      for (var data in dataList) {
        print(data
            .ten_cau_thu); // In ra giá trị thuộc tính 'id' của mỗi phần tử trong mảng
        print(data
            .so_ao); // In ra giá trị thuộc tính 'ten_doi_bong' của mỗi phần tử trong mảng
               print('avatar: ${data.avatar}');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }



void _showMenuStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.green,
              height: 50,
              alignment: Alignment.center,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: Text(
                      'Chọn giá trị',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedValue = 'Tất cả';
                      print('Giá trị chọn là Tất cả');
                    });
                    fetchPlayer1();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Tất cả',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedValue = 'Hậu vệ';
                      print('Giá trị chọn là $selectedValue');
                    });
                    fetchPlayer();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Hậu vệ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selectedValue = 'Tiền vệ';
                    print('Giá trị chọn là $selectedValue');
                  });
                  fetchPlayer();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Tiền vệ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selectedValue = 'Tiền đạo';
                    print('Giá trị chọn là $selectedValue');
                  });
                  fetchPlayer();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Tiền đạo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
               Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selectedValue = 'Thủ môn';
                    print('Giá trị chọn là $selectedValue');
                  });
                  fetchPlayer();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Thủ môn',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
           
          ],
        );
      },
    ).then((value) {
      // Xử lý khi giá trị combobox được chọn
      if (value != null) {
        setState(() {
          selectedValue = value;
        });
        fetchPlayer(); // Gọi hàm fetchData() để cập nhật danh sách
      }
    });
  }
  @override
  Widget build(BuildContext context) {
      final screenWidth_1 = MediaQuery.of(context).size.width;
    final buttonWidth_1 = screenWidth_1 * 0.4; // Tỉ lệ màn hình mong muốn
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
            icon: const Icon(Icons.navigate_before, size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          
          title: const Text(
            'Thành viên',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              color: const Color.fromARGB(255, 238, 238, 238),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Thành viên',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        itemCount.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                 
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vận động viên',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                   OutlinedButton(
                  onPressed: () {
                    _showMenuStatus(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    side: const BorderSide(
                        color: Colors.grey), // Màu sắc và độ dày của viền
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Độ cong góc viền
                    ),
                    minimumSize: Size(buttonWidth_1,
                        0), // Đặt chiều rộng tối thiểu cho button
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedValue,
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                      )
                    ],
                  ),
                ),
                ],
              ),
            ),
           dataList.isEmpty
    ? GestureDetector(
        onTap: () {
          // Xử lý khi người dùng nhấp vào dataList.isEmpty
        },
        child: Text(
          'Chưa có thành viên',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      )
    : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var data = dataList[index];
          return Container(
            color: const Color.fromARGB(255, 224, 224, 224),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            // Container(
                            //   child: Checkbox(
                            //     value: isChecked[index],
                            //     onChanged: (bool? value) {
                            //       setState(() {
                            //         isChecked[index] = value ?? false;
                            //         if (isChecked[index]) {
                            //           selectedCount++;
                            //         } else {
                            //           selectedCount--;
                            //         }
                            //       });
                            //     },
                            //   ),
                            // ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage(data.avatar ?? 'images/user1.png',),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.ten_cau_thu ?? '',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    data.so_ao.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                   Text(
                                    data.vi_tri.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )

          ]),
        )));
  }
}
