package com.E_Comerse.Projects.CART_1;


import com.E_Comerse.Projects.PRODUCT_LIST.DataBases.DataBase;
import com.E_Comerse.Projects.PRODUCT_LIST.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.http.HttpStatus;
        import org.springframework.http.ResponseEntity;
        import org.springframework.web.bind.annotation.*;
        import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cart")
@CrossOrigin(origins = "*")
public class CartController {

    @Autowired
    private CartRepository cartDataRepository;

    @Autowired
    private DataBase productRepository;

    /**
     * Add a product to a user's cart.
     * Expects JSON with user and productId.
     */

//    @GetMapping("/getAllProducts/{user}")
//    public ResponseEntity<?> getAllProductsByUser(@PathVariable String user) {
//        List<Product> products = cartDataRepository.findProductsByUser(user);
//        if (products.isEmpty()) {
//            return ResponseEntity.notFound().build();
//        }
//        return ResponseEntity.ok(products);
//    }

    @GetMapping("/getAllProducts/{user}")
    public ResponseEntity<?> getAllProductsByUser(@PathVariable String user) {
        List<Product> products = cartDataRepository.findProductsByUser(user);
        // Return an empty list instead of a 404
        return ResponseEntity.ok(products);
    }


    @PostMapping("/add")
    public ResponseEntity<?> addProductToCart(@RequestParam String user,
                                              @RequestParam long productId) {
        // Retrieve the product from ProductRepository
        Optional<Product> optionalProduct = productRepository.findById(productId);
        if(optionalProduct.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Product not found with ID: " + productId);
        }
        Product product = optionalProduct.get();

        // Retrieve or create CartData for the us
        // ++er


























































































































































































        CartData cartData = cartDataRepository.findById(user)
                .orElse(new CartData(user, new ArrayList<>()));

        // Check if the product is already in the cart
        boolean alreadyExists = cartData.getProducts().stream()
                .anyMatch(p -> p.getId() == product.getId());
        if(alreadyExists) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body("Product already exists in the cart.");
        }

        cartData.getProducts().add(product);
        cartDataRepository.save(cartData);
        return ResponseEntity.ok("Product added to cart successfully.");
    }

    @DeleteMapping("/delete/{user}/{productId}")
    public ResponseEntity<?> deleteProductFromCart(@PathVariable String user,
                                                   @PathVariable long productId) {
        Optional<CartData> optionalCart = cartDataRepository.findById(user);
        if(optionalCart.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Cart not found for user: " + user);
        }
        CartData cartData = optionalCart.get();
        boolean removed = cartData.getProducts().removeIf(p -> p.getId() == productId);
        if(!removed){
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Product not found in the cart with ID: " + productId);
        }
        cartDataRepository.save(cartData);
        return ResponseEntity.ok("Product removed from cart successfully.");
    }
}
