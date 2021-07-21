import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List> getData() async {
    var result = await http
        .get(Uri.parse("http://192.168.1.11/test/barang/getdata.php"));
    var jsonResult = json.decode(result.body);
    // print(jsonResult.sort());

    return jsonResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(
          "Horizon",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddDataPage();
          })).then((value) {
            setState(() {});
          });
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return (snapshot.hasData)
              ? _MyListView(list: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// list barang
// ignore: must_be_immutable
class _MyListView extends StatefulWidget {
  List list = [];

  _MyListView({this.list});

  @override
  __MyListViewState createState() => __MyListViewState();
}

class __MyListViewState extends State<_MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: (widget.list.isNotEmpty) ? widget.list.length : 0,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            width: double.infinity,
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  widget.list[index]['nama_barang'],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Stok : ${widget.list[index]['stok']}",
                  style: TextStyle(fontSize: 12),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (contex) {
                        return DetailProduk(list: widget.list, index: index);
                      }));
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ),
            ),
          );
        });
  }
}

// detail produk
// ignore: must_be_immutable
class DetailProduk extends StatefulWidget {
  List list;
  int index;

  DetailProduk({this.list, this.index});

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  String msg = "";

  Future<Map<String, dynamic>> deleteData() async {
    String url = "http://192.168.1.11/test/barang/deletedata.php";
    var result = await http.post(Uri.parse(url),
        body: {"token": "novangans", "id": widget.list[widget.index]['id']});

    var response = json.decode(result.body);
    return response;
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Are you sure delete ${widget.list[widget.index]['nama_barang']} ?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            deleteData().then((value) {
              print(value);
              if (value["error"]) {
                msg = "failed to delete data";
                Navigator.of(context).pop();
                setState(() {});
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MainPage()),
                    (Route<dynamic> route) => false);
              }
            });
          },
          child: Text("OK Delete"),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Detail Produk"),
      ),
      body: Container(
        height: 300,
        width: double.infinity,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(msg),
              Text(
                "${widget.list[widget.index]['nama_barang']}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Sku : ${widget.list[widget.index]['sku']}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "Harga : Rp.${widget.list[widget.index]['harga_barang']}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "Stok : ${widget.list[widget.index]['stok']}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditDataPage(
                            list: widget.list, index: widget.index);
                      }));
                    },
                    child: Icon(Icons.edit),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      confirm();
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Add Data Page
// ignore: must_be_immutable
class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  String msg = "";

  TextEditingController sku = TextEditingController();

  TextEditingController namaBarang = TextEditingController();

  TextEditingController hargaBarang = TextEditingController();

  TextEditingController stok = TextEditingController();

  Future<Map<String, dynamic>> addData() async {
    String url = "http://192.168.1.11/test/barang/adddata.php";
    var response = await http.post(Uri.parse(url), body: {
      "sku": sku.text,
      "nama_barang": namaBarang.text,
      "harga_barang": hargaBarang.text,
      "stok": stok.text
    });

    var res = json.decode(response.body);

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Add Data"),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                msg,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Card(
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: sku,
                      decoration: InputDecoration(
                        labelText: "Sku",
                      ),
                    ),
                    TextFormField(
                      controller: namaBarang,
                      decoration: InputDecoration(
                        labelText: "Nama Barang",
                      ),
                    ),
                    TextFormField(
                      controller: hargaBarang,
                      decoration: InputDecoration(
                        labelText: "Harga Barang",
                      ),
                    ),
                    TextFormField(
                      controller: stok,
                      decoration: InputDecoration(
                        labelText: "Stok",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (sku.text.isEmpty ||
                            namaBarang.text.isEmpty ||
                            hargaBarang.text.isEmpty ||
                            stok.text.isEmpty) {
                          msg = "Field Cannot empty";
                          setState(() {});
                        } else {
                          addData().then((value) {
                            if (value["error"]) {
                              msg = "Failed to add the data";
                              setState(() {});
                            } else {
                              Navigator.pop(context);
                            }
                          });
                        }
                      },
                      child: Text("Add Data"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Edit Data Page
// ignore: must_be_immutable
class EditDataPage extends StatefulWidget {
  List list;
  int index;

  EditDataPage({this.list, this.index});

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  String msg = "";

  TextEditingController sku;

  TextEditingController namaBarang;

  TextEditingController hargaBarang;

  TextEditingController stok;

  @override
  void initState() {
    sku = TextEditingController(text: widget.list[widget.index]['sku']);
    namaBarang =
        TextEditingController(text: widget.list[widget.index]['nama_barang']);
    hargaBarang =
        TextEditingController(text: widget.list[widget.index]['harga_barang']);
    stok = TextEditingController(text: widget.list[widget.index]['stok']);
    super.initState();
  }

  Future<Map<String, dynamic>> editData() async {
    String url = "http://192.168.1.11/test/barang/editdata.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]["id"],
      "sku": sku.text,
      "nama_barang": namaBarang.text,
      "harga_barang": hargaBarang.text,
      "stok": stok.text
    });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Edit Data"),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                msg,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Card(
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: sku,
                      decoration: InputDecoration(
                        labelText: "Sku",
                      ),
                    ),
                    TextFormField(
                      controller: namaBarang,
                      decoration: InputDecoration(
                        labelText: "Nama Barang",
                      ),
                    ),
                    TextFormField(
                      controller: hargaBarang,
                      decoration: InputDecoration(
                        labelText: "Harga Barang",
                      ),
                    ),
                    TextFormField(
                      controller: stok,
                      decoration: InputDecoration(
                        labelText: "Stok",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (sku.text.isEmpty ||
                            namaBarang.text.isEmpty ||
                            hargaBarang.text.isEmpty ||
                            stok.text.isEmpty) {
                          msg = "Field Cannot empty";
                          setState(() {});
                        } else {
                          editData().then((value) {
                            if (value["error"]) {
                              msg = "Failed update data";
                              setState(() {});
                            } else {
                              // Navigator.pop(context);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                  (Route<dynamic> route) => false);
                            }
                          });
                        }
                      },
                      child: Text("Edit Data"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
