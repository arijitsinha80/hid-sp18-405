# swagger_client.DefaultApi

All URIs are relative to *http://localhost:8080/nlp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**all_input_get**](DefaultApi.md#all_input_get) | **GET** /all/{input} | 
[**depparse_input_get**](DefaultApi.md#depparse_input_get) | **GET** /depparse/{input} | 
[**entity_input_get**](DefaultApi.md#entity_input_get) | **GET** /entity/{input} | 
[**pos_input_get**](DefaultApi.md#pos_input_get) | **GET** /pos/{input} | 


# **all_input_get**
> ALLFEATURE all_input_get(input)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
input = 'input_example' # str | Sentence to be analyzed

try:
    api_response = api_instance.all_input_get(input)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->all_input_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **input** | **str**| Sentence to be analyzed | 

### Return type

[**ALLFEATURE**](ALLFEATURE.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **depparse_input_get**
> DEPPARSED depparse_input_get(input)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
input = 'input_example' # str | Sentence to be dependency-parsed

try:
    api_response = api_instance.depparse_input_get(input)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->depparse_input_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **input** | **str**| Sentence to be dependency-parsed | 

### Return type

[**DEPPARSED**](DEPPARSED.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **entity_input_get**
> ENTITY entity_input_get(input)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
input = 'input_example' # str | Sentence to be parsed

try:
    api_response = api_instance.entity_input_get(input)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->entity_input_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **input** | **str**| Sentence to be parsed | 

### Return type

[**ENTITY**](ENTITY.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pos_input_get**
> TAGGED pos_input_get(input)



### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
input = 'input_example' # str | Sentence to be tagged

try:
    api_response = api_instance.pos_input_get(input)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->pos_input_get: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **input** | **str**| Sentence to be tagged | 

### Return type

[**TAGGED**](TAGGED.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

