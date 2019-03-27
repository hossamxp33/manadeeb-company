//
//  ApiServices.swift
//  Eyes
//
//  Created by MAC on 1/20/18.
//  Copyright © 2018 codesroots. All rights reserved.
//


import UIKit


class ApiService : NSObject {
    
    static let SharedInstance = ApiService()
    
    //   http://manadeeb.codesroots.com/api
   // http://192.168.1.16/manadeeb/api
    let baseUrl = NSString(format: "http://manadeeb.codesroots.com/api")
    let defaults = UserDefaults.standard

    func request(URL:String) -> NSMutableURLRequest {
        let request : NSMutableURLRequest = NSMutableURLRequest()
        print(self.defaults.string(forKey: "token"))
        request.url = NSURL(string: NSString(format: "%@", "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if self.defaults.string(forKey: "token") != nil {
            request.addValue("Bearer \(self.defaults.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        }
        
        let defaults = UserDefaults.standard
        return request
    }
    
    func fetchFeedForUrl(URL:String,completion: @escaping (Data) -> ()) {
        URLSession.shared.dataTask(with:request(URL: URL) as URLRequest , completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async (execute: {
                completion(data!)
            })
            
        }) .resume()
    }
    
    func LoginWithSwift (URL:String,dataarr:[String:String]?,completion:@escaping (Data)->()){
        //   guard let ratess = dataarr else { return }
        
        let parameters = dataarr as! Dictionary<String, String>
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "Post"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if self.defaults.string(forKey: "token") != nil {
            request.addValue("Bearer \(self.defaults.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async (execute: {
                completion(data!)
            })
            
        }) .resume()
    }
    ///////
    
    func Login (URL:String,dataarr:[String : Any]?,completion:@escaping ([String:AnyObject])->()){
        //   guard let ratess = dataarr else { return }
        
        let parameters = dataarr as! Dictionary<String, Any>
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "Post"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if self.defaults.string(forKey: "token") != nil {
            request.addValue("Bearer \(self.defaults.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            print(httpResponse)
            switch (httpResponse.statusCode)
            {
            case 201:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 200:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 401:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
            case 422:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case -1002:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
                
            default:
                print("wallet GET request got response \(httpResponse.statusCode)")
            }
        }) .resume()
    }
    
    
    
    
    
    
    /////////// post ary Of object
    func Post (URL:String,dataarr:[[String:String]]?,completion:@escaping ([String:AnyObject])->()){
        //   guard let ratess = dataarr else { return }
        
        let parameters = dataarr as! [[String:String]]
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "Post"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if self.defaults.string(forKey: "token") != nil {
            request.addValue("Bearer \(self.defaults.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            print(httpResponse)
            switch (httpResponse.statusCode)
            {
            case 201:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 200:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 401:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
            case 422:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 500:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
                
            default:
                print("wallet GET request got response \(httpResponse.statusCode)")
            }
        }) .resume()
        
    }
    ////////////////
    
    /////////// post ary Of object
    func PostAny (URL:String,dataarr:[[String:Any]]?,completion:@escaping ([String:AnyObject])->()){
        //   guard let ratess = dataarr else { return }
        
        let parameters = dataarr as! [[String:Any]]
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "Post"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        if self.defaults.string(forKey: "token") != nil {
            request.addValue("Bearer \(self.defaults.string(forKey: "token")!)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            print(httpResponse)
            switch (httpResponse.statusCode)
            {
            case 201:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 200:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 401:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
            case 422:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 500:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
                
            default:
                print("wallet GET request got response \(httpResponse.statusCode)")
            }
        }) .resume()
        
    }
    

    
    
    
    
    
    
    
    func PutEdits (URL:String,dataarr:[String:String],completion:@escaping ([String:AnyObject])->()){
        let defaults = UserDefaults.standard
        let parameters = dataarr as Dictionary<String, String>
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "Put"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            print(httpResponse)
            switch (httpResponse.statusCode)
            {
            case 201:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 200:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 401:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
            case 422:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
                
            default:
                print("wallet GET request got response \(httpResponse.statusCode)")
            }
        }) .resume()
        
    }
    
