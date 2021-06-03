import Foundation
import Combine

public final class NetworkService {
    
    public static let shared = NetworkService()
    
    private init() {}
    
    public func accessToken(_ tokenRequest: TokenRequest, accessKey: String = Environment.accessKey) -> AnyPublisher<TokenResponse, Error> {
        var request = URLRequest(url: Endpoint.accessToken.url)
        request.setHttpMethod(.post)
        request.setValue(.accept)
        request.setValue(.contentType)
        request.setValue(.accessKey(accessKey))
        request.httpBody = tokenRequest.jsonData
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: TokenResponse.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(Endpoint.accessToken.url)
                default:
                    print(error)
                    return Error.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func generalInfo(accessToken: String, accessKey: String = Environment.accessKey) -> AnyPublisher<GeneralInfoResponse, Error> {
        var request = URLRequest(url: Endpoint.generalInfo(accessToken).url)
        request.setHttpMethod(.get)
        request.setValue(.accept)
        request.setValue(.contentType)
        request.setValue(.accessKey(accessKey))
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter.iso8601Full
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: GeneralInfoResponse.self, decoder: decoder)
            .mapError { error -> Error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(Endpoint.generalInfo(accessToken).url)
                default:
                    return Error.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
    
}


extension DateFormatter {
    
    static let iso8601Full: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
         return formatter
    }()
    
}


