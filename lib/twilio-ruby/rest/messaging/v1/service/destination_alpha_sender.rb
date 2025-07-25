##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Messaging
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Messaging < MessagingBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class DestinationAlphaSenderList < ListResource
                
                    ##
                    # Initialize the DestinationAlphaSenderList
                    # @param [Version] version Version that contains the resource
                    # @return [DestinationAlphaSenderList] DestinationAlphaSenderList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/DestinationAlphaSenders"
                        
                    end
                    ##
                    # Create the DestinationAlphaSenderInstance
                    # @param [String] alpha_sender The Alphanumeric Sender ID string. Can be up to 11 characters long. Valid characters are A-Z, a-z, 0-9, space, hyphen `-`, plus `+`, underscore `_` and ampersand `&`. This value cannot contain only numbers.
                    # @param [String] iso_country_code The Optional Two Character ISO Country Code the Alphanumeric Sender ID will be used for. If the IsoCountryCode is not provided, a default Alpha Sender will be created that can be used across all countries.
                    # @return [DestinationAlphaSenderInstance] Created DestinationAlphaSenderInstance
                    def create(
                        alpha_sender: nil, 
                        iso_country_code: :unset
                    )

                        data = Twilio::Values.of({
                            'AlphaSender' => alpha_sender,
                            'IsoCountryCode' => iso_country_code,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        DestinationAlphaSenderInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists DestinationAlphaSenderInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] iso_country_code Optional filter to return only alphanumeric sender IDs associated with the specified two-character ISO country code.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(iso_country_code: :unset, limit: nil, page_size: nil)
                        self.stream(
                            iso_country_code: iso_country_code,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] iso_country_code Optional filter to return only alphanumeric sender IDs associated with the specified two-character ISO country code.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(iso_country_code: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            iso_country_code: iso_country_code,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields DestinationAlphaSenderInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of DestinationAlphaSenderInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] iso_country_code Optional filter to return only alphanumeric sender IDs associated with the specified two-character ISO country code.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of DestinationAlphaSenderInstance
                    def page(iso_country_code: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'IsoCountryCode' => iso_country_code,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        DestinationAlphaSenderPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of DestinationAlphaSenderInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of DestinationAlphaSenderInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    DestinationAlphaSenderPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Messaging.V1.DestinationAlphaSenderList>'
                    end
                end


                class DestinationAlphaSenderContext < InstanceContext
                    ##
                    # Initialize the DestinationAlphaSenderContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) to fetch the resource from.
                    # @param [String] sid The SID of the AlphaSender resource to fetch.
                    # @return [DestinationAlphaSenderContext] DestinationAlphaSenderContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/DestinationAlphaSenders/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the DestinationAlphaSenderInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the DestinationAlphaSenderInstance
                    # @return [DestinationAlphaSenderInstance] Fetched DestinationAlphaSenderInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        DestinationAlphaSenderInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Messaging.V1.DestinationAlphaSenderContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Messaging.V1.DestinationAlphaSenderContext #{context}>"
                    end
                end

                class DestinationAlphaSenderPage < Page
                    ##
                    # Initialize the DestinationAlphaSenderPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DestinationAlphaSenderPage] DestinationAlphaSenderPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DestinationAlphaSenderInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DestinationAlphaSenderInstance] DestinationAlphaSenderInstance
                    def get_instance(payload)
                        DestinationAlphaSenderInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Messaging.V1.DestinationAlphaSenderPage>'
                    end
                end
                class DestinationAlphaSenderInstance < InstanceResource
                    ##
                    # Initialize the DestinationAlphaSenderInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this DestinationAlphaSender
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DestinationAlphaSenderInstance] DestinationAlphaSenderInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'alpha_sender' => payload['alpha_sender'],
                            'capabilities' => payload['capabilities'],
                            'url' => payload['url'],
                            'iso_country_code' => payload['iso_country_code'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [DestinationAlphaSenderContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = DestinationAlphaSenderContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the AlphaSender resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AlphaSender resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The Alphanumeric Sender ID string.
                    def alpha_sender
                        @properties['alpha_sender']
                    end
                    
                    ##
                    # @return [Array<String>] An array of values that describe whether the number can receive calls or messages. Can be: `SMS`.
                    def capabilities
                        @properties['capabilities']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the AlphaSender resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The Two Character ISO Country Code the Alphanumeric Sender ID will be used for. For Default Alpha Senders that work across countries, this value will be an empty string
                    def iso_country_code
                        @properties['iso_country_code']
                    end
                    
                    ##
                    # Delete the DestinationAlphaSenderInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the DestinationAlphaSenderInstance
                    # @return [DestinationAlphaSenderInstance] Fetched DestinationAlphaSenderInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Messaging.V1.DestinationAlphaSenderInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Messaging.V1.DestinationAlphaSenderInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


