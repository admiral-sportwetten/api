# ADMIRAL API

This is the documentation for the Admiral Sportwetten GmbH public API.

> THE DOCUMENTATION IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS DOCUMENTATION.

The document describes the full extend of the APIs functionality, which does not
imply that you can use it is the described extend.

Depending on your access privileges some functionality of the API may be prohibited.

## Applying for API access keys

TBD

## HTTP verbs used

As usual with REST APIs HTTP verbs are used to determine the api calls intentions.

Except for special cases the following meanings, for HTTP verbs,  will be assumed:

| Verb     | Description     |
| :------------- | :------------- |
| POST | Create a new resource |
| GET | Retrieve an existing resource |
| PUT | Update an existing resource or create a new one |
| DELETE | Delete an existing resource |

## HTTP return codes

| Status code | Description     |
| :------------- | :------------- |
| 200 | The request has completed successfully and a response is provided |
| 201 | The request has completed successfully and the item is creates successfully |
| 204 | The request has completed successfully but no response is required |
| 202 | The request has completed successfully but the request processing has not finished yet |
| 206 | The request has completed successfully but the returned resource is only partial |
| 304 | The requested document was not modified |
| 400 | The request could not be understood by the server |
| 401 | The request requires user authentication which was not provided |
| 403 | The server understood the request but the request is not authorized to access the desired resource |
| 404 | The requested resource was not found |
| 419 | The Authentication timed out |
| 429 | The server will not process the request because the request quota is reached |
| 500 | The server encountered an unrecoverable exception, which prevents the request to complete |
| 501 | The requested functionality is not implemented or you are not authorized to use it |

## Headers

The _Admiral API_ takes full advantage of _HTTP headers_. Some headers can be
added to the request to influence the API response, while some headers are
added by the API itself to include additional meta-information in the response.

 ### Accept-Language

 If the _Accept-Language_ header is used in any request then the API will try to return
 a localized version of the response.

 The texts will most probably not be localized but the date, time and number
 formats will be localized.

 Taking that the following Language header is present in the request

        Accept-Language:`en-US,en;q=0.8,de-AT;q=0.6,de;q=0.4,sl;q=0.2`

Then the __en-US__ locale will be used to localize the response.

### Cache-Control

Each response will include a _Cache-Control_ header denoting if the response can
or can not be cached, or how the caching of the response should be handled.

The cache options include but are not limited to:

| Cache option | Description |
| :--- | :--- |
| public | The response my be cached using any cache, event a public shared cache |
| private | The response is only intended for a single user and may not be cached in a shared cache |
| no-cache | The response can not be cached on the client |

### Content-MD5

For some security critical information an additional _Content-MD5_ header my be included in the response.

        Content-MD5:  Q2hlY2sgSW50ZWdyaXR5IQ==

The MD5 header is generated as described in [RFC1864](https://tools.ietf.org/html/rfc1864)

### Expires

The expires header is included in all responses and denotes when the response is
to be considered obsolete.

_Note:_ The expiration header does not imply that the resource will in any way change after the expiration date is reached.

        Expires: Thu, 01 Dec 1994 16:00:00 GMT

### If-Modified-Since

The _If-Modified-Since_ header can be used to make a __GET__ request conditional.
If the header is included in a API request the result to be returned will be
additionally filtered for resources that have changed after the provided date.

        If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT

Taking the example above only resources changed since 1994-10-29T19:43:31Z will
be returned.

### Last-Modified

The _Last-Modified_ header is included in an API response and denotes the last
modification date of the resource.

        Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT

### X-AAPI-RequestId

Each response includes an _X-AAPI-RequestId_ header. This header contains an
unique string that can be used to investigate API failures or too determine
which request lead to which response.

        X-AAPI-RequestId: 806cbbcd-99c7-467e-a6a1-d976841518e7

### X-AAPI-Response-Time

Each response includes an _X-AAPI-Response-Time_ header. This header contains
the time taken for the request processing in milliseconds.

        X-AAPI-Response-Time: 78
