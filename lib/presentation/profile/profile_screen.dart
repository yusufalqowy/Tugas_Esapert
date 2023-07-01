import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_profile/presentation/component/education_profile.dart';
import 'package:my_profile/presentation/component/experience_profile.dart';
import 'package:my_profile/presentation/component/portofolio_view.dart';
import 'package:my_profile/presentation/component/skill_progress.dart';
import 'package:my_profile/presentation/contact/my_contact.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String aboutMe =
      "I graduated bachelor in 2020 with expertise as an Android Developer. I have professional experience as an Android Developer working on several projects applications from freelancers and through contract workers. Capable Perform project management and work individually or collaborate as a team. Skilled and familiar in android programming with Kotlin/Java, android library, android design xml, sql, git, and REST API";
  final List<PortofolioData> listPortofolio = [
    PortofolioData(
        title: "Paket Nasi",
        description:
            "Aplikasi market place untuk pembelian makanan dalam partai banyak dari para pelaku usaha katering atau kuliner.",
        imageUrl:
            "https://cdn.dribbble.com/users/4090044/screenshots/16561335/media/65d01c1fb3a1a5f2ad38715d1af87330.png"),
    PortofolioData(
        title: "Belanja Sedekah",
        description:
            "Aplikasi penjualan produk dengan konsep belanja sambil sedekah.",
        imageUrl:
            "https://cdn.dribbble.com/users/4090044/screenshots/16561079/media/4d5c3deef407d5f816fb9b15ed94f9a2.png"),
    PortofolioData(
        title: "Agen Belanja Sedekah",
        description:
            "Merupakan aplikasi untuk agen Belanja Sedekah.",
        imageUrl:
            "https://cdn.dribbble.com/users/4090044/screenshots/16561066/media/63ecc13bcc14076c34a12c6f74675faf.png"),
    PortofolioData(
        title: "Sahabat Wanita",
        description:
            "Aplikasi untuk membantu memantau kondisi kesehatan kewanitaan serta edukasi mengenai kesehatan wanita.",
        imageUrl:
            "https://cdn.dribbble.com/users/4090044/screenshots/16561204/media/469829e8f282ba15882530bcbc0085d6.png"),
    PortofolioData(
        title: "Kasir App",
        description:
        "Aplikasi kasir dan POS dengan fitur print nota.",
        imageUrl:
        "https://cdn.dribbble.com/users/4090044/screenshots/16561187/media/5ac6c7e62c5b156ea1f0b2f06e8c02a8.png"),
    PortofolioData(
        title: "Eye Cheker App",
        description:
        "Aplikasi untuk membantu dalam pengecekan gangguan, terapi, dan tips mengenai kesehatan mata.",
        imageUrl:
        "https://cdn.dribbble.com/users/4090044/screenshots/16561176/media/b60ff3d8027a246e111284db73151b3c.jpg"),
    PortofolioData(
        title: "Sunhope App Mobile Market",
        description:
        "Aplikasi market place untuk penjualan produk SunHope.",
        imageUrl:
        "https://cdn.dribbble.com/users/4090044/screenshots/16426924/media/9b40d864ce2108e172b79c9e25450a5c.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: isDarkMode
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "My name is",
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    height: 1,
                                    fontWeight: FontWeight.w200),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Muhammad \nYusuf Alqowy",
                                style: TextStyle(
                                    fontSize: 32,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "I'm a Android Developer with 2 years experience",
                                style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/image/ic_android.png",
                                    width: 24,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/image/ic_kotlin.png",
                                    width: 24,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/image/ic_java.png",
                                    width: 24,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/image/ic_git.png",
                                    width: 24,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/image/ic_rest_api.png",
                                    width: 24,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              )
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              // margin: const EdgeInsets.only(left: 8, bottom: 8),
                              child: Image.asset(
                                "assets/image/my_photo_profile.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyContact()));
                              },
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                  textStyle: const MaterialStatePropertyAll(
                                      TextStyle(fontSize: 11))),
                              child: const Text("Contact me", style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "About",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Text(
                  aboutMe,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.rubik(
                      fontSize: 11, fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Education",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const EducationProfile(degree: "Bachelor's degree", place: "Yogyakarta", school: "Amikom University", major: "Informatics Engineering", year: "2016-2020"),
                const EducationProfile(degree: "Senior High School", place: "Batang", school: "SMA Negeri 1 Batang", major: "Sains & Ilmu Teknologi", year: "2013-2016"),
                // const EducationProfile(degree: "Junior High School", place: "Bandar", school: "SMP Negeri 1", major: "Umum", year: "2010-2013"),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Experience",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const ExperienceProfile(position: "Asisten Praktikum", year: "2017-2018", company: "Amikom University", place: "Yogyakarta", task: "• Menjadi asisten praktikum matakuliah Algoritma dan Pemrograman semester ganjil dan genap."),
                const ExperienceProfile(position: "Desktop Developer Intern", year: "5 Nov 2018 - 25 Mei 2019", company: "Innovation Center Amikom University", place: "Yogyakarta", task: "• Berkolaborasi dengan atasan untuk mengembangkan aplikasi sistem penjadwalan ujian dan akademik yang berbasis desktop."),
                const ExperienceProfile(position: "Android Developer", year: "12 Oktober 2020 – 30 Juni 2021", company: "PT. Paket Nasi", place: "Yogyakarta", task: "• Bekerjasama dengan tim UI/UX dan Backend dalam pengembangan dan pembaharuan aplikasi.\n• Bekerjasama dengan tim untuk merancang sistem aplikasi yang sesuai dengan keinginan klien.\n• Melakukan pembangunan aplikasi berdasarkan konsep desain yang sudah disepakati.\n• Melakukan pengetesan aplikasi hingga berjalan sesuai dengan keinginan.\n• Mendeploy aplikasi ke PlayStore."),
                const ExperienceProfile(position: "Android Developer", year: "15 September 2021 – Now", company: "PT. Astra International", place: "North Jakarta", task: "• Bekerjasama dengan tim dalam pengembangan dan maintenance aplikasi.\n• Testing dan update perubahan code ke remote repository.\n• Build dan deploy aplikasi ke internal test.\n• Membuat CI/CD di Azure DevOps untuk depoy aplikasi."),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Skill",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                MySkill(title: "Java", progress: 60, level: "Advanced Beginner"),
                MySkill(title: "Kotlin", progress: 80, level: "Intermediate"),
                MySkill(title: "Android XML", progress: 70, level: "Intermediate"),
                MySkill(title: "Jetpack Compose", progress: 50, level: "Beginner"),
                MySkill(title: "React Native", progress: 40, level: "Beginner"),
                MySkill(title: "Flutter", progress: 40, level: "Beginner"),
                MySkill(title: "Laravel", progress: 50, level: "Advanced Beginner"),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Portofolio Project",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                for (PortofolioData data in listPortofolio)
                  PortofolioView(
                    data: data,
                  ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      launchUrlString("https://dribbble.com/yusufalqowy", mode: LaunchMode.externalApplication);
                    },
                    child: const Text("Show more"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
