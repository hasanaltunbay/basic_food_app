import 'package:flutter/material.dart';
import 'package:yemekler/Yemekler.dart';

class DetaySayfasi extends StatefulWidget {

  Yemekler yemek;

  DetaySayfasi({required this.yemek});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.yemek.yemek_adi),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                  width: 350,
                  height: 200,
                child: Image.asset("resimler/${widget.yemek.yemek_resim_adi}")),
            Text("${widget.yemek.yemek_fiyat} TL",style: TextStyle(fontSize:40,color: Colors.red),),
            SizedBox(width: 200,height: 50,
              child: ElevatedButton(
                child: Text("Sipariş Ver"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: (){
                  print("${widget.yemek.yemek_adi} sipariş verildi");
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
