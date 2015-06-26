// The MIT License (MIT)
//
// Copyright (c) 2015 Ivan Vorobei (ivanvorobei@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import StoreKit

class Product {
    var ID: String!
    var funcWithPurchased: ()->()
    var funcWithFailded: ()->()
    
    init(productID: String) {
        self.ID = productID
        self.funcWithPurchased = {
            println("Product - Purchase Sucsess func not init")
        }
        self.funcWithFailded = {
            println("Product - Purchase Faild func not init")
        }
    }
}

private var buyingProduct: Product!

extension UIViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    func buy(product: Product){
        if (SKPaymentQueue.canMakePayments()) {
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
            buyingProduct = product
            var productID: NSSet = NSSet(object: product.ID);
            var productsRequest: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as Set<NSObject>)
            productsRequest.delegate = self
            productsRequest.start()
        } else {
            println("In-App Purchases - Can't make purchases");
        }
    }
    
    func restoringPurchases() {
        SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    }
    
    public func productsRequest (request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        var countProduct: Int = response.products.count
        if (countProduct > 0) {
            var validProduct: SKProduct = response.products[0] as! SKProduct
            println("In-App Purchases - About payment");
            println(validProduct.localizedTitle)
            println(validProduct.localizedDescription)
            println(validProduct.price)
            println("In-App Purchases - Start buy product");
            buyProduct(validProduct);
        }
    }
    
    func buyProduct(product: SKProduct){
        var payment = SKPayment(product: product)
        SKPaymentQueue.defaultQueue().addPayment(payment);
    }
    
    public func paymentQueue(queue: SKPaymentQueue!, updatedTransactions transactions: [AnyObject]!) {
        for transaction: AnyObject in transactions {
            if let trans: SKPaymentTransaction = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                case .Purchased:
                    println("In-App Purchases - Product Purchased");
                    buyingProduct.funcWithPurchased()
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                case .Failed:
                    println("In-App Purchases - Purchased Failed");
                    buyingProduct.funcWithFailded()
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                case .Restored:
                    println("In-App Purchases - Restored Restored");
                    buyingProduct.funcWithPurchased()
                    SKPaymentQueue.defaultQueue().finishTransaction(transaction as! SKPaymentTransaction)
                    break;
                default:
                    break;
                }
            }
        }
    }
}