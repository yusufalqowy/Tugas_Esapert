import 'package:flutter/material.dart';
import 'package:my_profile/presentation/portofolio/detail_portofolio.dart';

class PortofolioView extends StatelessWidget {
  final PortofolioData data;

  const PortofolioView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onSurface),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            )
          )
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> PortofolioDetail(data: data)));
        },
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(data.imageUrl),fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(4)
                  ),
                )
            ),
            // const SizedBox(width: 8,),
            Expanded(
              flex: 3,
              child:Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 4,),
                    Text(data.description, style: const TextStyle(fontSize: 11)),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class PortofolioData{
  final String title;
  final String description;
  final String imageUrl;
  final String? sourceUrl;

  PortofolioData({required this.title, required this.description, required this.imageUrl, this.sourceUrl});

}

