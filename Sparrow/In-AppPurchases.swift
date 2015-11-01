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
 
 class Product: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    var funcWithPurchased: ()->()
    var funcWithFailded: ()->()
    private let ID: String!
    
    init(productID: String) {
        self.ID = productID
        self.funcWithPurchased = {
            print("Product - Purchase Sucsess func not init")
        }
        self.funcWithFailded = {
            print("Product - Purchase Faild func not init")
        }
    }
    
    func buy() {
        if (SKPaymentQueue.canMakePayments()) {
            SKPaymentQueue.defaultQueue().addTransactionObserver(self)
            let productRequest = SKProductsRequest(productIdentifiers: [self.ID])
            productRequest.delegate = self
            productRequest.start()
        } else {
            print("In-App Purchases - Can't make purchases");
        }
    }
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        let countProduct = response.products.count
        if (countProduct != 0) {
            for validProduct in response.products {
                print("In-App Purchases - About payment");
                print("Title:" + String(validProduct.localizedTitle))
                print("Description:" + String(validProduct.localizedDescription))
                print("Price:" + String(validProduct.price))
                print("In-App Purchases - Start buy product");
                let payment = SKPayment(product: validProduct)
                SKPaymentQueue.defaultQueue().addPayment(payment);
            }
        }
    }
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .Purchased:
                print("In-App Purchases - Product Purchased");
                self.funcWithPurchased()
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                break;
            case .Failed:
                print("In-App Purchases - Purchased Failed");
                self.funcWithFailded()
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                break;
            case .Restored:
                print("In-App Purchases - Restored Restored");
                self.funcWithPurchased()
                SKPaymentQueue.defaultQueue().finishTransaction(transaction)
                break;
            default:
                break;
            }
        }
    }
 }