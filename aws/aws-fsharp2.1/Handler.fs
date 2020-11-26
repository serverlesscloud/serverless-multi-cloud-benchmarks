namespace AwsDotnetFsharp
open Amazon.Lambda.Core

[<assembly:LambdaSerializer(typeof<Amazon.Lambda.Serialization.Json.JsonSerializer>)>]
do ()
    
module Handler =
    open Amazon.Lambda.APIGatewayEvents

    let hello(_:APIGatewayProxyRequest, _:ILambdaContext): APIGatewayProxyResponse =
        let response = APIGatewayProxyResponse()
        response.StatusCode <- 200
        response.Body <- "hello"
        response