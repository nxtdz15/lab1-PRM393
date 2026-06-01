import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// có 2 loại widget: StatelessWidget và StatefulWidget
// StatelessWidget: là widget không có trạng thái, không thay đổi sau khi được tạo ra. Ví dụ: Text, Icon, Image, Container, Row, Column, ...
// StatefulWidget: là widget có trạng thái, có thể thay đổi sau khi được tạo ra. Ví dụ: Checkbox, Radio, Switch, Slider, TextField, ...
class MyApp extends StatelessWidget {
  //Mỗi weidget đều phải override phương thức build để xây dựng giao diện của widget đó
  const MyApp({super.key});

  void onPressed() {
    print("Hello Flutter");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner là thuộc tính của MaterialApp,
      // nó là một banner hiển thị ở góc trên bên phải của ứng dụng khi đang chạy ở chế độ debug.
      // Khi debugShowCheckedModeBanner được đặt thành false, banner này sẽ không hiển thị.
      debugShowCheckedModeBanner: false,
      // home là thuộc tính của MaterialApp, nó là widget gốc của ứng dụng, nó sẽ được hiển thị khi ứng dụng được chạy
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.amber,
          leading: IconButton(onPressed: onPressed, icon: Icon(Icons.menu)),
          actions: [
            IconButton(onPressed: onPressed, icon: Icon(Icons.search)),
            // more_vert là icon 3 chấm dọc, thường được sử dụng để hiển thị menu tùy chọn
            IconButton(onPressed: onPressed, icon: Icon(Icons.more_vert)),
          ],
        ),
        // SafeArea là widget giúp cho nội dung của ứng dụng không bị che khuất bởi các phần tử của hệ điều hành như notch, status bar, navigation bar, ...
        body: Container(
          height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          width: double.infinity,
          child: Image.asset("assets/images/img.png", fit: BoxFit.cover),
        ),
        // BottomNavigationBar là widget hiển thị thanh điều hướng ở dưới cùng của ứng dụng, thường được sử dụng để chuyển
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.grey,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
