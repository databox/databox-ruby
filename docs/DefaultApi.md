# Databox::DefaultApi

All URIs are relative to *https://push.databox.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**data_delete**](DefaultApi.md#data_delete) | **DELETE** /data |  |
| [**data_metric_key_delete**](DefaultApi.md#data_metric_key_delete) | **DELETE** /data/{metricKey} |  |
| [**data_post**](DefaultApi.md#data_post) | **POST** /data |  |
| [**metrickeys_get**](DefaultApi.md#metrickeys_get) | **GET** /metrickeys |  |
| [**metrickeys_post**](DefaultApi.md#metrickeys_post) | **POST** /metrickeys |  |
| [**ping_get**](DefaultApi.md#ping_get) | **GET** /ping |  |


## data_delete

> data_delete



### Examples

```ruby
require 'time'
require 'databox'
# setup authorization
Databox.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Databox::DefaultApi.new

begin
  
  api_instance.data_delete
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->data_delete: #{e}"
end
```

#### Using the data_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> data_delete_with_http_info

```ruby
begin
  
  data, status_code, headers = api_instance.data_delete_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->data_delete_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## data_metric_key_delete

> data_metric_key_delete(metric_key)



### Examples

```ruby
require 'time'
require 'databox'
# setup authorization
Databox.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Databox::DefaultApi.new
metric_key = 'metric_key_example' # String | 

begin
  
  api_instance.data_metric_key_delete(metric_key)
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->data_metric_key_delete: #{e}"
end
```

#### Using the data_metric_key_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> data_metric_key_delete_with_http_info(metric_key)

```ruby
begin
  
  data, status_code, headers = api_instance.data_metric_key_delete_with_http_info(metric_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->data_metric_key_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **metric_key** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## data_post

> data_post(opts)



### Examples

```ruby
require 'time'
require 'databox'
# setup authorization
Databox.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Databox::DefaultApi.new
opts = {
  push_data: [Databox::PushData.new] # Array<PushData> | 
}

begin
  
  api_instance.data_post(opts)
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->data_post: #{e}"
end
```

#### Using the data_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> data_post_with_http_info(opts)

```ruby
begin
  
  data, status_code, headers = api_instance.data_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->data_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **push_data** | [**Array&lt;PushData&gt;**](PushData.md) |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/vnd.databox.v2+json
- **Accept**: Not defined


## metrickeys_get

> metrickeys_get



### Examples

```ruby
require 'time'
require 'databox'
# setup authorization
Databox.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Databox::DefaultApi.new

begin
  
  api_instance.metrickeys_get
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->metrickeys_get: #{e}"
end
```

#### Using the metrickeys_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> metrickeys_get_with_http_info

```ruby
begin
  
  data, status_code, headers = api_instance.metrickeys_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->metrickeys_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## metrickeys_post

> metrickeys_post(opts)



### Examples

```ruby
require 'time'
require 'databox'
# setup authorization
Databox.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Databox::DefaultApi.new
opts = {
  body: { ... } # Object | 
}

begin
  
  api_instance.metrickeys_post(opts)
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->metrickeys_post: #{e}"
end
```

#### Using the metrickeys_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> metrickeys_post_with_http_info(opts)

```ruby
begin
  
  data, status_code, headers = api_instance.metrickeys_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->metrickeys_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **Object** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/vnd.databox.v2+json
- **Accept**: Not defined


## ping_get

> ping_get



### Examples

```ruby
require 'time'
require 'databox'
# setup authorization
Databox.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Databox::DefaultApi.new

begin
  
  api_instance.ping_get
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->ping_get: #{e}"
end
```

#### Using the ping_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> ping_get_with_http_info

```ruby
begin
  
  data, status_code, headers = api_instance.ping_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Databox::ApiError => e
  puts "Error when calling DefaultApi->ping_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

