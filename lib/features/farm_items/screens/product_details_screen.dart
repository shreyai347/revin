import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Section
            _buildProductImage(),
            
            SizedBox(height: 20.h),
            
            // Product Info Section
            _buildProductInfo(),
            
            SizedBox(height: 20.h),
            
            // Quantity Selector
            _buildQuantitySelector(),
            
            SizedBox(height: 20.h),
            
            // Product Description
            _buildProductDescription(),
            
            SizedBox(height: 100.h), // Space for bottom button
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 20.w,
        ),
      ),
      title: Text(
        'Product Details',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey[600],
            size: 18.w,
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image.asset(
          widget.product['image'],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF2E7D32).withOpacity(0.1),
                    const Color(0xFF4CAF50).withOpacity(0.1),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(40.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2E7D32).withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    _getProductIcon(widget.product['name']),
                    color: const Color(0xFF2E7D32),
                    size: 60.w,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    )
    .animate()
    .scale(
      duration: 600.ms,
      curve: Curves.elasticOut,
      begin: const Offset(0.8, 0.8),
      end: const Offset(1.0, 1.0),
    )
    .fadeIn(duration: 600.ms);
  }

  Widget _buildProductInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Name and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.product['name'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                widget.product['price'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8.h),
          
          // Availability
          Text(
            'Available in stock',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          SizedBox(height: 12.h),
          
          // Rating
          Row(
            children: [
              ...List.generate(5, (index) {
                if (index < 4) {
                  return Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 20.w,
                  );
                } else {
                  return Icon(
                    Icons.star_half_rounded,
                    color: Colors.amber,
                    size: 20.w,
                  );
                }
              }),
              SizedBox(width: 8.w),
              Text(
                '4.5',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    )
    .animate(delay: 200.ms)
    .slideY(
      begin: 0.3,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOut,
    )
    .fadeIn(duration: 600.ms);
  }

  Widget _buildQuantitySelector() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                // Minus Button
                GestureDetector(
                  onTap: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: _quantity > 1 ? Colors.grey[100] : Colors.grey[50],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: Icon(
                      Icons.remove_rounded,
                      color: _quantity > 1 ? Colors.black : Colors.grey[400],
                      size: 20.w,
                    ),
                  ),
                ),
                
                // Quantity Display
                Container(
                  width: 60.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${_quantity}kg',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                
                // Plus Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.black,
                      size: 20.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
    .animate(delay: 400.ms)
    .slideY(
      begin: 0.3,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOut,
    )
    .fadeIn(duration: 600.ms);
  }

  Widget _buildProductDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(height: 12.h),
          
          Text(
            _isExpanded 
              ? 'Our premium ${widget.product['name']} embodies the promise of a bountiful harvest. Sourced from trusted cultivators, these seeds are meticulously selected to ensure optimal growth, disease resistance, and maximum yield. Each seed is carefully tested for germination rate and quality, guaranteeing farmers the best possible results for their agricultural endeavors. Our commitment to sustainable farming practices means these seeds are not only high-yielding but also environmentally friendly.'
              : 'Our premium ${widget.product['name']} embodies the promise of a bountiful harvest. Sourced from trusted cultivators, these seeds are meticulously selected to ensure.',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
          
          SizedBox(height: 8.h),
          
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Read Less' : 'Read More',
              style: TextStyle(
                color: const Color(0xFF2E7D32),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    )
    .animate(delay: 600.ms)
    .slideY(
      begin: 0.3,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOut,
    )
    .fadeIn(duration: 600.ms);
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _addToCart();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    )
    .animate(delay: 800.ms)
    .slideY(
      begin: 1.0,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOut,
    )
    .fadeIn(duration: 600.ms);
  }

  IconData _getProductIcon(String productName) {
    switch (productName.toLowerCase()) {
      case 'rice seed':
        return Icons.grain_rounded;
      case 'lemon tree':
        return Icons.local_florist_rounded;
      case 'wheat seed':
        return Icons.eco_rounded;
      case 'cherry tree':
        return Icons.park_rounded;
      default:
        return Icons.agriculture_rounded;
    }
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product['name']} (${_quantity}kg) added to cart!'),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
