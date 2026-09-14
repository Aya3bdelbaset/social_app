// import 'package:flutter/material.dart';
// import 'package:social_app/core/theme/app_text_styles.dart';


// import '../../../../core/theme/app_colors.dart';

// class SelectCategoryScreen extends StatefulWidget {
//   const SelectCategoryScreen({super.key});

//   @override
//   State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
// }

// class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
//   int? selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => setState(() => selectedIndex = null),
//       child: Scaffold(
//         backgroundColor: AppColors.background,
//         body: Column(
//           children: [
//             // header
//             const SelectCategoryHeader(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
//                 child: Column(
//                   children: [
//                     // 2. Title Text
//                     Text(
//                       'Who are you?',
//                       style: AppTextStyles.heading2.copyWith(
//                         color: AppColors.textPrimary,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                     ),
//                     const SizedBox(height: 32),

//                     // row 1,2 (Photographer , Video Creator)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 160,
//                           height: 190,
//                           child: SelectCategoryCard(
//                             title: 'Photographer',
//                             image: Image.asset(
//                               'assets/images/photographer.png',
//                               fit: BoxFit.cover,
//                             ),
//                             isSelected: selectedIndex == 0,
//                             onTap: () => setState(() => selectedIndex = selectedIndex == 0? null : 0),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 160,
//                           height: 190,
//                           child: SelectCategoryCard(
//                             title: 'Video Creator',
//                             image: Image.asset(
//                               'assets/images/video creator.png',
//                               fit: BoxFit.cover,
//                             ),
//                             isSelected: selectedIndex == 1,
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = selectedIndex == 1? null : 1;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 24, height: 24,),

//                     // row 3,4 (Illustrator , Designer)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: 160,
//                           height: 190,
//                           child: SelectCategoryCard(
//                             title: 'Illustrator',
//                             image: Image.asset(
//                               'assets/images/illustrator.png',
//                               fit: BoxFit.cover,
//                             ),
//                             isSelected: selectedIndex == 2,
//                             onTap: () => setState(() => selectedIndex = selectedIndex == 2? null :2),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 160,
//                           height: 190,
//                           child: SelectCategoryCard(
//                             title: 'Designer',
//                             image: Image.asset(
//                               'assets/images/designer.png',
//                               fit: BoxFit.cover,
//                             ),
//                             isSelected: selectedIndex == 3,
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = selectedIndex == 3 ? null : 3 ;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 28),

//                     // Sub Text
//                     Text(
//                       'SHARE - INSPIRE - CONNECT',
//                       style: AppTextStyles.bodyMedium.copyWith(
//                         color: AppColors.primary,
//                         letterSpacing: 2.0,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 24),

//                     // button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 60,
//                       child: ElevatedButton(
//                         onPressed: selectedIndex !=null ? () {} : null, 
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadiusGeometry.circular(24)
//                           )
//                         ),
//                         child: Text(
//                           'EXPLORE NOW',
//                             style: AppTextStyles.button.copyWith(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 2,
//                             ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }