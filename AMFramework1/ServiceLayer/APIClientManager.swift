//
//  APIClientManager.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

public enum Framwork1Error: Error {
    case requestFailed //when invalid url
    case jsonConversionFailure(String?)
    case invalidResponse(statusDescCode:String?, message:String?)
    case invalidData
}

protocol APIClientManager {
    var session: URLSession { get } //it will create by Manager, that should be singleton
    func fetch<Template: Decodable>(wtih request: URLRequest, handler: @escaping(Result<Template, Framwork1Error>) ->Void)
    func fetch<Template: Decodable>(with url: URL?, handler: @escaping(Result<[Template], Framwork1Error>) ->Void)
}

extension APIClientManager {
    
    func fetch<Template: Decodable>(wtih request: URLRequest, handler: @escaping(Result<Template, Framwork1Error>) ->Void) {
        print("URL: \(request.url!)")
        if let data = request.httpBody {
            let stringbody = String(data: data, encoding: String.Encoding.utf8)
            print("Body:\(stringbody ?? "Invalid")")
        }

        if let headers = request.allHTTPHeaderFields {
            print("Header: \(headers)")
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            /*DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse else {
                    handler(.failure(.requestFailed))
                    return
                }
                if httpResponse.statusCode == 200 {
                    if let data = data, let readableData = String(data: data, encoding: .utf8) {
                        print("RAW RESPONSE:\(String(data: data, encoding: .utf8) ?? "NA")")
                        do {
                            let genericModel = try JSONDecoder().decode(Template.self, from: data)
                            print("Response for \(Template.self):\(genericModel)")
                            handler(.success(genericModel))
                        } catch(let error) {
                            print("fetch error on catch block:\(error)")
                            // parse error message and description code
                            if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
                                let resDesc = jsonData["respDesc"] as? String {
                                handler(.failure(.invalidResponse(statusDescCode: "", message: resDesc)))
                            } else {
                                handler(.failure(.jsonConversionFailure(readableData)))
                            }
                        }
                    } else {
                        handler(.failure(.invalidData))
                    }
                } else {
                    print("Failed Response: \(httpResponse)")
                    handler(.failure(.invalidResponse(statusDescCode: nil,message: nil)))
                }
            }*/
        }
        task.resume()
    }
    
    func fetch<Template: Decodable>(with url: URL?, handler: @escaping(Result<Template, Framwork1Error>) ->Void) {
        print("URL: \(String(describing: url))")
        guard let url = url else {
            return handler(.failure(.requestFailed))
        }
                
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse else {
                    handler(.failure(.requestFailed))
                    return
                }
                if httpResponse.statusCode == 200 {
                    if let data = data, let readableData = String(data: data, encoding: .utf8) {
                        print("RAW RESPONSE:\(String(data: data, encoding: .utf8) ?? "NA")")
                        do {
                            let genericModel = try JSONDecoder().decode([Template].self, from: data)
                            print("Response for \(Template.self):\(String(describing: genericModel))")
                            handler(.success(genericModel ))
                        } catch(let error) {
                            print("fetch error on catch block:\(error)")
                            handler(.failure(.invalidResponse(statusDescCode: "", message: error.localizedDescription)))
                        }
                    } else {
                        print("fetch error on httpResponse.statusCode block")
                        handler(.failure(.invalidData))
                    }
                } else {
                    print("Failed Response: \(httpResponse)")
                    handler(.failure(.invalidResponse(statusDescCode: nil,message: nil)))
                }
            }
        }
        task.resume()
    }
}
