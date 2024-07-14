import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.desPrice,
    required this.rate,
  });

  final String image;
  final String name;
  final String description;
  final String price;
  final String desPrice;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,  // Increased width
      height: 320.h, //Increased height
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [

            // Image And Heart Icon
            Stack(
              children: [
                // Image And Error Image
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: image.isNotEmpty
                      ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 100.w,  // Adjusted height to match the new container size
                    width: double.infinity,
                  )
                      : const Icon(
                    Icons.error,
                    size: 25,
                  ),
                ),

                // Heart IconProductComponent
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: IconButton(onPressed: (){}, icon: Image.asset('assets/image/heart.png',height: 22,width: 22,) )
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Name Product
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        color: AppColors.primary,
                        fontSize: 18.sp,  // Adjusted font size for larger container
                        fontWeight: FontWeight.w500),
                  ),
                  // Desc Product
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        color: AppColors.primary,
                        fontSize: 18.sp,  // Adjusted font size for larger container
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 12.h,  // Adjusted spacing
                  ),

                  // Price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'EGP: $price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                              color: AppColors.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          '$desPrice EGP',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                            color: AppColors.lightBlue,
                            fontSize: 16.sp,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 12.h,  // Adjusted spacing
                  ),

                  // Rating
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Review ($rate)',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  color: AppColors.primary,
                                  fontSize: 18.sp,  // Adjusted font size for larger container
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              IconlyBold.star,
                              size: 20.sp,
                              color: AppColors.yellow,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                    size: 19.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