//    func Register(URL:String,dataarr:[String:String],images:UIImage,completion:@escaping ([String:AnyObject])->()){
//        let defaults = UserDefaults.standard
//        let parameters = dataarr as Dictionary<String, String>
//
//        let configuration = URLSessionConfiguration .default
//        let session = URLSession(configuration: configuration)
//
//
//        let request : NSMutableURLRequest = NSMutableURLRequest()
//        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
//        request.httpMethod = "Post"
//        request.timeoutInterval = 30
//        let boundary = generateBoundaryString()
//
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        var imagarr = [Data]()
//
//
//        if(images==nil)  { return; }
//        // let imageData = UIImageJPEGRepresentation(images[0], 1)
//        imagarr.append(UIImageJPEGRepresentation(images, 1)!)
//
//
//
//
//
//
//
//        //   myActivityIndicator.startAnimating();
//        //       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        request.httpBody = createBodyWithParameter(filePathKey: "file", parameters: parameters, imageDataKey: images, boundary: boundary) as Data
//
//        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
//            if error != nil {
//                print(error)
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
//                else {
//                    print("error: not a valid http response")
//                    return
//            }
//            print(response)
//            switch (httpResponse.statusCode)
//            {
//            case 201:
//                do {
//                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
//                    print(receivedData)
//                    DispatchQueue.main.async (execute: {
//                        completion(getResponse  as! [String : AnyObject])
//                    })
//                } catch let error as NSError {
//                    print(error)
//                }
//            case 200:
//                do {
//                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
//                    print(getResponse)
//                    DispatchQueue.main.async (execute: {
//                        completion(getResponse  as! [String : AnyObject])
//                    })
//                } catch let error as NSError {
//                    print(error)
//                }
//            case 401:
//                do {
//                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
//                    print(getResponse)
//                    DispatchQueue.main.async (execute: {
//                        completion(getResponse  as! [String : AnyObject])
//                    })
//                } catch let error as NSError {
//                    print(error)
//                }
//                break
//            case 500:
//                do {
//                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
//                    print(getResponse)
//                    DispatchQueue.main.async (execute: {
//                        completion(getResponse  as! [String : AnyObject])
//                    })
//                } catch let error as NSError {
//                    print(error)
//                }
//                break
//
//            default:
//                print("wallet GET request got response \(httpResponse.statusCode)")
//            }
//        }) .resume()
//    }
//    func createBodyWithParameter( filePathKey: String?, parameters:[String:Any],imageDataKey: UIImage, boundary: String) -> NSData {
//        let body = NSMutableData();
//
//        if parameters != nil {
//            for (key, value) in parameters {
//                body.appendString(string: "--\(boundary)\r\n")
//                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
//                body.appendString(string: "\(value)\r\n")
//            }
//        }
//        if  imageDataKey  != nil {
//            let i = 0
//
//            //            if imageDataKey.cgImage == nil {
//            //                guard let ciImage = imageDataKey.ciImage, let cgImage = CIContext(options: nil).createCGImage(ciImage, from: ciImage.extent) else { return nil }
//            //
//            //                imageDataKey = UIImage(CGImage: cgImage)
//            //            }
//            let filename = "\(i)user-profile.jpg"
//            let mimetype = "image/jpg"
//            _ = CIContext(options:nil)
//
//            // And here's the updated code in a function:
//
//
//            if let grayImage = convertToGrayscale(image: imageDataKey)
//            {
//                let data: NSData? = UIImageJPEGRepresentation(grayImage, 1.0) as! NSData
//                body.appendString(string: "--\(boundary)\r\n")
//                body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
//                body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
//
//                body.append(data! as Data)
//                body.appendString(string: "\r\n")
//            }
//
//
//
//        }
//
//        body.appendString(string: "--\(boundary)--\r\n")
//
//
//        return body
//    }
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    func Upload(URL:String,dataarr:[String:Any],image:UIImage,completion:@escaping ([String:AnyObject])->()){
        let defaults = UserDefaults.standard
        // let parameters = dataarr as Dictionary<String, Any>
        let parameters = dataarr as! [String:Any]
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)


        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@",  "\(baseUrl)/\(URL)") as String) as URL?
        request.httpMethod = "Post"
        request.timeoutInterval = 30
        let boundary = generateBoundaryString()

        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        //   myActivityIndicator.startAnimating();
        //       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        request.httpBody = createBodyWithParameters(filePathKey: "photo",parameters:parameters ,imageDataKey: image, boundary: boundary) as Data

        URLSession.shared.dataTask(with:request as URLRequest , completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            print(response)
            switch (httpResponse.statusCode)
            {
            case 201:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(receivedData)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 200:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
            case 401:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break
            case 500:
                do {
                    let getResponse = try JSONSerialization.jsonObject(with: receivedData, options: .allowFragments)
                    print(getResponse)
                    DispatchQueue.main.async (execute: {
                        completion(getResponse  as! [String : AnyObject])
                    })
                } catch let error as NSError {
                    print(error)
                }
                break

            default:
                print("wallet GET request got response \(httpResponse.statusCode)")
            }
        }) .resume()
    }
    func convertToGrayscale(image: UIImage)->UIImage?
    {
        let imageContext = CIContext(options:nil)

        // Set up grayscale and blur filters:
        //        let filter1_grayIze = CIFilter(name: "CIColorControls")
        //        let filter2_blur = CIFilter(name: "CIGaussianBlur")
        //        filter1_grayIze?.setValue(0, forKey:kCIInputSaturationKey)
        //        filter1_grayIze?.setValue(0.5, forKey: kCIInputBrightnessKey)
        //        filter2_blur?.setValue(4, forKey: kCIInputRadiusKey)
        //
        // Go!
        let originalImage = CIImage(image: image)
        //        filter1_grayIze?.setValue(originalImage, forKey: kCIInputImageKey)
        //        filter2_blur?.setValue(filter1_grayIze?.outputImage, forKey: kCIInputImageKey)
        //        let outputCIImage = filter2_blur?.outputImage

        let temp:CGImage = imageContext.createCGImage(originalImage!, from: originalImage!.extent)!
        let ret = UIImage(cgImage : temp)
        return ret
    }

    func createBodyWithParameters( filePathKey: String?, parameters:[String:Any],imageDataKey: UIImage, boundary: String) -> NSData {
        let body = NSMutableData();

        if parameters != nil {
            for (key, value) in parameters {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        if  imageDataKey  != nil {
            let i = 0

            //            if imageDataKey.cgImage == nil {
            //                guard let ciImage = imageDataKey.ciImage, let cgImage = CIContext(options: nil).createCGImage(ciImage, from: ciImage.extent) else { return nil }
            //
            //                imageDataKey = UIImage(CGImage: cgImage)
            //            }
            let filename = "\(i)user-profile.jpg"
            let mimetype = "image/jpg"
            _ = CIContext(options:nil)

            // And here's the updated code in a function:


            if let grayImage = convertToGrayscale(image: imageDataKey)
            {
                let data: NSData? = UIImageJPEGRepresentation(grayImage, 0.7) as! NSData
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
                body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")

                body.append(data! as Data)
                body.appendString(string: "\r\n")
            }



        }

        body.appendString(string: "--\(boundary)--\r\n")


        return body
    }
}



