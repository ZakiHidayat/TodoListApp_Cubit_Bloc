import 'package:crud_todolist_cubit_bloc/cubit/product_cubit.dart';
import 'package:crud_todolist_cubit_bloc/routes/app_route.dart';
import 'package:crud_todolist_cubit_bloc/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class EditProductPage extends StatelessWidget {
  final Product? product;
  EditProductPage({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: product!.title);
    final priceController = TextEditingController(text: product!.desc.toString());

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
            'Edit Product',
            style: GoogleFonts.spaceGrotesk(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.black
        ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-color-img.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'List Title',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                  controller: nameController,
                  hintText: 'List Title'
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Desc Title',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomInput(
                  controller: priceController,
                  hintText: 'Desc Title'),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                backgroundColor: AppTheme.purpleColor,
                height: 50,
                onPressed: () {
                  final inputProduct = Product(
                      id: product!.id!,
                      title: nameController.text,
                      desc: priceController.text);
                  context.read<ProductCubit>().updateProduct(inputProduct);
                  Navigator.of(context).pushReplacementNamed(AppRoute.homePage);
                },
                title: 'Update',
              )
            ],
          ),
        ),
      ),
    );
  }
}
