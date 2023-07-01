import 'package:flutter/material.dart';
import 'package:assignment_module_08/style.dart';

class TaskManagement extends StatefulWidget {

  @override
  State<TaskManagement> createState() => TaskManagementUI();
}

class TaskManagementUI extends State<TaskManagement> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _deadlineController = TextEditingController();

    GlobalKey<FormState>todoForm = GlobalKey<FormState>();

  List<Todo>todos=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle:true,
      ),
      
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onLongPress: (){
                showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (context){
                      return Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Task Details",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),

                            SizedBox(height: 20,),

                            Container(
                                child: Text("Title: ${todos[index].title}",style: TextStyle(fontSize: 17),)
                            ),
                            Container(
                              child: Text("Description: ${todos[index].description}",style: TextStyle(fontSize: 17),),
                            ),
                            Container(
                              child: Text("Days Required: ${todos[index].deadline}",style: TextStyle(fontSize: 17),),
                            ),
                            SizedBox(height: 20,),

                            ElevatedButton(onPressed: (){
                              todos.removeAt(index);
                              if(mounted){
                                setState(() {});
                              }
                              Navigator.pop(context);

                            }, child: Text("Delete"))
                          ],
                  ),
                  );

                });
              },
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(todos[index].title),
                        subtitle: Text(todos[index].description),
                      )
                    ],
                  ),
            );
          }
      ),

      //floatingActionButton

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialog(context: context,
              barrierDismissible: false,
              builder: (context){
                    return Form(
                      key: todoForm,
                        child:AlertDialog(
                          title: const Text("Add Task"),
                          scrollable: true,
                          actions: [
                            TextFormField(
                              controller: _titleController,
                              decoration: myInputStyle("Title"),
                              validator: (String ? value){
                                if(value?.trim().isEmpty ?? true){
                                  return "Please enter your title..!";
                                }
                                return null;
                              }
                            ),

                            const SizedBox(height: 13),
                            TextFormField(
                              controller: _descriptionController,
                              decoration: myInputStyle("Description"),
                              maxLines: 4,
                                validator: (String ? value){
                                  if(value?.trim().isEmpty ?? true){
                                    return "Please enter your description..!";
                                  }
                                  return null;
                                }
                            ),

                            const SizedBox(height: 13),
                            TextFormField(
                              controller: _deadlineController,
                              decoration: myInputStyle("Days Required"),
                                validator: (String ? value){
                                  if(value?.trim().isEmpty ?? true){
                                    return "Please enter the deadline date..!";
                                  }
                                  return null;
                                }
                            ),
                            const SizedBox(height: 20),

                            TextButton(onPressed: () {
                              if (todoForm.currentState!.validate()) {
                                todos.add(Todo(_titleController.text.trim(),
                                    _descriptionController.text.trim(),
                                    _deadlineController.text.trim()));

                                if (mounted) {
                                  setState(() {});
                                }
                                _titleController.clear();
                                _descriptionController.clear();
                                _deadlineController.clear();

                                Navigator.pop(context);
                              }

                            },
                            child: const Text("Save")),
                          ],
                        ),
                    );
          });
        },
      ),
    );
  }
}


// todo class

class Todo{
  String title, description, deadline;
  Todo(this.title, this.description, this.deadline);
}
