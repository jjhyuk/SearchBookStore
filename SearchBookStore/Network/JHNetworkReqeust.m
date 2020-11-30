//
//  JHNetworkReqeust.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "JHNetworkReqeust.h"
#import "NSDictionary+Extension.h"

@implementation JHNetworkReqeust

+(void) excute:(JHHttpMethod) method
          path:(NSString * _Nonnull) relativePath
         param:(NSDictionary * _Nullable) params
       handler:(reqeustCompletionHandler _Nonnull) handler
{
  if(!relativePath){
    NSError *serverError = [NSError errorWithDomain:JHErrorDomain
                                               code:PARAMETER_ERROR_BASE
                                           userInfo:@{NSLocalizedDescriptionKey:@"There are no parameters"}];
    handler(nil, nil, serverError);
    return;
  }
  NSString *url = [NSString stringWithFormat:@"%@%@",[JHConfiguration BaseURL],relativePath];
  NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
  
  if(params){
    NSString *queryString = [params urlEncodedString];
    if(method == GET){
      url = [NSString stringWithFormat:@"%@?%@",url,queryString];
      params = nil;
    }
    else if(method == POST){
      [urlRequest setHTTPBody:[queryString dataUsingEncoding:NSUTF8StringEncoding]];
    }
  }
  
  NSString *httpMethod = [self convertHttpMethod:method];
  [urlRequest setHTTPMethod:httpMethod];
  
  NSURLSessionConfiguration * defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:nil delegateQueue:nil];
  NSLog(@"DiskCache: %@ of %@", @([[NSURLCache sharedURLCache] currentDiskUsage]), @([[NSURLCache sharedURLCache] diskCapacity]));
  NSLog(@"MemoryCache: %@ of %@", @([[NSURLCache sharedURLCache] currentMemoryUsage]), @([[NSURLCache sharedURLCache] memoryCapacity]));
  JHLog(@"\n\nReqeust===================================================================\n\nURL: %@\n\nMETHOD: %@\n\nPARAMETERS: %@\n\n==========================================================================",url,httpMethod,params);
  
  NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                    {

    if(error) {
      // Network Error Handler
      handler(nil, nil, error);
      return;
    }
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if(httpResponse.statusCode == 200)
    {
      NSError *parseError = nil;
      NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
      JHLog(@"\n\nResponse==================================================================\n\n%@\n\n==========================================================================",responseDictionary);
      
      if([[responseDictionary objectForKey:@"error"] intValue] == 0){
        JHLog();
        
        // Keyword
        NSString *reqeustURL = [[[response URL] pathComponents] objectAtIndex:3];
        handler(responseDictionary, reqeustURL, nil);
        return;
      }
      else {
        // ServerError
        NSError *serverError = [NSError errorWithDomain:JHErrorDomain
                                                   code:SERVER_ERROR_BASE - [[responseDictionary objectForKey:@"error"] intValue]
                                               userInfo:@{NSLocalizedDescriptionKey:@"There was an error in the server response"}];
        handler(nil, nil, serverError);
        return;
      }
    }
    else
    {
      // HTTP Status Error Case excluding '200' Handler
      NSError *statusError = [NSError errorWithDomain:JHErrorDomain
                                                 code:HTTP_ERROR_BASE - httpResponse.statusCode
                                             userInfo:@{NSLocalizedDescriptionKey:@"A network error has occurred"}];
      handler(nil, nil, statusError);
      return;
    }
  }];
  [dataTask resume];
}


+(NSString *)convertHttpMethod:(JHHttpMethod) method{
  switch (method) {
    case GET:
      return @"GET";
      break;
    case POST:
      return @"POST";
      break;
    case PUT:
      return @"PUT";
      break;
    case DELETE:
      return @"DELETE";
      break;
      
    default:
      return @"GET";
      break;
  }
}
@end
