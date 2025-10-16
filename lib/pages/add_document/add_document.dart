import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class add_document extends StatefulWidget {
  const add_document({super.key});

  @override
  State<add_document> createState() => _add_documentState();
}

class _add_documentState extends State<add_document> {
  String? selectedDocumentType;
  TextEditingController documentNameController = TextEditingController();
  File? selectedFile;
  String? fileName;
  
  // Function to pick file
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'jpg', 'jpeg', 'png', 'mp4', 'avi', 'txt'],
      );

      if (result != null) {
        setState(() {
          selectedFile = File(result.files.single.path!);
          fileName = result.files.single.name;
          
          // Auto-fill document name if empty
          if (documentNameController.text.isEmpty) {
            documentNameController.text = fileName!.split('.').first;
          }
          
          // Auto-select document type based on extension
          String extension = result.files.single.extension ?? '';
          if (['pdf'].contains(extension)) {
            selectedDocumentType = 'PDF';
          } else if (['doc', 'docx'].contains(extension)) {
            selectedDocumentType = 'Word';
          } else if (['xls', 'xlsx'].contains(extension)) {
            selectedDocumentType = 'Excel';
          } else if (['jpg', 'jpeg', 'png'].contains(extension)) {
            selectedDocumentType = 'Image';
          } else if (['mp4', 'avi'].contains(extension)) {
            selectedDocumentType = 'Video';
          } else {
            selectedDocumentType = 'Other';
          }
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File selected: $fileName'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  final List<Map<String, dynamic>> documentTypes = [
    {'name': 'PDF', 'icon': Icons.picture_as_pdf, 'color': Colors.red},
    {'name': 'Word', 'icon': Icons.description, 'color': Colors.blue},
    {'name': 'Excel', 'icon': Icons.table_chart, 'color': Colors.green},
    {'name': 'Image', 'icon': Icons.image, 'color': Colors.orange},
    {'name': 'Video', 'icon': Icons.video_library, 'color': Colors.purple},
    {'name': 'Other', 'icon': Icons.insert_drive_file, 'color': Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.upload_file,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Add New Document',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Upload and organize your files',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Document Name Input
            Text(
              'Document Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: documentNameController,
              decoration: InputDecoration(
                hintText: 'Enter document name',
                prefixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Document Type Selection
            Text(
              'Document Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemCount: documentTypes.length,
              itemBuilder: (context, index) {
                final docType = documentTypes[index];
                final isSelected = selectedDocumentType == docType['name'];
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDocumentType = docType['name'];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? docType['color'].withOpacity(0.2)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: isSelected 
                            ? docType['color']
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          docType['icon'],
                          size: 40,
                          color: isSelected 
                              ? docType['color']
                              : Colors.grey.shade600,
                        ),
                        SizedBox(height: 8),
                        Text(
                          docType['name'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected 
                                ? FontWeight.bold 
                                : FontWeight.normal,
                            color: isSelected 
                                ? docType['color']
                                : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            
            SizedBox(height: 30),
            
            // Upload Button
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: selectedFile != null ? Colors.green.shade50 : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: selectedFile != null ? Colors.green.shade200 : Colors.blue.shade200,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: pickFile,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selectedFile != null ? Icons.check_circle : Icons.cloud_upload,
                        size: 50,
                        color: selectedFile != null ? Colors.green : Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        selectedFile != null ? fileName! : 'Tap to browse files',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selectedFile != null ? Colors.green : Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (selectedFile == null)
                        Text(
                          'or drag and drop here',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      if (selectedFile != null)
                        Text(
                          'Tap to change file',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Save Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save
                  if (documentNameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter document name')),
                    );
                    return;
                  }
                  if (selectedDocumentType == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select document type')),
                    );
                    return;
                  }
                  if (selectedFile == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a file')),
                    );
                    return;
                  }
                  
                  // Success - Here you would save the file to your database/storage
                  print('Saving document:');
                  print('Name: ${documentNameController.text}');
                  print('Type: $selectedDocumentType');
                  print('File path: ${selectedFile!.path}');
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Document added successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  
                  // Clear form
                  documentNameController.clear();
                  setState(() {
                    selectedDocumentType = null;
                    selectedFile = null;
                    fileName = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Document',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    documentNameController.dispose();
    super.dispose();
  }
}