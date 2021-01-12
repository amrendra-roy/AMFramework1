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
    case cancel
}

protocol APIClientManager {
    var session: URLSession { get } //it will create by Manager, that should be singleton
    func fetch<Template: Decodable>(with url: URL?, handler: @escaping(Result<Template, Framwork1Error>) ->Void)
}

extension APIClientManager {
    
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
                    if let data = data {
                        //print("RAW RESPONSE:\(String(data: data, encoding: .utf8) ?? "NA")")
                        do {
                            let genericModel = try JSONDecoder().decode(Template.self, from: data)
                            handler(.success(genericModel))
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
