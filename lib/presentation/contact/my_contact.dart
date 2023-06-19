
import 'package:flutter/material.dart';
import 'package:my_profile/presentation/component/contact_item.dart';

class MyContact extends StatelessWidget {
  const MyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("My Contact"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              ContactItem(icon: const AssetImage("assets/image/ic_phone.png"), title: "Phone / Whatsapp", description: "+62 851 5676 3020"),
              ContactItem(icon: const AssetImage("assets/image/ic_envelope.png"), title: "Email", description: "yusufaqwya123@gmail.com"),
              ContactItem(icon: const AssetImage("assets/image/ic_address.png"), title: "Address", description: "Rt. 01, Rw. 01, Sambisari, Purwomartani, Kalasan, Sleman, Yogyakarta"),
              ContactItem(icon: const AssetImage("assets/image/ic_instagram.png"), title: "Instagram", description: "@yusufalqowy", linkContact: "https://www.instagram.com/yusufalqowy",),
              ContactItem(icon: const AssetImage("assets/image/ic_linkedin.png"), title: "LinkedIn", description: "https://www.linkedin.com/in/yusufalqowy", linkContact: "https://www.linkedin.com/in/yusufalqowy"),
              ContactItem(icon: const AssetImage("assets/image/ic_github.png"), title: "Github", description: "https://github.com/yusufalqowy", linkContact: "https://github.com/yusufalqowy"),
              ContactItem(icon: const AssetImage("assets/image/ic_dribble.png"), title: "Dribbble", description: "https://dribbble.com/yusufalqowy", linkContact: "https://dribbble.com/yusufalqowy",),
            ],
          ),
        ),
      ),
    );
  }
}
