import 'package:ecommerce_app_with_tdd/core/constants/extensions/size.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/data/repository/eCommerceRepositoryImpl.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/domain/usecase/eCommerceUseCase.dart';
import 'package:ecommerce_app_with_tdd/modules/e_commerce/presentation/cubit/e_commerce/e_commerce_cubit.dart';
import 'package:ecommerce_app_with_tdd/utils/enum.dart';
import 'package:ecommerce_app_with_tdd/utils/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late ECommerceCubit eCommerceCubit;

  @override
  void initState() {
    eCommerceCubit = ECommerceCubit(GetEcommerceUseCase(
        repo: RepositoryProvider.of<ECommerceRepositoryImpl>(context)))
      ..getdatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: eCommerceCubit,
      child: BlocListener<ECommerceCubit, EcommerceState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        },
        listenWhen: (state1, state2) {
          return state2.status == ActionStatus.isError;
        },
        child: BlocBuilder<ECommerceCubit, EcommerceState>(
          builder: (context, state) {
            if (state.status == ActionStatus.isLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state.status == ActionStatus.isSuccess) {
              print("salom");
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "52,082+ Iteams ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 61.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [Text("Sort"), Icon(Icons.swap_vert)],
                              ),
                            ),
                            addWidth(12.w),
                            Container(
                              width: 61.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Filter"),
                                  Icon(Icons.filter_alt_outlined)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    addHeigth(17.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 16.h,
                            crossAxisCount: 2,
                            crossAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Image.asset("assets/images/circle.png"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data[index].title.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      addHeigth(4.h),
                                      Text(
                                        "Autumn And Winter Casual cotton-padded jacket...",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      addHeigth(4.h),
                                      Text(
                                          // "${state.data!.products[index].currencySymbol}${state.data!.products[index].price.toString()}",
                                          'salom',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      addHeigth(4.h),
                                      SizedBox(
                                          height: context.heigth * 0.025,
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    5,
                                                    (index) => InkWell(
                                                        onTap: () {},
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 18.sp,
                                                          color: Colors.orange,
                                                        ))),
                                              ),
                                              addWidth(4.w),
                                              Text("1,515")
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("xatolik ${state.error}"),
              );
            }
          },
        ),
      ),
    );
  }
}
