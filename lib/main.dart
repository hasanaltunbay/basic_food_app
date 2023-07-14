import 'package:flutter/material.dart';
import 'package:yemekler/DetaySayfasi.dart';

import 'Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir() async{
    var yemekListesi=<Yemekler>[];

    var y1=Yemekler(1, "Ciğer", "ciger.jpeg", 149.99);
    var y2=Yemekler(2, "Dolma", "dolma.jpg", 49.99);
    var y3=Yemekler(3, "Döner", "doner.jpg", 69.99);
    var y4=Yemekler(4, "Hamburger", "hamburger.jpg", 129.99);
    var y5=Yemekler(5, "İskender", "iskender.jpg", 159.99);
    var y6=Yemekler(6, "Kebap", "kebap.jpg", 189.99);
    var y7=Yemekler(7, "Köfte", "kofte.jpg", 109.99);
    var y8=Yemekler(8, "Lahmacun", "lahmacun.jpg", 179.99);
    var y9=Yemekler(9, "Mantı", "manti.jpg", 95.99);
    var y10=Yemekler(10, "Tost", "tost.jpg", 74.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);
    yemekListesi.add(y7);
    yemekListesi.add(y8);
    yemekListesi.add(y9);
    yemekListesi.add(y10);

    return yemekListesi;



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Yemekler"),
      ),
      body:FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,veri){
          if(veri.hasData){
            var yemekListesi=veri.data;

            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context,index){
                var yemek=yemekListesi[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfasi(yemek: yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 200,
                            height: 150,
                            child: Image.asset("resimler/${yemek.yemek_resim_adi}")
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(yemek.yemek_adi,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                              SizedBox(height: 50,),
                              Text("${yemek.yemek_fiyat} TL",style: TextStyle(fontSize: 24,color: Colors.red),),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },

            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}
