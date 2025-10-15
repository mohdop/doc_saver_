import 'package:flutter/material.dart';

class add_document extends StatefulWidget {
  const add_document({super.key});

  @override
  State<add_document> createState() => _add_documentState();
}

class _add_documentState extends State<add_document> {
  String? selectedDocumentType;
  TextEditingController documentNameController = TextEditingController();
  
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
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blue.shade200,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    // Handle file picker
                    print('Open file picker');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        size: 50,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tap to browse files',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'or drag and drop here',
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
                  
                  // Success
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