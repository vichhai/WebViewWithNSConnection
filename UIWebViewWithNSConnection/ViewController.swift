//
//  ViewController.swift
//  UIWebViewWithNSConnection
//
//  Created by vichhai on 5/26/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLConnectionDelegate{
    @IBOutlet weak var webView: UIWebView!
    
    var webdata = NSMutableData()
    lazy var internetReachability = Reachability()
    let HUD = MBProgressHUD()
//    long long expectedLength;
//    long long currentLength;
    var expectedLength : Int64 = 0
    var currentLength : Int64 = 0

    /* Hide status bar */
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testNetworkConnection()
        let modelName = UIDevice.currentDevice().modelName
        
        println("model name \(modelName)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func connect() -> Void {
        var url =  NSURL(string: "http://www.khmer24.com")
        var request = NSURLRequest(URL: url!)
        var conn = NSURLConnection(request: request, delegate: self, startImmediately: true)
        let loading = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loading.mode = MBProgressHUDMode.Indeterminate
        loading.labelText = "Loading" 
    }
    
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        println("=-----> didReceiveResponse \(response)")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        self.webdata.appendData(conData)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println(self.webdata)
        self.webView.loadData(webdata, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: nil)
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
    }
   
   
    func testNetworkConnection() {
        
        if IJReachability.isConnectedToNetwork() {
            print("Internet Connection")
            self.connect()
        } else {
            print("No Internet Connection")
        }
        
        let statusConnection = IJReachability.isConnectedToNetworkOfType()
        switch statusConnection {
        case .WWAN:
            print("Connection Type WWAN")
        case .WiFi:
            print("Connection Type Wifi")
        case .NotConnected:
            print("No Internet Connection")
            
        }
        
    }
    
}

