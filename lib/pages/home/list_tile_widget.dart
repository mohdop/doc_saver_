import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget list_tile(BuildContext context, String file_type, String file_name) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        // Specify the end action pane (swipe from right to left)
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                // Handle delete action
                print('Delete $file_name');
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                // Handle share action
                print('Share $file_name');
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
          ],
        ),
        // Optionally add start action pane (swipe from left to right)
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                // Handle edit action
                print('Edit $file_name');
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          height: MediaQuery.heightOf(context) * .09,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/" + file_type,
                  fit: BoxFit.cover,
                ),
                title: Text(file_name),
                trailing: Icon(Icons.remove_red_eye, size: 18),
                onTap: () {
                  // Handle tap
                },
              ),
            ),
          ),
        ),
      ),
    ),
  );
}