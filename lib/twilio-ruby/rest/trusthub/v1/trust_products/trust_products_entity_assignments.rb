##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Trusthub
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Trusthub < TrusthubBase
            class V1 < Version
                class TrustProductsContext < InstanceContext

                     class TrustProductsEntityAssignmentsList < ListResource
                
                    ##
                    # Initialize the TrustProductsEntityAssignmentsList
                    # @param [Version] version Version that contains the resource
                    # @return [TrustProductsEntityAssignmentsList] TrustProductsEntityAssignmentsList
                    def initialize(version, trust_product_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { trust_product_sid: trust_product_sid }
                        @uri = "/TrustProducts/#{@solution[:trust_product_sid]}/EntityAssignments"
                        
                    end
                    ##
                    # Create the TrustProductsEntityAssignmentsInstance
                    # @param [String] object_sid The SID of an object bag that holds information of the different items.
                    # @return [TrustProductsEntityAssignmentsInstance] Created TrustProductsEntityAssignmentsInstance
                    def create(
                        object_sid: nil
                    )

                        data = Twilio::Values.of({
                            'ObjectSid' => object_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        TrustProductsEntityAssignmentsInstance.new(
                            @version,
                            payload,
                            trust_product_sid: @solution[:trust_product_sid],
                        )
                    end

                
                    ##
                    # Lists TrustProductsEntityAssignmentsInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] object_type A string to filter the results by (EndUserType or SupportingDocumentType) machine-name. This is useful when you want to retrieve the entity-assignment of a specific end-user or supporting document.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(object_type: :unset, limit: nil, page_size: nil)
                        self.stream(
                            object_type: object_type,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] object_type A string to filter the results by (EndUserType or SupportingDocumentType) machine-name. This is useful when you want to retrieve the entity-assignment of a specific end-user or supporting document.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(object_type: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            object_type: object_type,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields TrustProductsEntityAssignmentsInstance records from the API.
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
                    # Retrieve a single page of TrustProductsEntityAssignmentsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] object_type A string to filter the results by (EndUserType or SupportingDocumentType) machine-name. This is useful when you want to retrieve the entity-assignment of a specific end-user or supporting document.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TrustProductsEntityAssignmentsInstance
                    def page(object_type: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'ObjectType' => object_type,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        TrustProductsEntityAssignmentsPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TrustProductsEntityAssignmentsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TrustProductsEntityAssignmentsInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TrustProductsEntityAssignmentsPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Trusthub.V1.TrustProductsEntityAssignmentsList>'
                    end
                end


                class TrustProductsEntityAssignmentsContext < InstanceContext
                    ##
                    # Initialize the TrustProductsEntityAssignmentsContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] trust_product_sid The unique string that we created to identify the TrustProduct resource.
                    # @param [String] sid The unique string that we created to identify the Identity resource.
                    # @return [TrustProductsEntityAssignmentsContext] TrustProductsEntityAssignmentsContext
                    def initialize(version, trust_product_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { trust_product_sid: trust_product_sid, sid: sid,  }
                        @uri = "/TrustProducts/#{@solution[:trust_product_sid]}/EntityAssignments/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the TrustProductsEntityAssignmentsInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the TrustProductsEntityAssignmentsInstance
                    # @return [TrustProductsEntityAssignmentsInstance] Fetched TrustProductsEntityAssignmentsInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        TrustProductsEntityAssignmentsInstance.new(
                            @version,
                            payload,
                            trust_product_sid: @solution[:trust_product_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.TrustProductsEntityAssignmentsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.TrustProductsEntityAssignmentsContext #{context}>"
                    end
                end

                class TrustProductsEntityAssignmentsPage < Page
                    ##
                    # Initialize the TrustProductsEntityAssignmentsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TrustProductsEntityAssignmentsPage] TrustProductsEntityAssignmentsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TrustProductsEntityAssignmentsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TrustProductsEntityAssignmentsInstance] TrustProductsEntityAssignmentsInstance
                    def get_instance(payload)
                        TrustProductsEntityAssignmentsInstance.new(@version, payload, trust_product_sid: @solution[:trust_product_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Trusthub.V1.TrustProductsEntityAssignmentsPage>'
                    end
                end
                class TrustProductsEntityAssignmentsInstance < InstanceResource
                    ##
                    # Initialize the TrustProductsEntityAssignmentsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this TrustProductsEntityAssignments
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TrustProductsEntityAssignmentsInstance] TrustProductsEntityAssignmentsInstance
                    def initialize(version, payload , trust_product_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'trust_product_sid' => payload['trust_product_sid'],
                            'account_sid' => payload['account_sid'],
                            'object_sid' => payload['object_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'trust_product_sid' => trust_product_sid  || @properties['trust_product_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TrustProductsEntityAssignmentsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TrustProductsEntityAssignmentsContext.new(@version , @params['trust_product_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Item Assignment resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the TrustProduct resource.
                    def trust_product_sid
                        @properties['trust_product_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Item Assignment resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of an object bag that holds information of the different items.
                    def object_sid
                        @properties['object_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Identity resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the TrustProductsEntityAssignmentsInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the TrustProductsEntityAssignmentsInstance
                    # @return [TrustProductsEntityAssignmentsInstance] Fetched TrustProductsEntityAssignmentsInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.TrustProductsEntityAssignmentsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.TrustProductsEntityAssignmentsInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


