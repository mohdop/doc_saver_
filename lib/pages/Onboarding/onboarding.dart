import 'package:doc_saver/main.dart';
import 'package:doc_saver/pages/Onboarding/build_pages.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(()=>isLastPage=index==2);
          },
          children: [
          buildPage(color: Colors.white38, urlImage: "assets/images/upload_picture.png", title: "Very first page", subtitle: "This is the first page of the unboarding session"),
          buildPage(color: Colors.grey, urlImage: "assets/images/files_upload.jpg", title: "Second page", subtitle: "This is the second page of the unboarding session"),

            Container(
              color: Colors.blueAccent,
              child: Center(child: Text("Page 3")),
            ),
          ],
          
        ),
        
      ),
      bottomSheet: isLastPage
      ?TextButton(
        onPressed: ()async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context)=>HomePage())
          );
        },
        child: const Text(
          "",
          style:TextStyle(fontSize: 24) , ),
      )
      :Container(
        padding: const EdgeInsets.symmetric(horizontal:80),
        height:80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: ()=>controller.jumpToPage(2), child: Text("SKIP")),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
              ),
            ),
            TextButton(onPressed: () => controller.nextPage(duration:const Duration (milliseconds: 500), 
            curve: Curves.easeInOut), 
            child: Text("NEXT"))
          ],
        )
      ) ,
    );
  }
}
