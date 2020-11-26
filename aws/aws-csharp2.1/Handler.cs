using System;
using Amazon.Lambda.Core;
using Amazon.Lambda.APIGatewayEvents;

[assembly:LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace AwsDotnetCsharp
{
    public class Handler
    {
        public APIGatewayProxyResponse Hello(APIGatewayProxyRequest apigProxyEvent, ILambdaContext context) => new APIGatewayProxyResponse
        {
            StatusCode = 200,
            Body = "hello"
        };
    }
}