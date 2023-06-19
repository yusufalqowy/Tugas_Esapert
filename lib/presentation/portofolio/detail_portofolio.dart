import 'package:flutter/material.dart';
import 'package:my_profile/presentation/component/portofolio_view.dart';

class PortofolioDetail extends StatelessWidget {
  final PortofolioData data;
  const PortofolioDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(data.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Image.network(data.imageUrl),
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: Text(data.description, style: const TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}
