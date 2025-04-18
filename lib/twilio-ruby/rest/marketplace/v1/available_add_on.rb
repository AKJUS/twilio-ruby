##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Marketplace
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Marketplace < MarketplaceBase
            class V1 < Version
                class AvailableAddOnList < ListResource
                
                    ##
                    # Initialize the AvailableAddOnList
                    # @param [Version] version Version that contains the resource
                    # @return [AvailableAddOnList] AvailableAddOnList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/AvailableAddOns"
                        
                    end
                
                    ##
                    # Lists AvailableAddOnInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AvailableAddOnInstance records from the API.
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
                    # Retrieve a single page of AvailableAddOnInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AvailableAddOnInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        AvailableAddOnPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AvailableAddOnInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AvailableAddOnInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AvailableAddOnPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Marketplace.V1.AvailableAddOnList>'
                    end
                end


                class AvailableAddOnContext < InstanceContext
                    ##
                    # Initialize the AvailableAddOnContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the AvailableAddOn resource to fetch.
                    # @return [AvailableAddOnContext] AvailableAddOnContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/AvailableAddOns/#{@solution[:sid]}"

                        # Dependents
                        @extensions = nil
                    end
                    ##
                    # Fetch the AvailableAddOnInstance
                    # @return [AvailableAddOnInstance] Fetched AvailableAddOnInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        AvailableAddOnInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the extensions
                    # @return [AvailableAddOnExtensionList]
                    # @return [AvailableAddOnExtensionContext] if sid was passed.
                    def extensions(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return AvailableAddOnExtensionContext.new(@version, @solution[:sid],sid )
                        end

                        unless @extensions
                            @extensions = AvailableAddOnExtensionList.new(
                                @version, available_add_on_sid: @solution[:sid], )
                        end

                     @extensions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Marketplace.V1.AvailableAddOnContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Marketplace.V1.AvailableAddOnContext #{context}>"
                    end
                end

                class AvailableAddOnPage < Page
                    ##
                    # Initialize the AvailableAddOnPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AvailableAddOnPage] AvailableAddOnPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AvailableAddOnInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AvailableAddOnInstance] AvailableAddOnInstance
                    def get_instance(payload)
                        AvailableAddOnInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Marketplace.V1.AvailableAddOnPage>'
                    end
                end
                class AvailableAddOnInstance < InstanceResource
                    ##
                    # Initialize the AvailableAddOnInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AvailableAddOn
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AvailableAddOnInstance] AvailableAddOnInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'friendly_name' => payload['friendly_name'],
                            'description' => payload['description'],
                            'pricing_type' => payload['pricing_type'],
                            'configuration_schema' => payload['configuration_schema'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AvailableAddOnContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AvailableAddOnContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the AvailableAddOn resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] A short description of the Add-on's functionality.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [String] How customers are charged for using this Add-on.
                    def pricing_type
                        @properties['pricing_type']
                    end
                    
                    ##
                    # @return [Hash] The JSON object with the configuration that must be provided when installing a given Add-on.
                    def configuration_schema
                        @properties['configuration_schema']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the AvailableAddOnInstance
                    # @return [AvailableAddOnInstance] Fetched AvailableAddOnInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the extensions
                    # @return [extensions] extensions
                    def extensions
                        context.extensions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Marketplace.V1.AvailableAddOnInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Marketplace.V1.AvailableAddOnInstance #{values}>"
                    end
                end

            end
        end
    end
end
