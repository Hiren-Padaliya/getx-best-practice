
/*
Http Response Codes Summary
200: OK. Everything worked as expected.
201: A resource was successfully created in response to a POST request. The Location header contains the URL pointing to the newly created resource.
204: The request was handled successfully and the response contains no body content (like a DELETE request).
304: The resource was not modified. You can use the cached version.
400: Bad request. This could be caused by various actions by the user, such as providing invalid JSON data in the request body, providing invalid action parameters, etc.
401: Authentication failed.
403: The authenticated user is not allowed to access the specified API endpoint.
404: The requested resource does not exist.
405: Method not allowed. Please check the Allow header for the allowed HTTP methods.
415: Unsupported media type. The requested content type or version number is invalid.
422: Data validation failed (in response to a POST request, for example). Please check the response body for detailed error messages.
429: Too many requests. The request was rejected due to rate limiting.
500: Internal server error. This could be caused by internal program errors.
*/

const int success=200;
const int created=201;
const int noContent=204;
const int notModified=304;
const int badRequest=400;
const int authFailed=401;
const int forbidden=403;
const int notFound=404;
const int methodNotAllowed=405;
const int unSupportedMedia=415;
const int unProcessableEntity=422;
const int tooManyRequest=429;
const int internalServer=500;
