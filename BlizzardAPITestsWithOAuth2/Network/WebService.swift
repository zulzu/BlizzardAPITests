
import Foundation

/// A protocol for a class that calls web services
protocol WebService: class {
    /// The base url of the web service to call
    func getBaseURL(region: APIRegion, apiType: APIType?) -> String
    /// Web service urls must include certain parameters, like namespace
    func appendSharedURLParameters(to urlStr: String, withNamespace namespace: String, region: APIRegion, locale: APILocale?) -> String
    /// Starts a web service request
    func callWebService(urlStr: String, method: HTTPMethod, apiType: APIType?, body: Data?, headers: [HTTPHeader], completion: @escaping (_ result: Result<Data, HTTPError>) -> Void)
}

extension WebService {
    /**
     Adds the optional locale and namespace parameters to the url string
     - parameter urlStr: The url string, typically without any query parameters
     - parameter namespace: The namespace, excluding the regional indentifier (ex. `"-us"`)
     - parameter region: The user's region
     - parameter locale: Ther user's locale
     */
    func appendSharedURLParameters(to urlStr: String, withNamespace namespace: String = "dynamic", region: APIRegion, locale: APILocale? = .en_US) -> String {
        guard var url = URL(string: urlStr) else {
            fatalError("The web service URL is invalid")
        }
        
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        url.appendQuery(parameters: ["namespace": namespace + region.namespaceExtension])
        
        return url.absoluteString
    }
    
    /**
     Configures and calls a web service and returns the response or an error through the completion
     - parameter url: The web service url
     - parameter method: The HTTP method
     - parameter apiType: The APIType used to configure Authorization
     - parameter body: The body to be sent with the call
     - parameter headers: Configures the HTTP request with the included headers. By default, the Accept and Content-Type headers are configured with json
     - parameter completion: Returns the web service response and error
     */
    func callWebService(urlStr: String, method: HTTPMethod, apiType: APIType? = nil, body: Data? = nil, headers: [HTTPHeader] = [], completion: @escaping (_ result: Result<Data, HTTPError>) -> Void) {
        guard let url = URL(string: urlStr) else {
            completion(.failure(HTTPError(type: .invalidRequest)))
            return
        }
        
        // Construct the default request
        if var request = Network.shared.createRequest(with: url, method: method, apiType: apiType) {
            // Add (or overwrite default) headers
            for header in headers {
                switch header {
                case .contentType(let mediaType):
                    request.setValue(mediaType.headerValue, forHTTPHeaderField: header.key)
                case .accept(let mediaType):
                    request.setValue(mediaType.headerValue, forHTTPHeaderField: header.key)
                }
            }
            
            // Add optional body
            request.httpBody = body
            
            // Make the request
            Network.shared.start(request) { result in
                completion(result)
            }
        }
        else {
            completion(.failure(HTTPError(type: .unauthorized)))
        }
    }
}
