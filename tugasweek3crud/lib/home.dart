import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController=new TextEditingController();
  TextEditingController skillController=new TextEditingController();

  TextEditingController nameEditController=new TextEditingController();
  TextEditingController skillEditController=new TextEditingController();
  List<Map<String,dynamic>>karyawan=[];

  void _showDialogEdit(int index,Map<String,dynamic> person){
    nameEditController.text=person["name"];
    skillEditController.text=person["skill"];
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Edit Data Karyawan"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameEditController,
                  decoration: InputDecoration(
                      label: Text("Nama")
                  ),
                ),
                SizedBox(height: 3,),
                TextFormField(
                  controller: skillEditController,
                  decoration: InputDecoration(
                      label: Text("Divisi")
                  ),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed:(){
                    String name=nameEditController.text;
                    String skill=skillEditController.text;

                    karyawan[index]["name"]=name;
                    karyawan[index]["skill"]=skill;
                    nameEditController.text="";
                    skillEditController.text="";
                    setState(() {

                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Edit")),
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text("Cancel"))
            ],
          );
        }
    );
  }

  void _showDialogAdd(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Add Data Karyawan"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Nama")
                  ),
                ),
                SizedBox(height: 3,),
                TextFormField(
                  controller: skillController,
                  decoration: InputDecoration(
                      label: Text("Divisi")
                  ),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed:(){
                    String name=nameController.text;
                    String skill=skillController.text;

                    karyawan.add({
                      "name":name,
                      "skill":skill
                    });
                    nameController.text="";
                    skillController.text="";
                    setState(() {

                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Add")),
              FlatButton(onPressed: (){
                 Navigator.of(context).pop();
              },
                  child: Text("Cancel"))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data List Karyawan"),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: _showDialogAdd,
        child:const Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: karyawan.length,
            itemBuilder: (BuildContext context,int index){
               return ListTile(
                 trailing: Container(
                   width: 60,
                   child: Row(
                     children: [
                       InkWell(
                         onTap: (){
                           setState(() {
                             karyawan.removeAt(index);
                           });
                         },
                         child: Icon(Icons.delete),
                       ),
                       SizedBox(width: 3,),
                       InkWell(
                         onTap: (){
                             _showDialogEdit(index, karyawan[index]);
                         },
                         child: Icon(Icons.edit),
                       ),
                     ],
                   ),
                 ),
                 title: Text(karyawan[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                 subtitle: Text(karyawan[index]["skill"]),
               );
            }
        ) ,
      ),
    );
  }
}

